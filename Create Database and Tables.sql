-- Create database
CREATE DATABASE AirlineReservation;
USE AirlineReservation;

-- Flights table
CREATE TABLE Flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(10) NOT NULL UNIQUE,
    origin VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    status ENUM('Scheduled', 'Delayed', 'Cancelled') DEFAULT 'Scheduled'
);

-- Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Seats table (seats available for each flight)
CREATE TABLE Seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_id INT,
    seat_number VARCHAR(5),
    seat_class ENUM('Economy', 'Business', 'First') DEFAULT 'Economy',
    is_booked BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_seat_flight FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Bookings table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    flight_id INT,
    seat_id INT,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Booked', 'Cancelled') DEFAULT 'Booked',
    CONSTRAINT fk_booking_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT fk_booking_flight FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    CONSTRAINT fk_booking_seat FOREIGN KEY (seat_id) REFERENCES Seats(seat_id),
    UNIQUE(flight_id, seat_id) -- Prevent double booking of the same seat on the same flight
);
