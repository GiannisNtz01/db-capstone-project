DELIMITER $$

CREATE PROCEDURE CancelOrder(IN p_orderID INT)
BEGIN
    DECLARE rows_affected INT;

    DELETE FROM Orders
    WHERE orderID = p_orderID;

  
    SET rows_affected = ROW_COUNT();

    IF rows_affected > 0 THEN
        SELECT CONCAT('Order ', p_orderID, ' canceled') AS message;
    ELSE
        SELECT CONCAT('Order ', p_orderID, ' not found') AS message;
    END IF;
END $$

DELIMITER ;

CALL CancelOrder(2);
SELECT * FROM Orders;