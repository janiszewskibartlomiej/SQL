SELECT	City AS Miasto, 
		City + ' ' + ISNULL(Region,'') AS Adres
		FROM Customers
