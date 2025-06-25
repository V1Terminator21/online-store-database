
-- Online Store Database Project

-- Create Customers Table
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Create Products Table
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

-- Create Orders Table
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    order_date DATE DEFAULT CURRENT_DATE,
    total_amount DECIMAL(10,2)
);

-- Create Payments Table
CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_date DATE DEFAULT CURRENT_DATE
);

-- Insert Sample Customers
INSERT INTO Customers (name, email, phone)
VALUES 
('Alice Johnson', 'alice@example.com', '9876543210'),
('Bob Smith', 'bob@example.com', '8765432109');

-- Insert Sample Products
INSERT INTO Products (name, price, stock)
VALUES 
('Smartphone', 15000.00, 20),
('Laptop', 55000.00, 10),
('Headphones', 2000.00, 50);

-- Place an Order
INSERT INTO Orders (customer_id, total_amount)
VALUES (1, 17000.00);

-- Update Product Stock After Purchase
UPDATE Products SET stock = stock - 1 WHERE product_id = 1;
UPDATE Products SET stock = stock - 1 WHERE product_id = 3;

-- Record Payment
INSERT INTO Payments (order_id, amount, payment_method)
VALUES (1, 17000.00, 'UPI');

-- Select Queries
-- View All Customers
SELECT * FROM Customers;

-- View All Products
SELECT * FROM Products;

-- View All Orders with Customer Name
SELECT o.order_id, c.name, o.order_date, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;
