-- CTE wyra¿enia tabelaryczne

WITH Obroty
	AS
	(SELECT * FROM Orders)
		SELECT * FROM Obroty
GO
WITH Obroty
	AS
	(SELECT OrderID, Orders.CustomerID, CompanyName, ContactName
		FROM Orders INNER JOIN
              Customers ON Orders.CustomerID = Customers.CustomerID)

		SELECT * FROM Obroty