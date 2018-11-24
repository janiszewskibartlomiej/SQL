SELECT 
	CustomerID,
	SUM(Freight) AS £¹cznie
	FROM ORDERS
	GROUP BY CustomerID