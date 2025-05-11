-- Create Role table
CREATE TABLE Role (
  role_id VARCHAR PRIMARY KEY,
  description TEXT
);

-- Create User table
CREATE TABLE User (
  user_id VARCHAR PRIMARY KEY,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  email VARCHAR NOT NULL UNIQUE,
  password_hash VARCHAR NOT NULL,
  phone_number VARCHAR,
  role_id VARCHAR NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Create Property table
CREATE TABLE Property (
  property_id VARCHAR PRIMARY KEY,
  host_id VARCHAR NOT NULL,
  name VARCHAR NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR NOT NULL,
  price_per_night DECIMAL NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES User(user_id)
);

-- Create Booking table
CREATE TABLE Booking (
  booking_id VARCHAR PRIMARY KEY,
  property_id VARCHAR NOT NULL,
  user_id VARCHAR NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL NOT NULL,
  status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create Payment table
CREATE TABLE Payment (
  payment_id VARCHAR PRIMARY KEY,
  booking_id VARCHAR NOT NULL,
  amount DECIMAL NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  role_id VARCHAR NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
  FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Create Review table
CREATE TABLE Review (
  review_id VARCHAR PRIMARY KEY,
  property_id VARCHAR NOT NULL,
  user_id VARCHAR NOT NULL,
  rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create Message table
CREATE TABLE Message (
  message_id VARCHAR PRIMARY KEY,
  sender_id VARCHAR NOT NULL,
  recipient_id VARCHAR NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES User(user_id),
  FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);

-- Indexes for optimization
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);