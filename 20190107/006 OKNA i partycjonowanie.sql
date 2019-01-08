-- kwerenda bazowa
SELECT * 
	FROM Customers
-- nr wierszy
SELECT ROW_NUMBER() OVER (ORDER BY Country) AS Lp, *
	FROM Customers
-- nr wierszy wg kraju
SELECT ROW_NUMBER() OVER (PARTITION BY Country ORDER BY Country ) AS Lp, *
	FROM Customers
-- bazowa 2
SELECT Orders.OrderID, CompanyName, UnitPrice, Quantity
	FROM Orders INNER JOIN
    [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID
-- funkcje okien
SELECT OrderID, Firma, Cena, Iloœæ, Wartoœæ,
SUM(Wartoœæ) OVER (PARTITION BY OrderID ORDER BY OrderID) AS SumaZamówienia
FROM
(SELECT Orders.OrderID, CompanyName AS Firma, UnitPrice AS Cena, Quantity AS Iloœæ, 
	UnitPrice * Quantity AS Wartoœæ 
	FROM Orders INNER JOIN
    [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID) AS X
-- funkcje okien - wskaŸniki
SELECT OrderID, Firma, Cena, Iloœæ, Wartoœæ,
Wartoœæ / SUM(Wartoœæ) OVER (PARTITION BY OrderID ORDER BY OrderID) AS ProcentZamówienia
FROM
(SELECT Orders.OrderID, CompanyName AS Firma, UnitPrice AS Cena, Quantity AS Iloœæ, 
	UnitPrice * Quantity AS Wartoœæ 
	FROM Orders INNER JOIN
    [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID) AS X
-- funkcje okien - inne
SELECT OrderID, Firma, Cena, Iloœæ, Wartoœæ,
SUM(Wartoœæ) OVER (PARTITION BY OrderID ORDER BY OrderID) AS SumaZamówienia,
MAX(Wartoœæ) OVER (PARTITION BY OrderID ORDER BY OrderID) AS MaksZamówienie,
MIN(Wartoœæ) OVER (PARTITION BY OrderID ORDER BY OrderID) AS MinZamówienia,
AVG(Wartoœæ) OVER (PARTITION BY OrderID ORDER BY OrderID) AS ŒrednieZamówienia
FROM
(SELECT Orders.OrderID, CompanyName AS Firma, UnitPrice AS Cena, Quantity AS Iloœæ, 
	UnitPrice * Quantity AS Wartoœæ 
	FROM Orders INNER JOIN
    [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID) AS X