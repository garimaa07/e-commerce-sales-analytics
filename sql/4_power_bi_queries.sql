--  POWER BI DASHBOARD METRICS

-- KPI 1 — Total Revenue
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- KPI 2 — Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- KPI 3 — Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- KPI 4 — Average Order Value
SELECT ROUND(AVG(total_amount), 2) AS avg_order_value
FROM orders;

-- KPI 5 — Repeat Customer Count
SELECT COUNT(*) AS repeat_customers
FROM (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) t;

-- Revenue Trend 
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Product Performance
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.item_total) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- city wise sales map
SELECT 
    c.city,
    SUM(o.total_amount) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY revenue DESC;



