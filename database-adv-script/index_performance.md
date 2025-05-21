| -> Window aggregate: rank() OVER (ORDER BY total_bookings desc ) (actual time=61.2..61.2 rows=3 loops=1)
-> Sort: total_bookings DESC (actual time=59..59 rows=3 loops=1)
-> Table scan on <temporary> (actual time=59..59 rows=3 loops=1)
-> Aggregate using temporary table (actual time=59..59 rows=3 loops=1)
-> Nested loop left join (cost=3.4 rows=2) (actual time=58.8..58.8 rows=3 loops=1)
-> Table scan on p (cost=1.2 rows=2) (actual time=58.2..58.2 rows=3 loops=1)
-> Covering index lookup on b using idx_booking_property_id (property_id=p.property_id) (cost=1.05 rows=1) (actual time=0.212..0.213 rows=0.667 loops=3)
|
