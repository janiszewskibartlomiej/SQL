SELECT	City AS Miasto, 
		CONCAT_WS(' ', City, Region, Address) AS Adres
		FROM Customers
		-- CONCAT_WS od wersji SQL 2014
