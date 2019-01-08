CREATE PROCEDURE Synchronizacja
AS

-- DROP TABLE IF EXISTS Zamówienia  !! od 2016
EXEC LogDodaj 3, 'start importu',''
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Zamówienia')
	BEGIN	
		DROP TABLE Zamówienia
		PRINT 'HELLO!'
		EXEC LogDodaj 3, 'kasujê tablê',''
	END
	EXEC LogDodaj 3, 'pobieram',''
SELECT * 
	INTO Zamówienia
	FROM Northwind.dbo.Orders
		WHERE YEAR(OrderDate) = (SELECT year(max(orderdate)) FROM Northwind.dbo.Orders);
	EXEC LogDodaj 3, 'uda³o siê',''