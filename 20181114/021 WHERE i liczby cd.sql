SELECT OrderID, ShipVia, Freight
	FROM Orders
	WHERE Freight != 11.61
--	WHERE Freight <> 11.61
--	WHERE Freight <= 11.61
--	WHERE Freight >= 11.61