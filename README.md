# BestPrice

*A simple and efficient web application for managing budgets, stores, products, and prices — built with Elixir & Phoenix.*


## 📘 Overview

**BestPrice** is a web application designed to help users create budgets and compare prices across multiple stores.
The system allows:

* Reusing stores and products across multiple budgets
* Creating price entries (store + product + price) for each budget
* Managing all records through a clean CRUD structure
* Providing a clear overview of prices to identify the best deals

Perfect for small businesses, personal budgeting, and price research.


## 🚀 Features

* **Budgets Management**
  Create, edit, list, and delete budgets.

* **Stores Management**
  Register stores and reuse them across different budgets.

* **Products Management**
  Register reusable products and associate them with price entries.

* **Budget Items (Price Entries)**
  Assign a store, product, and price to a specific budget.

* **Relational Structure**
  Budgets → Items → (Store + Product)

* **Phoenix-style CRUD Routes**


## 🛠️ Tech Stack

* **Elixir**
* **Phoenix Framework**
* **Ecto (PostgreSQL or any supported database)**
* **TailwindCSS** (optional, if using Phoenix default)
* **LiveView** (optional)


# 📚 Route Structure

## 1. Budgets

| Action        | Route               | Method    |
| ------------- | ------------------- | --------- |
| List Budgets  | `/budgets`          | GET       |
| New Budget    | `/budgets/new`      | GET       |
| Create Budget | `/budgets`          | POST      |
| View Budget   | `/budgets/:id`      | GET       |
| Edit Budget   | `/budgets/:id/edit` | GET       |
| Update Budget | `/budgets/:id`      | PUT/PATCH |
| Delete Budget | `/budgets/:id`      | DELETE    |


## 2. Stores

| Action       | Route              | Method    |
| ------------ | ------------------ | --------- |
| List Stores  | `/stores`          | GET       |
| New Store    | `/stores/new`      | GET       |
| Create Store | `/stores`          | POST      |
| View Store   | `/stores/:id`      | GET       |
| Edit Store   | `/stores/:id/edit` | GET       |
| Update Store | `/stores/:id`      | PUT/PATCH |
| Delete Store | `/stores/:id`      | DELETE    |


## 3. Products

| Action         | Route                | Method    |
| -------------- | -------------------- | --------- |
| List Products  | `/products`          | GET       |
| New Product    | `/products/new`      | GET       |
| Create Product | `/products`          | POST      |
| View Product   | `/products/:id`      | GET       |
| Edit Product   | `/products/:id/edit` | GET       |
| Update Product | `/products/:id`      | PUT/PATCH |
| Delete Product | `/products/:id`      | DELETE    |



## 4. Budget Items (Price Entries)

| Action      | Route                                | Method    |
| ----------- | ------------------------------------ | --------- |
| List Items  | `/budgets/:budget_id/items`          | GET       |
| New Item    | `/budgets/:budget_id/items/new`      | GET       |
| Create Item | `/budgets/:budget_id/items`          | POST      |
| Edit Item   | `/budgets/:budget_id/items/:id/edit` | GET       |
| Update Item | `/budgets/:budget_id/items/:id`      | PUT/PATCH |
| Delete Item | `/budgets/:budget_id/items/:id`      | DELETE    |

# 🗄️ Database Schema

## 1. budgets

| Field       | Type         | Description |
| ----------- | ------------ | ----------- |
| id          | UUID/Integer | Primary Key |
| name        | string       | Budget name |
| description | text         | Optional    |
| inserted_at | datetime     | Auto        |
| updated_at  | datetime     | Auto        |


## 2. stores

| Field       | Type         | Description |
| ----------- | ------------ | ----------- |
| id          | UUID/Integer | Primary Key |
| name        | string       | Store name  |
| address     | string       | Optional    |
| phone       | string       | Optional    |
| inserted_at | datetime     | Auto        |
| updated_at  | datetime     | Auto        |


## 3. products

| Field       | Type         | Description  |
| ----------- | ------------ | ------------ |
| id          | UUID/Integer | Primary Key  |
| name        | string       | Product name |
| description | text         | Optional     |
| category    | string       | Optional     |
| inserted_at | datetime     | Auto         |
| updated_at  | datetime     | Auto         |


## 4. budget_items

| Field       | Type             | Description         |
| ----------- | ---------------- | ------------------- |
| id          | UUID/Integer     | Primary Key         |
| budget_id   | FK → budgets.id  | Belongs to a budget |
| store_id    | FK → stores.id   | Selected store      |
| product_id  | FK → products.id | Selected product    |
| price       | decimal          | Price value         |
| notes       | text             | Optional            |
| inserted_at | datetime         | Auto                |
| updated_at  | datetime         | Auto                |

**Recommended unique index:**

```
unique_index(:budget_items, [:budget_id, :store_id, :product_id])
```

# 🧪 Running the Project

```bash
# Install dependencies
mix deps.get

# Setup the database
mix ecto.create
mix ecto.migrate

# Start Phoenix server
mix phx.server
```

Then visit:

```
http://localhost:4000
```

# 📂 Project Structure

```
bestprice/
  ├─ lib/
  │   ├─ bestprice/
  │   ├─ bestprice_web/
  │   └─ ...
  ├─ priv/
  │   ├─ repo/migrations/
  │   └─ static/
  ├─ assets/
  ├─ config/
  ├─ mix.exs
  └─ README.md
```

# 🤝 Contributing

Pull requests are welcome!
Feel free to open an issue for suggestions or bug reports.

# 📄 License

This project is licensed under the **MIT License**.


## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
