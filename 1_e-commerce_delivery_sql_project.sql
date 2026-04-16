
-- 📌 E-COMMERCE PRODUCT ANALYTICS PROJECT


-- 1. DATABASE SETUP

CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

-- 2. CORE TABLES

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    signup_date DATE
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    item_total DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 3. PRODUCT ANALYTICS TABLES (NEW ADDITIONS)

-- Tracks user behavior (for funnel analysis)
CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    event_type VARCHAR(50),
    event_time DATETIME,
    product_id INT
);

-- A/B Testing table
CREATE TABLE ab_test (
    customer_id INT,
    variant VARCHAR(10) -- A (control), B (test)
);

-- 4. SAMPLE DATA INSERTION

-- 5. BUSINESS METRICS

-- Total Revenue
SELECT SUM(total_amount) AS total_revenue FROM orders;

-- Total Orders
SELECT COUNT(*) AS total_orders FROM orders;

-- Average Order Value (AOV)
SELECT ROUND(AVG(total_amount), 2) AS avg_order_value FROM orders;

-- Customer Lifetime Value (CLV)
SELECT 
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS lifetime_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY lifetime_value DESC;

-- Repeat Customers
SELECT 
    COUNT(DISTINCT customer_id) AS repeat_customers
FROM (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) t;

-- 6. PRODUCT METRICS


-- Conversion Rate
-- Insight: % of users who made at least one purchase
SELECT 
  COUNT(DISTINCT customer_id) * 1.0 /
  (SELECT COUNT(*) FROM customers) AS conversion_rate
FROM orders;

-- Churn Rate
-- Insight: Users inactive in last 30 days
SELECT 
  COUNT(*) AS churned_users
FROM (
  SELECT customer_id, MAX(order_date) last_order
  FROM orders
  GROUP BY customer_id
) t
WHERE last_order < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- Retention (Cohort Analysis)
WITH first_purchase AS (
    SELECT customer_id, MIN(order_date) AS first_order
    FROM orders
    GROUP BY customer_id
),
activity AS (
    SELECT 
        o.customer_id,
        PERIOD_DIFF(
            DATE_FORMAT(o.order_date, '%Y%m'),
            DATE_FORMAT(f.first_order, '%Y%m')
        ) AS months_since_first
    FROM orders o
    JOIN first_purchase f ON o.customer_id = f.customer_id
)
SELECT 
    months_since_first,
    COUNT(DISTINCT customer_id) AS active_users
FROM activity
GROUP BY months_since_first
ORDER BY months_since_first;

-- 7. FUNNEL ANALYSIS


-- Insight: Identify drop-offs in user journey
WITH funnel AS (
  SELECT 
    customer_id,
    MAX(CASE WHEN event_type = 'visit' THEN 1 END) AS visit,
    MAX(CASE WHEN event_type = 'view_product' THEN 1 END) AS view,
    MAX(CASE WHEN event_type = 'add_to_cart' THEN 1 END) AS cart,
    MAX(CASE WHEN event_type = 'purchase' THEN 1 END) AS purchase
  FROM events
  GROUP BY customer_id
)

SELECT
  COUNT(*) AS total_users,
  SUM(view) / SUM(visit) AS visit_to_view,
  SUM(cart) / SUM(view) AS view_to_cart,
  SUM(purchase) / SUM(cart) AS cart_to_purchase
FROM funnel;


-- 8. A/B TESTING

-- Insight: Compare conversion between variants
SELECT 
    a.variant,
    COUNT(DISTINCT o.customer_id) * 1.0 / COUNT(DISTINCT a.customer_id) AS conversion_rate
FROM ab_test a
LEFT JOIN orders o ON a.customer_id = o.customer_id
GROUP BY a.variant;


-- 9. ADVANCED BUSINESS INSIGHTS

-- Revenue by Category
SELECT 
    p.category,
    SUM(oi.item_total) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Top Products
SELECT 
    p.product_name,
    SUM(oi.item_total) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- Customer Segmentation
SELECT 
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent,
    CASE 
        WHEN SUM(o.total_amount) >= 7000 THEN 'High Value'
        WHEN SUM(o.total_amount) >= 3000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS segment
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Payment Success Rate
SELECT 
    payment_status,
    COUNT(*) AS transactions
FROM payments
GROUP BY payment_status;

-- City-wise Revenue
SELECT 
    c.city,
    SUM(o.total_amount) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY revenue DESC;

-- Monthly Revenue Trend + Running Total
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS revenue,
    SUM(SUM(total_amount)) OVER (ORDER BY DATE_FORMAT(order_date, '%Y-%m')) AS cumulative_revenue
FROM orders
GROUP BY month;
