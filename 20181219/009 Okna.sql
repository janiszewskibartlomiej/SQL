-- alternatywne oznaczenie kolumny
SELECT * FROM "Order Details"
-- podstawowe zastosowanie agregacji
SELECT CustomerID, SUM(Freight) 
	FROM Orders
		GROUP BY CustomerID
		Order BY CustomerID
-- okna
SELECT CustomerID, SUM(freight) OVER (ORDER BY CustomerID) FROM Orders
-- suma poúrednia dla klienta
SELECT CustomerID, Freight, SUM(freight) OVER (ORDER BY CustomerID) FROM Orders
-- wskaüniki
SELECT CustomerID, Freight / SUM(freight) OVER (ORDER BY CustomerID) FROM Orders
-- nr wiersza
SELECT CustomerID, ROW_NUMBER() OVER (ORDER BY CustomerID) FROM Orders
SELECT CustomerID, ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY CustomerID) FROM Orders
-- inne agregacje w oknach MIN / MAX / AVG / SUM
SELECT CustomerID, 
	MAX(freight) OVER (PARTITION BY CustomerID ORDER BY CustomerID) FROM Orders