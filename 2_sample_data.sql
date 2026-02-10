Customers Table

| id | name          | city      | signup_date |
| -- | ------------- | --------- | ----------- |
| 1  | Amit Sharma   | Delhi     | 2024-01-15  |
| 2  | Neha Verma    | Mumbai    | 2024-02-10  |
| 3  | Rahul Mehta   | Bangalore | 2024-03-05  |
| 4  | Priya Singh   | Delhi     | 2024-03-20  |
| 5  | Karan Gupta   | Pune      | 2024-04-02  |
| 6  | Sneha Kapoor  | Chennai   | 2024-04-18  |
| 7  | Arjun Nair    | Bangalore | 2024-05-01  |
| 8  | Pooja Bansal  | Jaipur    | 2024-05-12  |
| 9  | Rohit Agarwal | Kolkata   | 2024-05-20  |
| 10 | Anjali Desai  | Ahmedabad | 2024-05-25  |
| 11 | Vikas Yadav   | Lucknow   | 2024-06-01  |
| 12 | Meera Iyer    | Chennai   | 2024-06-05  |

Products Table

| id | product_name         | category    | price |
| -- | -------------------- | ----------- | ----- |
| 1  | Wireless Mouse       | Electronics | 799   |
| 2  | Bluetooth Headphones | Electronics | 1999  |
| 3  | Yoga Mat             | Fitness     | 499   |
| 4  | Water Bottle         | Fitness     | 299   |
| 5  | Notebook Pack        | Stationery  | 199   |
| 6  | Office Chair         | Furniture   | 5499  |
| 7  | Study Table          | Furniture   | 7999  |
| 8  | LED Desk Lamp        | Electronics | 1299  |
| 9  | Gaming Keyboard      | Electronics | 2499  |
| 10 | Protein Powder       | Fitness     | 1999  |
| 11 | Desk Organizer       | Stationery  | 399   |
| 12 | Bookshelf            | Furniture   | 6499  |

Orders Table

| order_id | customer_id | order_date | total_amount |
| -------- | ----------- | ---------- | ------------ |
| 1        | 1           | 2024-05-10 | 2798         |
| 2        | 2           | 2024-05-11 | 499          |
| 3        | 3           | 2024-05-12 | 1999         |
| 4        | 1           | 2024-05-15 | 299          |
| 5        | 4           | 2024-05-16 | 5499         |
| 6        | 5           | 2024-05-17 | 1299         |
| 7        | 2           | 2024-05-18 | 699          |
| 8        | 6           | 2024-05-19 | 7999         |
| 9        | 9           | 2024-06-20 | 2499         |
| 10       | 10          | 2024-06-21 | 1999         |

Payments Table

| order_id | payment_method | payment_status |
| -------- | -------------- | -------------- |
| 1        | UPI            | Completed      |
| 2        | Credit Card    | Completed      |
| 3        | Debit Card     | Completed      |
| 4        | UPI            | Completed      |
| 5        | Net Banking    | Completed      |
| 6        | Credit Card    | Completed      |
| 7        | UPI            | Failed         |
| 8        | Debit Card     | Completed      |

