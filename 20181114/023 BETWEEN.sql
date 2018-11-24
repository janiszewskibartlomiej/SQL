SELECT OrderID, ShipVia, Freight
	FROM Orders
	WHERE Freight BETWEEN 10 AND 50 
		AND ShipVia = 1 -- ni¿szy priorytet AND
