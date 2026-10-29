# Company Sales Analysis — SQL

## About the project

This project is a small relational database for a fictional company. It stores information about employees, departments, products, customers, orders, and order items.

The goal is to practice SQL and analyze sales data using SQLite.

## Database tables

- `departments` — company departments
- `employees` — employee information
- `products` — product catalog
- `customers` — customer information
- `orders` — customer orders and their statuses
- `order_items` — products included in each order

## Analysis performed

1. Revenue and units sold by product
2. Monthly revenue from completed orders
3. Revenue by employee
4. Revenue by city
5. Average order value by city

## SQL skills demonstrated

- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`
- `JOIN` and `LEFT JOIN`
- Aggregate functions: `SUM()`, `COUNT()`
- Conditional aggregation with `CASE`
- Handling missing values with `COALESCE()`
- Date formatting with `strftime()`
- Calculating revenue and average order value

## Key findings

- Total revenue from completed orders: **9,480**
- Completed orders: **6**
- Highest-revenue city: **Tashkent — 6,945**
- Average order value in Tashkent: **1,736.25**
- Average order value in Samarkand: **1,267.50**

## Tools

- SQLite
- SQLiteStudio / Letos
- SQL

## Data

The database uses fictional sample data created for educational and portfolio purposes.