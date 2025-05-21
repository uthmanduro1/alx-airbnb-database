-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details 

SELECT     
    b.booking_id,    
    b.start_date,
    u.user_id,    
    u.first_name AS user_name,    
    u.email AS user_email,  
    p.property_id,    
    p.name AS property_name,    
    p.location,
    pay.payment_id,    
    pay.amount,    
    pay.payment_date 
FROM Booking b 
JOIN User u ON b.user_id = u.user_id 
JOIN Property p ON b.property_id = p.property_id 
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date BETWEEN '2025-01-01' AND '2025-12-31';


EXPLAIN
SELECT     
    b.booking_id,    
    b.start_date,
    u.user_id,    
    u.first_name AS user_name,    
    u.email AS user_email,  
    p.property_id,    
    p.name AS property_name,    
    p.location,
    pay.payment_id,    
    pay.amount,    
    pay.payment_date 
FROM Booking b 
JOIN User u ON b.user_id = u.user_id 
JOIN Property p ON b.property_id = p.property_id 
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date BETWEEN '2025-01-01' AND '2025-12-31';