SELECT OrderID, ShippedDate, 
	DATEADD(MONTH, 17, ShippedDate) AS TerminGwarancji
	FROM Orders