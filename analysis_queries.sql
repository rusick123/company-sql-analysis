-- 1. Revenue by product
-- Показывает выручку и количество проданных единиц каждого товара.

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.sale_price) AS total_revenue
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
JOIN orders AS o
    ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;




-- 2. Monthly revenue
-- Показывает выручку и количество завершённых заказов по месяцам.

SELECT
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(DISTINCT o.order_id) AS completed_orders,
    SUM(oi.quantity * oi.sale_price) AS total_revenue
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY strftime('%Y-%m', o.order_date)
ORDER BY month;




-- 3. Revenue by employee
-- Показывает количество завершённых заказов и выручку каждого сотрудника.
-- Сотрудники без завершённых заказов тоже отображаются.

SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Completed' THEN o.order_id
    END) AS completed_orders,
    COALESCE(SUM(
        CASE
            WHEN o.status = 'Completed'
            THEN oi.quantity * oi.sale_price
            ELSE 0
        END
    ), 0) AS total_revenue
FROM employees AS e
LEFT JOIN orders AS o
    ON e.employee_id = o.employee_id
LEFT JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY e.employee_id, employee_name
ORDER BY total_revenue DESC;




-- 4. Revenue by city
-- Показывает количество завершённых заказов и выручку по городам.
-- Города без завершённых заказов отображаются с нулевыми значениями.

SELECT
    c.city,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Completed' THEN o.order_id
    END) AS completed_orders,
    COALESCE(SUM(
        CASE
            WHEN o.status = 'Completed'
            THEN oi.quantity * oi.sale_price
            ELSE 0
        END
    ), 0) AS total_revenue
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY c.city
ORDER BY total_revenue DESC;





-- 5. Average order value by city
-- Считает средний чек и количество завершённых заказов по каждому городу.
-- Средний чек = общая выручка / количество завершённых заказов.

SELECT
    c.city,
    COUNT(DISTINCT o.order_id) AS completed_orders,
    ROUND(
        SUM(oi.quantity * oi.sale_price) * 1.0
        / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY c.city
ORDER BY average_order_value DESC;