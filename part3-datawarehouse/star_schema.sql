-- Star schema designed for analytical querying and business intelligence reporting.

-- Create Dimension Table: Date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

INSERT INTO dim_date VALUES
(1, '2024-01-10', 10, 1, 2024),
(2, '2024-01-11', 11, 1, 2024),
(3, '2024-01-12', 12, 1, 2024),
(4, '2024-01-13', 13, 1, 2024),
(5, '2024-01-14', 14, 1, 2024);


-- Create Dimension Table: Store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO dim_store VALUES
(101, 'Reliance Store A', 'Mumbai'),
(102, 'Reliance Store B', 'Pune'),
(103, 'Reliance Store C', 'Delhi');


-- Create Dimension Table: Product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Cleaned category casing (e.g., Electronics instead of electronics/ELECTRONICS)
INSERT INTO dim_product VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Mobile', 'Electronics'),
(203, 'Shirt', 'Clothing'),
(204, 'Rice', 'Groceries'),
(205, 'Headphones', 'Electronics');


-- Create Fact Table: Sales
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- Insert cleaned and standardized data (no NULLs, consistent dates)
INSERT INTO fact_sales VALUES
(1, 1, 101, 201, 1, 55000.00),
(2, 1, 101, 205, 2, 4000.00),
(3, 2, 102, 202, 1, 20000.00),
(4, 2, 103, 203, 3, 4500.00),
(5, 3, 101, 204, 5, 2500.00),
(6, 3, 102, 201, 1, 55000.00),
(7, 4, 103, 205, 2, 4000.00),
(8, 4, 101, 203, 2, 3000.00),
(9, 5, 102, 204, 4, 2000.00),
(10, 5, 103, 202, 1, 20000.00);