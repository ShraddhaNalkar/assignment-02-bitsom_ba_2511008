-- This schema is normalized to 3NF to eliminate insert, update and delete anomalies.

-- Q1: Create Customers Table
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

INSERT INTO Customers VALUES
('C001', 'Amit Sharma', 'amit@gmail.com', 'Mumbai'),
('C002', 'Neha Patil', 'neha@gmail.com', 'Pune'),
('C003', 'Rahul Mehta', 'rahul@gmail.com', 'Delhi'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005', 'Karan Verma', 'karan@gmail.com', 'Bangalore');


-- Q2: Create Products Table
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO Products VALUES
('P001', 'Laptop', 'Electronics', 55000.00),
('P002', 'Mobile', 'Electronics', 20000.00),
('P003', 'Headphones', 'Accessories', 2000.00),
('P004', 'Keyboard', 'Accessories', 1500.00),
('P005', 'Mouse', 'Accessories', 800.00);


-- Q3: Create Sales Representatives Table
CREATE TABLE Sales_Reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

INSERT INTO Sales_Reps VALUES
('SR01', 'Deepak Joshi', 'Mumbai HQ, Nariman Point'),
('SR02', 'Anita Desai', 'Pune Office, Hinjewadi'),
('SR03', 'Rohit Singh', 'Delhi Office, Connaught Place'),
('SR04', 'Priya Nair', 'Chennai Office, T Nagar'),
('SR05', 'Vikas Gupta', 'Bangalore Office, Whitefield');


-- Q4: Create Orders Table
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);

INSERT INTO Orders VALUES
('O001', '2024-01-10', 'C001', 'SR01'),
('O002', '2024-01-12', 'C002', 'SR02'),
('O003', '2024-01-15', 'C003', 'SR03'),
('O004', '2024-01-18', 'C004', 'SR04'),
('O005', '2024-01-20', 'C005', 'SR05');


-- Q5: Create Order_Items Table (to handle multiple products per order)
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items VALUES
(1, 'O001', 'P001', 1),
(2, 'O001', 'P003', 2),
(3, 'O002', 'P002', 1),
(4, 'O003', 'P004', 1),
(5, 'O004', 'P005', 3);