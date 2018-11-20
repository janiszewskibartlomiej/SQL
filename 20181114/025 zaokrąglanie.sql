SELECT OrderID, ShipVia, Freight, 
	ROUND(Freight * 0.23, 2)  AS Transport_Brutto
	FROM Orders
