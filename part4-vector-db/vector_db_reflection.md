## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for a system that allows lawyers to search long contracts using natural language questions. Keyword search relies on exact word matches, which means it may fail when the wording in the query differs from the wording in the document. For example, a lawyer searching for "termination clauses" might miss relevant sections labeled as "contract cancellation" or "agreement ending terms." This limitation makes keyword-based systems unreliable for complex legal documents.

A vector database addresses this issue by enabling semantic search. In this approach, both the documents and the user queries are converted into vector embeddings that capture their meaning rather than just keywords. When a lawyer asks a question in plain English, the system compares the query embedding with embeddings of different sections of the contract and retrieves the most semantically similar results.

This allows the system to return relevant information even when the exact words do not match, significantly improving search accuracy. Additionally, vector databases are optimized for efficient similarity search across large datasets, making them suitable for handling lengthy documents like 500-page contracts.

Therefore, a vector database plays a crucial role in enabling intelligent, context-aware search, making it far more effective than traditional keyword-based approaches for legal document analysis.