SELECT OrderID, ShipVia, Freight, 
	Freight * 0.23 AS Transport_Brutto
	FROM Orders

