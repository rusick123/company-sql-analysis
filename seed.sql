
-- Seed data for Company Sales Analysis
-- Run after schema.sql on an empty database.

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- 1. Departments
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Sales'),
(2, 'IT'),
(3, 'Marketing'),
(4, 'HR');

-- 2. Employees
INSERT INTO employees
(employee_id, first_name, last_name, department_id, position, salary, hire_date)
VALUES
(1, 'Alex', 'Smith', 1, 'Sales Manager', 6500, '2024-03-15'),
(2, 'Emma', 'Johnson', 1, 'Sales Representative', 4200, '2025-01-10'),
(3, 'Daniel', 'Brown', 2, 'IT Specialist', 7000, '2023-08-20'),
(4, 'Sophia', 'Davis', 3, 'Marketing Specialist', 4800, '2024-11-01'),
(5, 'James', 'Wilson', 4, 'HR Manager', 5500, '2022-06-12'),
(6, 'Olivia', 'Taylor', 1, 'Sales Representative', 4000, '2025-05-05');

-- 3. Customers
INSERT INTO customers
(customer_id, customer_name, city, registration_date)
VALUES
(1, 'Global Tech', 'Tashkent', '2025-01-15'),
(2, 'Smart Office', 'Samarkand', '2025-02-20'),
(3, 'Future Systems', 'Tashkent', '2025-03-10'),
(4, 'Digital House', 'Bukhara', '2025-04-05'),
(5, 'Office Plus', 'Samarkand', '2025-05-18'),
(6, 'Tech Solutions', 'Tashkent', '2025-06-22');

-- 4. Products
INSERT INTO products
(product_id, product_name, category, price, stock_quantity)
VALUES
(1, 'Laptop', 'Electronics', 1200, 15),
(2, 'Monitor', 'Electronics', 300, 25),
(3, 'Keyboard', 'Accessories', 80, 50),
(4, 'Mouse', 'Accessories', 35, 80),
(5, 'Office Chair', 'Furniture', 180, 12),
(6, 'Desk', 'Furniture', 250, 8),
(7, 'Headphones', 'Electronics', 95, 30),
(8, 'USB Hub', 'Accessories', 25, 60);

-- 5. Orders
INSERT INTO orders
(order_id, customer_id, employee_id, order_date, status)
VALUES
(1, 1, 2, '2026-01-05', 'Completed'),
(2, 2, 1, '2026-01-12', 'Completed'),
(3, 3, 6, '2026-02-03', 'Completed'),
(4, 4, 2, '2026-02-14', 'Pending'),
(5, 5, 1, '2026-02-25', 'Completed'),
(6, 6, 6, '2026-03-02', 'Completed'),
(7, 1, 2, '2026-03-11', 'Cancelled'),
(8, 3, 1, '2026-03-20', 'Completed');

-- 6. Order items
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, sale_price)
VALUES
(1, 1, 1, 2, 1150),
(2, 1, 3, 5, 75),
(3, 2, 2, 4, 290),
(4, 2, 4, 10, 30),
(5, 3, 1, 1, 1180),
(6, 3, 7, 3, 90),
(7, 4, 5, 2, 170),
(8, 4, 6, 1, 240),
(9, 5, 2, 3, 285),
(10, 5, 8, 10, 22),
(11, 6, 1, 1, 1200),
(12, 6, 5, 4, 175),
(13, 7, 3, 3, 75),
(14, 8, 6, 2, 240),
(15, 8, 7, 5, 88);

COMMIT;
