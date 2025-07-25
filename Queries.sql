USE AirlineReservation;

--  Find Available Seats for a Specific Flight
SELECT f.flight_number, s.seat_number, s.seat_class
FROM Seats s
JOIN Flights f ON s.flight_id = f.flight_id
WHERE f.flight_number = 'AI101' AND s.is_booked = FALSE;

-- Customer’s Booking History
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       f.flight_number, f.origin, f.destination,
       s.seat_number, b.status, b.booking_date
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Flights f ON b.flight_id = f.flight_id
JOIN Seats s ON b.seat_id = s.seat_id
WHERE c.email = 'john.doe@example.com';

-- Flight Booking Summary
SELECT f.flight_number,
       COUNT(b.booking_id) AS total_bookings,
       SUM(CASE WHEN b.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_bookings,
       SUM(CASE WHEN b.status = 'Booked' THEN 1 ELSE 0 END) AS active_bookings
FROM Flights f
LEFT JOIN Bookings b ON f.flight_id = b.flight_id
GROUP BY f.flight_number;


-- Flight Schedule Between Cities
SELECT flight_number, departure_time, arrival_time, status
FROM Flights
WHERE origin = 'New York' AND destination = 'London';

--  Occupancy Rate for Each Flight
SELECT f.flight_number,
       COUNT(s.seat_id) AS total_seats,
       SUM(CASE WHEN s.is_booked THEN 1 ELSE 0 END) AS booked_seats,
       ROUND(SUM(CASE WHEN s.is_booked THEN 1 ELSE 0 END) / COUNT(s.seat_id) * 100, 2) AS occupancy_percentage
FROM Flights f
JOIN Seats s ON f.flight_id = s.flight_id
GROUP BY f.flight_number;

-- Booking Summary Report by Flight
SELECT f.flight_number,
       COUNT(b.booking_id) AS total_bookings,
       SUM(CASE WHEN b.status = 'Booked' THEN 1 ELSE 0 END) AS active_bookings,
       SUM(CASE WHEN b.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_bookings
FROM Flights f
LEFT JOIN Bookings b ON f.flight_id = b.flight_id
GROUP BY f.flight_number;



