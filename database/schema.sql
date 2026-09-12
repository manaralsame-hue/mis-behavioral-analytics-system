-- Behavioral Analytics & Performance Decision Support System (B-DSS)
-- Database Schema Definition

-- 1. Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Employees / Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role ENUM('Employee', 'Manager', 'Admin') DEFAULT 'Employee',
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 3. Behavioral Metric Categories Table
CREATE TABLE metric_categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    description TEXT,
    weight_score DECIMAL(3,2) DEFAULT 1.00
);

-- 4. Daily / Weekly Performance Logs Table
CREATE TABLE performance_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    log_date DATE NOT NULL,
    metric_value DECIMAL(5,2) NOT NULL,
    stress_indicator ENUM('Low', 'Medium', 'High') DEFAULT 'Low',
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES metric_categories(category_id)
);

-- 5. KPI Early Warning Thresholds
CREATE TABLE kpi_thresholds (
    threshold_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    warning_level ENUM('Green', 'Yellow', 'Red') NOT NULL,
    min_value DECIMAL(5,2) NOT NULL,
    max_value DECIMAL(5,2) NOT NULL,
    recommended_action TEXT,
    FOREIGN KEY (category_id) REFERENCES metric_categories(category_id)
);
