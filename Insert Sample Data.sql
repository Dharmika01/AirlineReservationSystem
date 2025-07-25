USE AirlineReservation;

-- 1. Flights (10 flights)
INSERT INTO Flights (flight_number, origin, destination, departure_time, arrival_time, status) VALUES
('AI101', 'New York', 'London', '2025-08-01 08:00:00', '2025-08-01 20:00:00', 'Scheduled'),
('AI102', 'London', 'New York', '2025-08-02 09:00:00', '2025-08-02 21:00:00', 'Scheduled'),
('AI103', 'New York', 'Paris', '2025-08-03 07:00:00', '2025-08-03 19:00:00', 'Delayed'),
('AI104', 'Paris', 'New York', '2025-08-04 10:00:00', '2025-08-04 22:00:00', 'Scheduled'),
('AI105', 'London', 'Paris', '2025-08-05 12:00:00', '2025-08-05 14:00:00', 'Cancelled'),
('AI106', 'Paris', 'London', '2025-08-06 15:00:00', '2025-08-06 17:00:00', 'Scheduled'),
('AI107', 'New York', 'Tokyo', '2025-08-07 06:00:00', '2025-08-07 22:00:00', 'Scheduled'),
('AI108', 'Tokyo', 'New York', '2025-08-08 08:00:00', '2025-08-08 23:00:00', 'Scheduled'),
('AI109', 'London', 'Dubai', '2025-08-09 13:00:00', '2025-08-09 21:00:00', 'Scheduled'),
('AI110', 'Dubai', 'London', '2025-08-10 14:00:00', '2025-08-10 22:00:00', 'Scheduled');

-- 2. Customers (20 customers)
INSERT INTO Customers (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321'),
('Alice', 'Johnson', 'alice.johnson@example.com', '5551234567'),
('Bob', 'Brown', 'bob.brown@example.com', '4449876543'),
('Charlie', 'Davis', 'charlie.davis@example.com', '3332221111'),
('Diana', 'Miller', 'diana.miller@example.com', '2223334444'),
('Edward', 'Wilson', 'edward.wilson@example.com', '1112223333'),
('Fiona', 'Moore', 'fiona.moore@example.com', '7778889999'),
('George', 'Taylor', 'george.taylor@example.com', '6665554444'),
('Hannah', 'Anderson', 'hannah.anderson@example.com', '9998887777'),
('Ian', 'Thomas', 'ian.thomas@example.com', '1212121212'),
('Jessica', 'Jackson', 'jessica.jackson@example.com', '3434343434'),
('Kevin', 'White', 'kevin.white@example.com', '5656565656'),
('Laura', 'Harris', 'laura.harris@example.com', '7878787878'),
('Michael', 'Martin', 'michael.martin@example.com', '9090909090'),
('Nina', 'Lee', 'nina.lee@example.com', '1010101010'),
('Oscar', 'Clark', 'oscar.clark@example.com', '2323232323'),
('Paula', 'Lewis', 'paula.lewis@example.com', '4545454545'),
('Quinn', 'Robinson', 'quinn.robinson@example.com', '6767676767'),
('Rachel', 'Walker', 'rachel.walker@example.com', '8989898989');

-- 3. Seats for flights
-- Each flight gets 8 seats for simplicity: 2 First, 2 Business, 4 Economy

-- Helper for bulk seat inserts for 10 flights
INSERT INTO Seats (flight_id, seat_number, seat_class) VALUES
(1, '1A', 'First'), (1, '1B', 'First'), (1, '2A', 'Business'), (1, '2B', 'Business'), (1, '10C', 'Economy'), (1, '10D', 'Economy'), (1, '11C', 'Economy'), (1, '11D', 'Economy'),
(2, '1A', 'First'), (2, '1B', 'First'), (2, '2A', 'Business'), (2, '2B', 'Business'), (2, '10C', 'Economy'), (2, '10D', 'Economy'), (2, '11C', 'Economy'), (2, '11D', 'Economy'),
(3, '1A', 'First'), (3, '1B', 'First'), (3, '2A', 'Business'), (3, '2B', 'Business'), (3, '10C', 'Economy'), (3, '10D', 'Economy'), (3, '11C', 'Economy'), (3, '11D', 'Economy'),
(4, '1A', 'First'), (4, '1B', 'First'), (4, '2A', 'Business'), (4, '2B', 'Business'), (4, '10C', 'Economy'), (4, '10D', 'Economy'), (4, '11C', 'Economy'), (4, '11D', 'Economy'),
(5, '1A', 'First'), (5, '1B', 'First'), (5, '2A', 'Business'), (5, '2B', 'Business'), (5, '10C', 'Economy'), (5, '10D', 'Economy'), (5, '11C', 'Economy'), (5, '11D', 'Economy'),
(6, '1A', 'First'), (6, '1B', 'First'), (6, '2A', 'Business'), (6, '2B', 'Business'), (6, '10C', 'Economy'), (6, '10D', 'Economy'), (6, '11C', 'Economy'), (6, '11D', 'Economy'),
(7, '1A', 'First'), (7, '1B', 'First'), (7, '2A', 'Business'), (7, '2B', 'Business'), (7, '10C', 'Economy'), (7, '10D', 'Economy'), (7, '11C', 'Economy'), (7, '11D', 'Economy'),
(8, '1A', 'First'), (8, '1B', 'First'), (8, '2A', 'Business'), (8, '2B', 'Business'), (8, '10C', 'Economy'), (8, '10D', 'Economy'), (8, '11C', 'Economy'), (8, '11D', 'Economy'),
(9, '1A', 'First'), (9, '1B', 'First'), (9, '2A', 'Business'), (9, '2B', 'Business'), (9, '10C', 'Economy'), (9, '10D', 'Economy'), (9, '11C', 'Economy'), (9, '11D', 'Economy'),
(10, '1A', 'First'), (10, '1B', 'First'), (10, '2A', 'Business'), (10, '2B', 'Business'), (10, '10C', 'Economy'), (10, '10D', 'Economy'), (10, '11C', 'Economy'), (10, '11D', 'Economy');

-- 4. Bookings (20 bookings spread over flights/customers/seats)

INSERT INTO Bookings (customer_id, flight_id, seat_id, booking_date, status) VALUES
-- Flight 1 bookings
(1, 1, (SELECT seat_id FROM Seats WHERE flight_id=1 AND seat_number='1A'), '2025-07-01 09:00:00', 'Booked'),
(2, 1, (SELECT seat_id FROM Seats WHERE flight_id=1 AND seat_number='2A'), '2025-07-02 10:00:00', 'Booked'),
(3, 1, (SELECT seat_id FROM Seats WHERE flight_id=1 AND seat_number='10C'), '2025-07-03 11:00:00', 'Cancelled'),

-- Flight 2 bookings
(4, 2, (SELECT seat_id FROM Seats WHERE flight_id=2 AND seat_number='1B'), '2025-07-04 12:00:00', 'Booked'),
(5, 2, (SELECT seat_id FROM Seats WHERE flight_id=2 AND seat_number='2B'), '2025-07-05 13:00:00', 'Booked'),

-- Flight 3 bookings
(6, 3, (SELECT seat_id FROM Seats WHERE flight_id=3 AND seat_number='1A'), '2025-07-06 14:00:00', 'Booked'),
(7, 3, (SELECT seat_id FROM Seats WHERE flight_id=3 AND seat_number='10D'), '2025-07-07 15:00:00', 'Booked'),

-- Flight 4 bookings
(8, 4, (SELECT seat_id FROM Seats WHERE flight_id=4 AND seat_number='11C'), '2025-07-08 16:00:00', 'Booked'),

-- Flight 5 bookings (Cancelled flight)
(9, 5, (SELECT seat_id FROM Seats WHERE flight_id=5 AND seat_number='1B'), '2025-07-09 17:00:00', 'Cancelled'),

-- Flight 6 bookings
(10, 6, (SELECT seat_id FROM Seats WHERE flight_id=6 AND seat_number='2A'), '2025-07-10 18:00:00', 'Booked'),

-- Flight 7 bookings
(11, 7, (SELECT seat_id FROM Seats WHERE flight_id=7 AND seat_number='1A'), '2025-07-11 19:00:00', 'Booked'),
(12, 7, (SELECT seat_id FROM Seats WHERE flight_id=7 AND seat_number='10C'), '2025-07-12 20:00:00', 'Booked'),

-- Flight 8 bookings
(13, 8, (SELECT seat_id FROM Seats WHERE flight_id=8 AND seat_number='2B'), '2025-07-13 21:00:00', 'Booked'),

-- Flight 9 bookings
(14, 9, (SELECT seat_id FROM Seats WHERE flight_id=9 AND seat_number='1B'), '2025-07-14 22:00:00', 'Booked'),

-- Flight 10 bookings
(15, 10, (SELECT seat_id FROM Seats WHERE flight_id=10 AND seat_number='10D'), '2025-07-15 23:00:00', 'Booked'),

-- More customer bookings for diversity
(16, 1, (SELECT seat_id FROM Seats WHERE flight_id=1 AND seat_number='11D'), '2025-07-16 08:00:00', 'Booked'),
(17, 2, (SELECT seat_id FROM Seats WHERE flight_id=2 AND seat_number='11C'), '2025-07-17 09:00:00', 'Booked'),
(18, 3, (SELECT seat_id FROM Seats WHERE flight_id=3 AND seat_number='2B'), '2025-07-18 10:00:00', 'Cancelled'),
(19, 4, (SELECT seat_id FROM Seats WHERE flight_id=4 AND seat_number='10C'), '2025-07-19 11:00:00', 'Booked'),
(20, 5, (SELECT seat_id FROM Seats WHERE flight_id=5 AND seat_number='10D'), '2025-07-20 12:00:00', 'Booked');
