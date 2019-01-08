CREATE PROCEDURE Synchronizacja
AS

-- DROP TABLE IF EXISTS Zam�wienia  !! od 2016
EXEC LogDodaj 3, 'start importu',''
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Zam�wienia')
	BEGIN	
		DROP TABLE Zam�wienia
		PRINT 'HELLO!'
		EXEC LogDodaj 3, 'kasuj� tabl�',''
	END
	EXEC LogDodaj 3, 'pobieram',''
SELECT * 
	INTO Zam�wienia
	FROM Northwind.dbo.Orders
		WHERE YEAR(OrderDate) = (SELECT year(max(orderdate)) FROM Northwind.dbo.Orders);
	EXEC LogDodaj 3, 'uda�o si�',''