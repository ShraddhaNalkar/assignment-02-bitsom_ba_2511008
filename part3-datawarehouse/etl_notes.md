## ETL Decisions

### Decision 1 - Date Standardization
Problem: The raw dataset contained inconsistent date formats such as DD-MM-YYYY, MM/DD/YYYY and text-based formats. This makes it difficult to perform accurate time-based analysis.

Resolution: All dates were converted into a standard ISO format (YYYY-MM-DD) before loading into the data warehouse. A separate date dimension table (dim_date) was created with structured attributes like day, month and year to support efficient analytical queries.

---

### Decision 2 — Category Normalization
Problem: Product categories in the raw data had inconsistent casing such as "electronics", "ELECTRONICS" and "Electronics". This leads to incorrect aggregation results in reports.

Resolution: All category values were standardized to proper case (e.g. "Electronics", "Clothing", "Groceries") before inserting into the dim_product table. This ensures accurate grouping and reporting.

---

### Decision 3 — Handling Missing and NULL Values
Problem: The raw dataset contained NULL or missing values in important fields such as quantity and total_amount, which could distort analysis and aggregations.

Resolution: Missing numeric values were either cleaned or replaced with appropriate defaults where applicable and invalid rows were excluded. All fact table fields were ensured to be NOT NULL to maintain data integrity and reliable reporting.