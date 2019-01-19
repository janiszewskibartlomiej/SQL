CREATE PROCEDURE TransakcjaX
AS
BEGIN TRANSACTION
	INSERT INTO Customers	
		(CustomerID, CompanyName, ContactName)
		VALUES
		('ZBCVT'   , 'Firma X'  , 'Pan Y')
	UPDATE Customers
		SET City = 'Berlin'
		WHERE CustomerID = 'ZBCVT'
COMMIT TRANSACTION

-- DELETE FROM Customers WHERE CustomerID = 'ZBCVT'