SELECT 
	CustomerID,
	SUM(Freight) AS ��cznie
	FROM ORDERS
	GROUP BY CustomerID