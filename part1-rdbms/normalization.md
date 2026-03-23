## Anomaly Analysis

### Insert Anomaly
In the orders_flat.csv file, product details such as product_id, product_name, category, and unit_price are stored only when an order exists.

For example, a new product (e.g., P010 - Wireless Mouse) cannot be added unless an order_id is also created.

Columns involved: product_id, product_name, category, unit_price, order_id

This is an insert anomaly because product data cannot be inserted independently of order data.

---

### Update Anomaly
In the dataset, the same sales representative appears multiple times with slightly different office addresses.

For example:
sales_rep_id = SR01 has:
- "Mumbai HQ, Nariman Point, Mumbai - 400021"
- "Mumbai HQ, Nariman Pt, Mumbai - 400021"

Columns involved: sales_rep_id, sales_rep_name, office_address

This is an update anomaly because updating the address requires changes in multiple rows, and missing any row leads to inconsistent data.

---

### Delete Anomaly
If a customer has only one order and that row is deleted, all their information is also lost.

For example, deleting the only order for customer_id = C001 removes:
- customer_name
- customer_email
- customer_city

Columns involved: customer_id, customer_name, customer_email, customer_city, order_id

This is a delete anomaly because deleting an order unintentionally deletes customer data.

## Normalization Justification

While keeping all data in a single table may appear simpler initially, it introduces significant data integrity and maintenance issues. In the given dataset, customer, product, order and sales representative details are all stored together, leading to redundancy and anomalies.

For example, the same sales representative’s office address is repeated across multiple rows. If the address changes, it must be updated in every row, increasing the risk of inconsistencies. Similarly, product details such as price and category are duplicated for every order containing that product. This not only wastes storage but also creates update anomalies where inconsistent values may appear.

Insert anomalies are also evident. A new product cannot be added unless an order is created, which is impractical. Likewise, deleting a single order may result in the loss of important customer or product information, demonstrating a delete anomaly.

Normalization resolves these issues by separating data into logical tables such as Customers, Products, Orders and Sales Representatives. Each entity is stored only once and relationships are maintained using foreign keys. This eliminates redundancy, ensures consistency and makes updates more efficient and reliable.

Therefore, normalization is not over-engineering but a necessary design approach to ensure data accuracy, scalability and maintainability in real-world systems.