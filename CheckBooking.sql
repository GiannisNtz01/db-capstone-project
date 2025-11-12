DELIMITER //

CREATE PROCEDURE CheckBooking(
    IN p_date DATE,
    IN p_tableNumber INT
)
BEGIN
    DECLARE booking_status INT;

    SELECT COUNT(*) INTO booking_status
    FROM Reservations
    WHERE reservationDate = p_date
      AND tableNumber = p_tableNumber;

    IF booking_status > 0 THEN
        SELECT CONCAT('Table ', p_tableNumber, ' is already booked on ', p_date) AS message;
    ELSE
        SELECT CONCAT('Table ', p_tableNumber, ' is available on ', p_date) AS message;
    END IF;
END //

DELIMITER ;
CALL CheckBooking("2022-11-12",3);