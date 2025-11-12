INSERT INTO Reservations (reservationID,reservationDate,tableNumber,customerID)
VALUES (1,"2022-10-10",5,1),
(2,"2022-11-12",3,3),
(3,"2022-10-11",2,2),
(4,"2022-10-13",2,1);

ALTER TABLE Reservations
MODIFY reservationID INT NOT NULL AUTO_INCREMENT;

SELECT * FROM Reservations;