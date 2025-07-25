USE AirlineReservation;

-- Trigger – Sync Seat Status When Booking Is Cancelled/Booked
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
