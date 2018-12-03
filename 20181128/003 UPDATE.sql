SELECT * FROM Customers
	WHERE City LIKE 'M%' AND Region = ''

UPDATE Customers
	SET Region = 'X'
	WHERE City LIKE 'M%' AND Region = ''