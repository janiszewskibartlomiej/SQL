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
SELECT OrderID, Firma, Cena, Ilo��, Warto��,
SUM(Warto��) OVER (PARTITION BY OrderID ORDER BY OrderID) AS SumaZam�wienia
FROM
(SELECT Orders.OrderID, CompanyName AS Firma, UnitPrice AS Cena, Quantity AS Ilo��, 
	UnitPrice * Quantity AS Warto�� 
	FROM Orders INNER JOIN
    [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID) AS X
-- funkcje okien - wska�niki
SELECT OrderID, Firma, Cena, Ilo��, Warto��,
Warto�� / SUM(Warto��) OVER (PARTITION BY OrderID ORDER BY OrderID) AS ProcentZam�wienia
FROM
(SELECT Orders.OrderID, CompanyName AS Firma, UnitPrice AS Cena, Quantity AS Ilo��, 
	UnitPrice * Quantity AS Warto�� 
	FROM Orders INNER JOIN
    [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID) AS X
-- funkcje okien - inne
SELECT OrderID, Firma, Cena, Ilo��, Warto��,
SUM(Warto��) OVER (PARTITION BY OrderID ORDER BY OrderID) AS SumaZam�wienia,
MAX(Warto��) OVER (PARTITION BY OrderID ORDER BY OrderID) AS MaksZam�wienie,
MIN(Warto��) OVER (PARTITION BY OrderID ORDER BY OrderID) AS MinZam�wienia,
AVG(Warto��) OVER (PARTITION BY OrderID ORDER BY OrderID) AS �rednieZam�wienia
FROM
(SELECT Orders.OrderID, CompanyName AS Firma, UnitPrice AS Cena, Quantity AS Ilo��, 
	UnitPrice * Quantity AS Warto�� 
	FROM Orders INNER JOIN
    [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID) AS X