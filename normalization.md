# Database Normalization Report (3NF Compliance)

## Objective

Normalize the Airbnb-style schema to Third Normal Form (3NF) to eliminate redundancy and ensure data integrity.

## Third Normal Form (3NF) Criteria

A relation is in 3NF if:

1. It is in 2NF (no partial dependencies).
2. There are no transitive dependencies (non-key attributes depend only on the primary key).

## Table-by-Table Analysis

### User

- All fields are dependent on `user_id`.
- No derived or transitive data.

### Property

- Belongs to a host via `host_id`.
- Atomic fields: name, description, location, price_per_night.

### Booking

- Depends entirely on `booking_id`.
- `total_price` could be derived. Consider computing it dynamically unless pricing logic justifies its presence.

### Payment

- Fully dependent on `payment_id`.
- `role` ENUM is context-specific. Optionally normalize to a `Role` table.

### Message

- Atomic and dependent on `message_id`.

### Review

- Proper dependency on `review_id`.
