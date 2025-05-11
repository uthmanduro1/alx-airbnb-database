-- Sample data inserts for Airbnb schema

-- Roles
INSERT INTO Role (role_id, description) VALUES
  ('guest', 'Standard guest user'),
  ('host', 'User who can list and manage properties'),
  ('admin', 'Platform administrator');

-- Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role_id) VALUES
  ('u1', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw_1', '123-456-7890', 'guest'),
  ('u2', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw_2', '321-654-0987', 'host'),
  ('u3', 'Carol', 'White', 'carol@example.com', 'hashed_pw_3', '234-567-8901', 'admin');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night) VALUES
  ('p1', 'u2', 'Seaside Cottage', 'A cozy cottage by the sea.', 'California', 120.00),
  ('p2', 'u2', 'Downtown Loft', 'Modern loft in the city center.', 'New York', 180.00);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
  ('b1', 'p1', 'u1', '2025-07-01', '2025-07-05', 480.00, 'confirmed'),
  ('b2', 'p2', 'u1', '2025-08-10', '2025-08-12', 360.00, 'pending');

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, role_id) VALUES
  ('pay1', 'b1', 480.00, '2025-06-30 10:00:00', 'guest'),
  ('pay2', 'b2', 360.00, '2025-08-09 15:00:00', 'guest');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
  ('r1', 'p1', 'u1', 5, 'Amazing stay! Highly recommend.'),
  ('r2', 'p2', 'u1', 4, 'Great location, a bit noisy.');

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
  ('m1', 'u1', 'u2', 'Hi, is the Seaside Cottage available in July?', '2025-05-01 09:00:00'),
  ('m2', 'u2', 'u1', 'Yes, it's available from the 1st to 5th.', '2025-05-01 10:00:00');
