DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN p_date DATE,
    IN p_tableNumber INT,
    IN p_customerID INT
)
BEGIN
    DECLARE booking_count INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO booking_count
    FROM Reservations
    WHERE reservationDate = p_date
      AND tableNumber = p_tableNumber;

    IF booking_count > 0 THEN
        -- Αν υπάρχει ήδη κράτηση, ακύρωσε τη συναλλαγή
        ROLLBACK;
        SELECT CONCAT('Booking cancelled: Table ', p_tableNumber, ' is already booked on ', p_date) AS message;
    ELSE
        -- Αν δεν υπάρχει, πρόσθεσε τη νέα κράτηση
        INSERT INTO Reservations (reservationDate, tableNumber, customerID)
        VALUES (p_date, p_tableNumber, p_customerID);

        COMMIT;
        SELECT CONCAT('Booking confirmed: Table ', p_tableNumber, ' successfully booked for ', p_date) AS message;
    END IF;
END //

DELIMITER ;
CALL AddValidBooking('2025-11-20', 5, 1);
