SELECT City, COUNT(City) AS Liczba 
	FROM Customers
	GROUP BY City