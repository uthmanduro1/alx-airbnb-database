-- Create Role table
CREATE TABLE Role (
  role_id VARCHAR(255) PRIMARY KEY,
  description TEXT
);

-- Create User table
CREATE TABLE User (
  user_id VARCHAR(255) PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255),
  role_id VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Create Property table
CREATE TABLE Property (
  property_id VARCHAR(255) PRIMARY KEY,
  host_id VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR(255) NOT NULL,
  price_per_night DECIMAL NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES User(user_id)
);

-- Create Booking table
CREATE TABLE Booking (
  booking_id VARCHAR(255) PRIMARY KEY,
  property_id VARCHAR(255) NOT NULL,
  user_id VARCHAR(255) NOT NULL,
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
  payment_id VARCHAR(255) PRIMARY KEY,
  booking_id VARCHAR(255) NOT NULL,
  amount DECIMAL NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  role_id VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
  FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Create Review table
CREATE TABLE Review (
  review_id VARCHAR(255) PRIMARY KEY,
  property_id VARCHAR(255) NOT NULL,
  user_id VARCHAR(255) NOT NULL,
  rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create Message table
CREATE TABLE Message (
  message_id VARCHAR(255) PRIMARY KEY,
  sender_id VARCHAR(255) NOT NULL,
  recipient_id VARCHAR(255) NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES User(user_id),
  FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);

