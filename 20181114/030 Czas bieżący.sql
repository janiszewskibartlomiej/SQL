SELECT OrderID, 
	DATEDIFF(MONTH, OrderDate, GETDATE()) AS CzasOdWysy³ki
	FROM Orders
