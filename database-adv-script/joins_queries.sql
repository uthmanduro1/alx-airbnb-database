-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT 
    Booking.booking_id,
    Booking.property_id,   
    Booking.start_date,    
    Booking.end_date,   
    User.user_id,    
    User.first_name,    
    User.email 
FROM Booking 
INNER JOIN User ON Booking.user_id = User.user_id
ORDER BY Booking.booking_id;

-- Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
select 
    name, 
    description, 
    location, 
    price_per_night, 
    Review.comment, 
    Review.rating 
from Property 
left join Review on Property.property_id = Review.property_id;

-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

SELECT
    u.user_id,    
    u.first_name,    
    b.booking_id,    
    b.start_date 
FROM User u 
LEFT JOIN  Booking b ON u.user_id = b.user_id 
UNION 
SELECT     
    u.user_id,  
    u.first_name,    
    b.booking_id,    
    b.start_date 
FROM User u 
RIGHT JOIN Booking b ON u.user_id = b.user_id 
WHERE u.user_id IS NULL;