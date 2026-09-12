-- Insert Departments
INSERT INTO departments (department_name) VALUES 
('Human Resources'),
('Software Engineering'),
('Data Analytics');

-- Insert Sample Users
INSERT INTO users (full_name, email, role, department_id, hire_date) VALUES 
('Sarah Ahmed', 'sarah@example.com', 'Manager', 3, '2023-01-15'),
('Omar Ali', 'omar@example.com', 'Employee', 2, '2023-06-01'),
('Lina Hassan', 'lina@example.com', 'Employee', 3, '2024-02-10');

-- Insert Metric Categories
INSERT INTO metric_categories (category_name, description, weight_score) VALUES 
('Task Completion', 'Percentage of assigned tasks completed on time', 1.20),
('Engagement Rate', 'Active participation in team communications & reviews', 1.00),
('Punctuality', 'Adherence to scheduled shifts and meetings', 0.80);

-- Insert KPI Thresholds
INSERT INTO kpi_thresholds (category_id, warning_level, min_value, max_value, recommended_action) VALUES 
(1, 'Green', 85.00, 100.00, 'Maintain current pace'),
(1, 'Yellow', 60.00, 84.99, 'Review task workload and bottlenecks'),
(1, 'Red', 0.00, 59.99, 'Schedule one-on-one performance alignment session');
