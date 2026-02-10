-- Create Database
CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

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

INSERT INTO customers (name, city, signup_date) VALUES
('Amit Sharma', 'Delhi', '2024-01-15'),
('Neha Verma', 'Mumbai', '2024-02-10'),
('Rahul Mehta', 'Bangalore', '2024-03-05'),
('Priya Singh', 'Delhi', '2024-03-20'),
('Karan Gupta', 'Pune', '2024-04-02'),
('Sneha Kapoor', 'Chennai', '2024-04-18'),
('Arjun Nair', 'Bangalore', '2024-05-01'),
('Pooja Bansal', 'Jaipur', '2024-05-12');

INSERT INTO products (product_name, category, price) VALUES
('Wireless Mouse', 'Electronics', 799.00),
('Bluetooth Headphones', 'Electronics', 1999.00),
('Yoga Mat', 'Fitness', 499.00),
('Water Bottle', 'Fitness', 299.00),
('Notebook Pack', 'Stationery', 199.00),
('Office Chair', 'Furniture', 5499.00),
('Study Table', 'Furniture', 7999.00),
('LED Desk Lamp', 'Electronics', 1299.00);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-05-10', 2798.00),
(2, '2024-05-11', 499.00),
(3, '2024-05-12', 1999.00),
(1, '2024-05-15', 299.00),
(4, '2024-05-16', 5499.00),
(5, '2024-05-17', 1299.00),
(2, '2024-05-18', 699.00),
(6, '2024-05-19', 7999.00);

INSERT INTO order_items (order_id, product_id, quantity, item_total) VALUES
(1, 1, 1, 799.00),
(1, 2, 1, 1999.00),
(2, 3, 1, 499.00),
(3, 2, 1, 1999.00),
(4, 4, 1, 299.00),
(5, 6, 1, 5499.00),
(6, 8, 1, 1299.00),
(7, 5, 2, 398.00),
(7, 4, 1, 299.00),
(8, 7, 1, 7999.00);

INSERT INTO payments (order_id, payment_method, payment_status) VALUES
(1, 'UPI', 'Completed'),
(2, 'Credit Card', 'Completed'),
(3, 'Debit Card', 'Completed'),
(4, 'UPI', 'Completed'),
(5, 'Net Banking', 'Completed'),
(6, 'Credit Card', 'Completed'),
(7, 'UPI', 'Failed'),
(8, 'Debit Card', 'Completed');

INSERT INTO customers (name, city, signup_date) VALUES
('Rohit Agarwal', 'Kolkata', '2024-05-20'),
('Anjali Desai', 'Ahmedabad', '2024-05-25'),
('Vikas Yadav', 'Lucknow', '2024-06-01'),
('Meera Iyer', 'Chennai', '2024-06-05'),
('Siddharth Jain', 'Delhi', '2024-06-10'),
('Nikita Sharma', 'Mumbai', '2024-06-12'),
('Aditya Kulkarni', 'Pune', '2024-06-15'),
('Kavya Reddy', 'Hyderabad', '2024-06-18');

INSERT INTO products (product_name, category, price) VALUES
('Gaming Keyboard', 'Electronics', 2499.00),
('Protein Powder', 'Fitness', 1999.00),
('Desk Organizer', 'Stationery', 399.00),
('Bookshelf', 'Furniture', 6499.00),
('Smart Watch', 'Electronics', 4999.00),
('Resistance Bands', 'Fitness', 699.00);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(9, '2024-06-20', 2499.00),
(10, '2024-06-21', 1999.00),
(11, '2024-06-22', 399.00),
(12, '2024-06-23', 6499.00),
(13, '2024-06-24', 4999.00),
(14, '2024-06-25', 699.00),
(3, '2024-06-26', 1299.00),
(5, '2024-06-27', 1999.00),
(1, '2024-06-28', 499.00),
(8, '2024-06-29', 799.00);

INSERT INTO order_items (order_id, product_id, quantity, item_total) VALUES
(9, 9, 1, 2499.00),
(10, 10, 1, 1999.00),
(11, 11, 1, 399.00),
(12, 12, 1, 6499.00),
(13, 13, 1, 4999.00),
(14, 14, 1, 699.00),
(15, 8, 1, 1299.00),
(16, 2, 1, 1999.00),
(17, 3, 1, 499.00),
(18, 1, 1, 799.00);

INSERT INTO payments (order_id, payment_method, payment_status) VALUES
(9, 'UPI', 'Completed'),
(10, 'Credit Card', 'Completed'),
(11, 'Debit Card', 'Completed'),
(12, 'Net Banking', 'Completed'),
(13, 'UPI', 'Completed'),
(14, 'Credit Card', 'Completed'),
(15, 'Debit Card', 'Completed'),
(16, 'UPI', 'Completed'),
(17, 'Net Banking', 'Completed'),
(18, 'Credit Card', 'Failed');

-- Monthly Revenue Trend
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS monthly_revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Revenue by Product Category
SELECT 
    p.category,
    SUM(oi.item_total) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Top 5 Selling Products
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 5;

-- Top customers by spending 
SELECT 
    c.name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- Repeat Customers 
SELECT 
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.order_id) > 1;

-- Customer Lifetime Value(CLV)
SELECT 
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS lifetime_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY lifetime_value DESC;

-- Most Profitable Products (Revenue Ranking) 
SELECT 
    p.product_name,
    SUM(oi.item_total) AS revenue,
    RANK() OVER (ORDER BY SUM(oi.item_total) DESC) AS revenue_rank
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

-- Low Performing Products
SELECT 
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY units_sold ASC;

-- Business Health Metrics
-- Payment Success vs Failure Rate
SELECT 
    payment_status,
    COUNT(*) AS total_transactions
FROM payments
GROUP BY payment_status;

-- Average Order Value(AOV)
SELECT 
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders;

-- City-wise Revenue Contribution
SELECT 
    c.city,
    SUM(o.total_amount) AS city_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY city_revenue DESC;

-- Customer Segmentation (High / Medium / Low Value)
SELECT 
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent,
    CASE 
        WHEN SUM(o.total_amount) >= 7000 THEN 'High Value'
        WHEN SUM(o.total_amount) >= 3000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;
-- Used in dashboard: customer distribution by segment

-- Repeat Purchase Rate
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT CASE WHEN order_count > 1 THEN customer_id END) AS repeat_customers,
    ROUND(
        COUNT(DISTINCT CASE WHEN order_count > 1 THEN customer_id END) 
        * 100.0 / COUNT(DISTINCT customer_id), 2
    ) AS repeat_purchase_rate_percent
FROM (
    SELECT customer_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
) t;

-- Monthly Revenue with Running Total * shows growth momentum
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS monthly_revenue,
    SUM(SUM(total_amount)) OVER (
        ORDER BY YEAR(order_date), MONTH(order_date)
    ) AS running_revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date);

-- Customer Retention (Month-over-Month)
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(DISTINCT customer_id) AS active_customers
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
-- Used in PowerBI for retention Trend

-- Top category per month 
WITH category_sales AS (
    SELECT 
        YEAR(o.order_date) AS year,
        MONTH(o.order_date) AS month,
        p.category,
        SUM(oi.item_total) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY year, month, p.category
)
SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY year, month ORDER BY revenue DESC) AS rank_in_month
    FROM category_sales
) ranked
WHERE rank_in_month = 1;

-- Order Value Distribution (Business Insight)
SELECT 
    CASE 
        WHEN total_amount < 500 THEN 'Low Value Order'
        WHEN total_amount BETWEEN 500 AND 3000 THEN 'Medium Value Order'
        ELSE 'High Value Order'
    END AS order_segment,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_segment;

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



