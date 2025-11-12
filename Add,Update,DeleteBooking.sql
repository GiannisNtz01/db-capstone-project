DELIMITER //

CREATE PROCEDURE AddBooking(
    IN p_reservationID INT,
    IN p_customerID INT,
    IN p_reservationDate DATE,
    IN p_tableNumber INT
)
BEGIN
    INSERT INTO Reservations (reservationID, customerID, reservationDate, tableNumber)
    VALUES (p_reservationID, p_customerID, p_reservationDate, p_tableNumber);
    
    SELECT 'New booking added' AS message;
END //

DELIMITER ;
CALL AddBooking(6,4,'2022-12-12',5);

DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN p_reservationID INT,
    IN p_newDate DATE
)
BEGIN
    UPDATE Reservations
    SET reservationDate = p_newDate
    WHERE reservationID = p_reservationID;

    SELECT CONCAT('Booking ', p_reservationID, ' updated successfully!') AS message;
END //

DELIMITER ;
CALL UpdateBooking(5,'2022-12-10');


DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN p_reservationID INT
)
BEGIN
    DECLARE rows_affected INT;

    DELETE FROM Reservations
    WHERE reservationID = p_reservationID;

    SET rows_affected = ROW_COUNT();

    IF rows_affected > 0 THEN
        SELECT CONCAT('Booking ', p_reservationID, ' canceled successfully!') AS message;
    ELSE
        SELECT CONCAT('Booking ', p_reservationID, ' not found.') AS message;
    END IF;
END //

DELIMITER ;
CALL CancelBooking(5);

