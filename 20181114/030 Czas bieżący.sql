SELECT OrderID, 
	DATEDIFF(MONTH, OrderDate, GETDATE()) AS CzasOdWysy�ki
	FROM Orders
