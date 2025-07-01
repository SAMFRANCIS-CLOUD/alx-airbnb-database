# AirBnB Database Requirements

## 📘 Entities and Attributes

---

### 🧑‍💼 User

- `user_id`: **Primary Key**, UUID, Indexed
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, NULL
- `role`: ENUM (guest, host, admin), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 🏠 Property

- `property_id`: **Primary Key**, UUID, Indexed
- `host_id`: Foreign Key → User(user_id)
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `location`: VARCHAR, NOT NULL
- `pricepernight`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

---

### 📅 Booking

- `booking_id`: **Primary Key**, UUID, Indexed
- `property_id`: Foreign Key → Property(property_id)
- `user_id`: Foreign Key → User(user_id)
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (pending, confirmed, canceled), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 💳 Payment

- `payment_id`: **Primary Key**, UUID, Indexed
- `booking_id`: Foreign Key → Booking(booking_id)
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `payment_method`: ENUM (credit_card, paypal, stripe), NOT NULL

---

### ⭐ Review

- `review_id`: **Primary Key**, UUID, Indexed
- `property_id`: Foreign Key → Property(property_id)
- `user_id`: Foreign Key → User(user_id)
- `rating`: INTEGER, CHECK (rating >= 1 AND rating <= 5), NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 💬 Message

- `message_id`: **Primary Key**, UUID, Indexed
- `sender_id`: Foreign Key → User(user_id)
- `recipient_id`: Foreign Key → User(user_id)
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## 🔐 Constraints Summary

### ✅ User Table

- `email` must be unique
- Required fields: `first_name`, `last_name`, `email`, `password_hash`, `role`

### ✅ Property Table

- Foreign key: `host_id → User(user_id)`

### ✅ Booking Table

- Foreign keys: `property_id`, `user_id`
- `status`: ENUM must be one of `pending`, `confirmed`, `canceled`

### ✅ Payment Table

- Foreign key: `booking_id → Booking(booking_id)`

### ✅ Review Table

- `rating` must be between 1 and 5
- Foreign keys: `property_id`, `user_id`

### ✅ Message Table

- Foreign keys: `sender_id`, `recipient_id`

---

## 🔍 Indexing

- All Primary Keys: Indexed by default
- Additional Indexes:
  - `email` in User table
  - `property_id` in Property and Booking tables
  - `booking_id` in Booking and Payment tables
# Database Normalization - AirBnB Project

## Objective
To normalize the AirBnB database schema to **Third Normal Form (3NF)** by eliminating redundancies and ensuring efficient structure.

---

## 1. First Normal Form (1NF)

**Rule:** Eliminate repeating groups and ensure each field contains only atomic values.

✅ **All tables are in 1NF**:
- Every column contains atomic (indivisible) values.
- There are no repeating fields or arrays.

Example:
- The `User` table has individual fields for `first_name`, `last_name`, `email`, etc.
- The `Booking` table stores one record per reservation.

---

## 2. Second Normal Form (2NF)

**Rule:** Ensure that all non-key attributes are fully dependent on the **entire** primary key (only applies to composite keys).

✅ **All tables use single-column primary keys (UUIDs)**, so:
- There are no partial dependencies.
- Every non-key attribute depends on its table’s primary key.

---

## 3. Third Normal Form (3NF)

**Rule:** Eliminate transitive dependencies (non-key columns should not depend on other non-key columns).

✅ **Design passes 3NF**:
- In the `User` table, `role` is directly related to the user — not another attribute.
- In the `Booking` table, `total_price` depends on the booking itself, not on `start_date` or `end_date` alone.
- All columns in all tables depend only on the primary key.

---

## Summary

The database schema follows normalization rules:

| Table      | 1NF | 2NF | 3NF |
|------------|-----|-----|-----|
| User       | ✅  | ✅  | ✅  |
| Property   | ✅  | ✅  | ✅  |
| Booking    | ✅  | ✅  | ✅  |
| Payment    | ✅  | ✅  | ✅  |
| Review     | ✅  | ✅  | ✅  |
| Message    | ✅  | ✅  | ✅  |

✅ The schema is fully normalized to **3NF**. No further changes were needed based on the design provided.
