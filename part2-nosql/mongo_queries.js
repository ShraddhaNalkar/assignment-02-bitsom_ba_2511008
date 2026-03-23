// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "P1001",
    name: "Samsung 55-inch Smart TV",
    category: "Electronics",
    brand: "Samsung",
    price: 65000,
    currency: "INR",
    specifications: {
      screen_size: "55 inches",
      resolution: "4K UHD",
      voltage: "220-240V",
      smart_features: ["Netflix", "YouTube", "Prime Video"]
    },
    warranty: {
      period: "2 years",
      type: "Manufacturer",
      service_centers: ["Mumbai", "Pune", "Bangalore"]
    },
    stock: 25
  },
  {
    _id: "P2001",
    name: "Men's Cotton Casual Shirt",
    category: "Clothing",
    brand: "Allen Solly",
    price: 1499,
    currency: "INR",
    sizes_available: ["S", "M", "L", "XL"],
    material: "Cotton",
    stock: { S: 10, M: 20, L: 15, XL: 5 }
  },
  {
    _id: "P3001",
    name: "Organic Whole Wheat Flour",
    category: "Groceries",
    brand: "Aashirvaad",
    price: 320,
    currency: "INR",
    expiry_date: new Date("2026-06-30"),
    manufacture_date: new Date("2025-12-01"),
    nutritional_info: {
      energy: "340 kcal",
      protein: "12 g"
    },
    stock: 100
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "P1001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

// This index improves query performance for frequent searches by category,
// such as filtering Electronics or Groceries products. It reduces full collection scans
// and speeds up read operations, especially for large datasets.