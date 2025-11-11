PREPARE GetOrderDetail FROM
'SELECT orderID, quantity, totalAmount 
 FROM Orders 
 WHERE customerID = ?';
 
 -- Ορισμός μεταβλητής για το CustomerID
SET @id = 101;

-- Εκτέλεση της prepared statement
EXECUTE GetOrderDetail USING @id;