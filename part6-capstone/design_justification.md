## Storage Systems

The architecture uses a combination of specialized storage systems to address the four goals of the hospital network.

For patient readmission prediction, historical treatment data is stored in a Data Warehouse. This enables efficient aggregation, feature engineering, and model training on structured and cleaned data. The warehouse supports analytical workloads required for machine learning.

For enabling doctors to query patient history in natural language, a Vector Database is used. Patient records and doctor notes are converted into embeddings and stored in this database, allowing semantic search. This ensures that queries like “cardiac event” can retrieve relevant information even if exact keywords differ.

For monthly management reporting, a Data Warehouse is again used, as it is optimized for OLAP queries such as aggregations, trends, and department-wise analysis. It ensures fast and reliable reporting.

For real-time ICU vitals, a Data Lake is used to store high-volume streaming data in its raw format. A streaming system (such as Kafka) ingests real-time data, which can later be processed for alerts and analytics. Additionally, a Relational Database is used for operational patient records requiring strong consistency and transactional integrity.

---

## OLTP vs OLAP Boundary

The OLTP system in this architecture consists of the Relational Database that manages patient records, admissions, treatments, and billing. This system handles day-to-day transactional operations requiring high consistency, low latency, and frequent updates.

The OLAP system begins at the Data Warehouse and Data Lake layers. Data from the OLTP system is periodically extracted, transformed, and loaded into the warehouse for analytical processing. The warehouse supports complex queries, reporting, and machine learning workflows.

The Vector Database sits slightly between OLTP and OLAP. While it is derived from operational data, it is used primarily for analytical and search purposes rather than transactions. Similarly, the Data Lake acts as a staging and storage layer for large-scale analytical processing.

Thus, the boundary lies at the ETL/streaming layer, where transactional data is transformed and moved into analytical systems.

---

## Trade-offs

One significant trade-off in this design is increased system complexity due to the use of multiple specialized storage systems (Relational DB, Data Warehouse, Data Lake, and Vector Database). While this improves performance and scalability for different use cases, it also increases operational overhead, data synchronization challenges, and maintenance effort.

To mitigate this, a unified data pipeline strategy can be implemented using centralized orchestration tools. Automated ETL and streaming pipelines ensure consistent data movement between systems. Additionally, adopting a Data Lakehouse approach in the future could reduce complexity by combining features of data lakes and warehouses.

Proper data governance, monitoring, and schema management practices can further ensure consistency across systems. By balancing specialization with integration, the architecture can achieve both flexibility and maintainability.