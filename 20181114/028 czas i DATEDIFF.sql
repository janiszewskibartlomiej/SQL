SELECT OrderID, 
	DATEDIFF(day, OrderDate, ShippedDate) AS CzasDostawy
	FROM Orders
