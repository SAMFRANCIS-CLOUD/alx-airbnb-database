# Database Normalization - AirBnB Project

## 🎯 Objective
Normalize the AirBnB database schema to **Third Normal Form (3NF)** to reduce redundancy and ensure data integrity.

---

## 1️⃣ First Normal Form (1NF)

- Each table has a **primary key**.
- All columns contain **atomic** values (no repeating groups or arrays).
- Example: `User` table has `first_name`, `last_name` instead of `full_name`.

✅ All tables meet 1NF.

---

## 2️⃣ Second Normal Form (2NF)

- Tables are in 1NF.
- All non-key columns are **fully dependent** on the entire primary key.
- No partial dependencies since all tables use **single-column primary keys (UUIDs)**.

✅ All tables meet 2NF.

---

## 3️⃣ Third Normal Form (3NF)

- Tables are in 2NF.
- There are **no transitive dependencies**:
  - No non-key column depends on another non-key column.
  - Example: In `Booking`, `status` is not derived from `start_date` or `end_date`.

✅ All tables meet 3NF.

---

## ✅ Summary

| Table     | 1NF | 2NF | 3NF |
|-----------|-----|-----|-----|
| User      | ✅  | ✅  | ✅  |
| Property  | ✅  | ✅  | ✅  |
| Booking   | ✅  | ✅  | ✅  |
| Payment   | ✅  | ✅  | ✅  |
| Review    | ✅  | ✅  | ✅  |
| Message   | ✅  | ✅  | ✅  |

The database design is fully normalized to **Third Normal Form** and ready for efficient querying and maintenance.
