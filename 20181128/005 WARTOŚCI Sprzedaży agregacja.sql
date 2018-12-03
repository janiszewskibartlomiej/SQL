-- KROK 1 - ILE KOSZTUJE PRODUKT
SELECT ProductID, UnitPrice 
FROM Products
-- KROK 2 - ILE KOSZTUJE POZYCJA ZAM�WIENIA - CENNIKOWO
SELECT  Products.ProductID, 
		Products.UnitPrice AS CenaCennikowa,
		[Order Details].UnitPrice AS CenaSprzeda�y,
		[Order Details].OrderID, 
		[Order Details].Quantity,
		Products.UnitPrice * [Order Details].Quantity AS Warto��Cennikowa,
		[Order Details].UnitPrice * [Order Details].Quantity AS Warto��Sprzeda�y
FROM    Products INNER JOIN
        [Order Details] ON Products.ProductID = [Order Details].ProductID
-- KROK 3 - TWORZENIE WIDOKU
GO
CREATE VIEW Warto��PozycjiSprzeda�y
AS
SELECT  Products.ProductID, 
		Products.UnitPrice AS CenaCennikowa,
		[Order Details].UnitPrice AS CenaSprzeda�y,
		[Order Details].OrderID, 
		[Order Details].Quantity,
		Products.UnitPrice * [Order Details].Quantity AS Warto��Cennikowa,
		[Order Details].UnitPrice * [Order Details].Quantity AS Warto��Sprzeda�y
FROM    Products INNER JOIN
        [Order Details] ON Products.ProductID = [Order Details].ProductID
-- KROK 4 - MODYFIKACJA WIDOKU
GO
ALTER VIEW Warto��PozycjiSprzeda�y
AS
SELECT  Products.ProductID, 
		Products.UnitPrice AS CenaCennikowa,
		[Order Details].UnitPrice AS CenaSprzeda�y,
		[Order Details].OrderID, 
		[Order Details].Quantity,
		Products.UnitPrice * [Order Details].Quantity AS Warto��Cennikowa,
		[Order Details].UnitPrice * [Order Details].Quantity AS Warto��Sprzeda�y
FROM    Products INNER JOIN
        [Order Details] ON Products.ProductID = [Order Details].ProductID
-- 5 LICZENIE WARTO�CI ZAM�WIENIA I
SELECT Customers.CompanyName, Warto��PozycjiSprzeda�y.Warto��Cennikowa
	FROM Orders INNER JOIN
        Warto��PozycjiSprzeda�y ON Orders.OrderID = Warto��PozycjiSprzeda�y.OrderID INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID
		WHERE Warto��Cennikowa > 150
-- 6 LICZENIE WARTO�CI ZAM�WIENIA II - podkwerenda + agregacja
SELECT x.CompanyName, SUM(x.Warto��Cennikowa) AS Warto�棹cznie
FROM
(SELECT Customers.CompanyName, Warto��PozycjiSprzeda�y.Warto��Cennikowa
	FROM Orders INNER JOIN
        Warto��PozycjiSprzeda�y ON Orders.OrderID = Warto��PozycjiSprzeda�y.OrderID INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID
		WHERE Warto��Cennikowa > 150) AS x
	GROUP BY CompanyName
	HAVING SUM(x.Warto��Cennikowa) > 5000
-- 7 TWORZENIE WIDOKU !
GO
CREATE VIEW Sprzeda���czna
AS
SELECT x.CompanyName, SUM(x.Warto��Cennikowa) AS Warto�棹cznie
FROM
(SELECT Customers.CompanyName, Warto��PozycjiSprzeda�y.Warto��Cennikowa
	FROM Orders INNER JOIN
        Warto��PozycjiSprzeda�y ON Orders.OrderID = Warto��PozycjiSprzeda�y.OrderID INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID
		WHERE Warto��Cennikowa > 150) AS x
	GROUP BY CompanyName
	HAVING SUM(x.Warto��Cennikowa) > 5000
-- 8 TWORZENIE WIDOKU POSORTOWANEGO !
GO
CREATE VIEW Sprzeda���cznaP
AS
SELECT TOP 100 PERCENT CompanyName, Warto�棹cznie
FROM
(SELECT x.CompanyName, SUM(x.Warto��Cennikowa) AS Warto�棹cznie
FROM
(SELECT Customers.CompanyName, 
		Warto��PozycjiSprzeda�y.Warto��Cennikowa
	FROM Orders INNER JOIN
        Warto��PozycjiSprzeda�y ON Orders.OrderID = Warto��PozycjiSprzeda�y.OrderID INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID
		WHERE Warto��Cennikowa > 150) AS x
	GROUP BY CompanyName
	HAVING SUM(x.Warto��Cennikowa) > 5000) AS y
	ORDER BY CompanyName