# ✈️ Airline Reservation System (SQL Project)

A SQL-based Airline Reservation System designed to simulate real-world flight booking operations, customer management, seat availability tracking, and booking summaries with automated sync between booking status and seat status.

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Status](https://img.shields.io/badge/project-active-brightgreen)

---

## 📁 Project Structure

| File Name                                   | Description                                                                 |
|--------------------------------------------|-----------------------------------------------------------------------------|
| `Create Database and Tables.sql`           | Creates the `AirlineReservation` database and schema (Flights, Seats, etc.) |
| `Insert Sample Data.sql`                   | Populates the database with sample flights, customers, seats, and bookings  |
| `Booking Operations & Seat Status Sync.sql`| Performs booking + updates seat status (auto-sync)                          |
| `Queries.sql`                              | Useful queries (booking history, flight availability, occupancy rates, etc.)|
| `Trigger.sql`                              | Trigger to maintain `Seats.is_booked` when a booking is updated             |

---

## 🚀 Getting Started

### ✅ Prerequisites

- MySQL 8+ installed
- MySQL Workbench or any compatible client

### ⚙️ Setup Instructions

```bash
# Step 1: Clone the repository
git clone https://github.com/your-username/airline-reservation-sql.git
cd airline-reservation-sql

# Step 2: Open the following SQL files in order
1. Create Database and Tables.sql
2. Insert Sample Data.sql
3. Trigger.sql
4. Booking Operations & Seat Status Sync.sql
5. Queries.sql
````

---

## 🛠️ Features

* **Flight Management**: Add and track flight routes and statuses
* **Seat Tracking**: Monitor seat availability by class and flight
* **Booking Operations**: Insert/update bookings with real-time seat status sync
* **Customer Profiles**: Manage customer details and booking history
* **Trigger-Driven Sync**: Automatically updates `Seats.is_booked` on booking status change
* **Analytics**: Run queries like occupancy rates, flight schedules, booking summaries

---

## 📊 Sample Queries

> 🔍 **Available Seats for a Flight**

```sql
SELECT f.flight_number, s.seat_number, s.seat_class
FROM Seats s
JOIN Flights f ON s.flight_id = f.flight_id
WHERE f.flight_number = 'AI101' AND s.is_booked = FALSE;
```

> 🧾 **Customer Booking History**

```sql
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       f.flight_number, f.origin, f.destination,
       s.seat_number, b.status, b.booking_date
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Flights f ON b.flight_id = f.flight_id
JOIN Seats s ON b.seat_id = s.seat_id
WHERE c.email = 'john.doe@example.com';
```

> 📈 **Occupancy Rate Per Flight**

```sql
SELECT f.flight_number,
       COUNT(s.seat_id) AS total_seats,
       SUM(CASE WHEN s.is_booked THEN 1 ELSE 0 END) AS booked_seats,
       ROUND(SUM(CASE WHEN s.is_booked THEN 1 ELSE 0 END) / COUNT(s.seat_id) * 100, 2) AS occupancy_percentage
FROM Flights f
JOIN Seats s ON f.flight_id = s.flight_id
GROUP BY f.flight_number;
```

---

## 🔁 Booking Status Trigger

The following trigger ensures real-time seat availability management whenever a booking is updated:

```sql
DELIMITER $$

CREATE TRIGGER trg_update_seat_status
BEFORE UPDATE ON Bookings
FOR EACH ROW
BEGIN
  IF NEW.status = 'Cancelled' AND OLD.status = 'Booked' THEN
    UPDATE Seats SET is_booked = FALSE WHERE seat_id = OLD.seat_id;
  ELSEIF NEW.status = 'Booked' AND OLD.status = 'Cancelled' THEN
    UPDATE Seats SET is_booked = TRUE WHERE seat_id = NEW.seat_id;
  END IF;
END$$

DELIMITER ;
```

---

## 📌 Use Cases

* Build and simulate airline systems in SQL
* Learn data integrity and normalization with triggers and joins
* Practice with real-world analytics queries in relational DBMS
* Great for academic or demo projects involving airline booking logic

---

## 🙌 Contribution

Contributions, feedback, and improvements are welcome!
Feel free to fork, star ⭐, and submit pull requests!

---

## 📧 Contact

For questions, reach out at: `kattadharmika01@gmail.com`

```

