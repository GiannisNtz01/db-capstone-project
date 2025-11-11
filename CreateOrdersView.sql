-- question 1 --
CREATE VIEW OrdersView AS
SELECT 
    orderID,
    quantity,
    totalAmount AS cost
FROM Orders
WHERE quantity > 2;

-- question 2--
SELECT 
    c.customerID,
    CONCAT(c.firstName, ' ', c.lastName) AS fullName,
    o.orderID,
    o.totalAmount AS cost,
    m.name AS menuName,
    mi.courseName AS courseName
FROM Orders o
JOIN Customers c ON o.customerID = c.customerID
JOIN Menu m ON o.menuItemID = m.menuItemID
JOIN MenuItems mi ON o.menuItemID = mi.menuItemID
WHERE o.totalAmount > 150
ORDER BY o.totalAmount ASC;
-- question 3  --
SELECT name
FROM Menu
WHERE menuItemID = ANY (
    SELECT menuItemID
    FROM Orders
    WHERE quantity > 2
);


