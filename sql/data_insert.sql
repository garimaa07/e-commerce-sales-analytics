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

