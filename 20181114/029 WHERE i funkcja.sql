SELECT OrderID, 
	DATEDIFF(DAY, OrderDate, ShippedDate) AS CzasDostawy
	FROM Orders
	WHERE DATEDIFF(DAY, OrderDate, ShippedDate) > 7
