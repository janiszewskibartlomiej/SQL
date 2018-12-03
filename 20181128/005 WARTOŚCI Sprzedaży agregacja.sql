-- KROK 1 - ILE KOSZTUJE PRODUKT
SELECT ProductID, UnitPrice 
FROM Products
-- KROK 2 - ILE KOSZTUJE POZYCJA ZAMÓWIENIA - CENNIKOWO
SELECT  Products.ProductID, 
		Products.UnitPrice AS CenaCennikowa,
		[Order Details].UnitPrice AS CenaSprzeda¿y,
		[Order Details].OrderID, 
		[Order Details].Quantity,
		Products.UnitPrice * [Order Details].Quantity AS WartoœæCennikowa,
		[Order Details].UnitPrice * [Order Details].Quantity AS WartoœæSprzeda¿y
FROM    Products INNER JOIN
        [Order Details] ON Products.ProductID = [Order Details].ProductID
-- KROK 3 - TWORZENIE WIDOKU
GO
CREATE VIEW WartoœæPozycjiSprzeda¿y
AS
SELECT  Products.ProductID, 
		Products.UnitPrice AS CenaCennikowa,
		[Order Details].UnitPrice AS CenaSprzeda¿y,
		[Order Details].OrderID, 
		[Order Details].Quantity,
		Products.UnitPrice * [Order Details].Quantity AS WartoœæCennikowa,
		[Order Details].UnitPrice * [Order Details].Quantity AS WartoœæSprzeda¿y
FROM    Products INNER JOIN
        [Order Details] ON Products.ProductID = [Order Details].ProductID
-- KROK 4 - MODYFIKACJA WIDOKU
GO
ALTER VIEW WartoœæPozycjiSprzeda¿y
AS
SELECT  Products.ProductID, 
		Products.UnitPrice AS CenaCennikowa,
		[Order Details].UnitPrice AS CenaSprzeda¿y,
		[Order Details].OrderID, 
		[Order Details].Quantity,
		Products.UnitPrice * [Order Details].Quantity AS WartoœæCennikowa,
		[Order Details].UnitPrice * [Order Details].Quantity AS WartoœæSprzeda¿y
FROM    Products INNER JOIN
        [Order Details] ON Products.ProductID = [Order Details].ProductID
-- 5 LICZENIE WARTOŒCI ZAMÓWIENIA I
SELECT Customers.CompanyName, WartoœæPozycjiSprzeda¿y.WartoœæCennikowa
	FROM Orders INNER JOIN
        WartoœæPozycjiSprzeda¿y ON Orders.OrderID = WartoœæPozycjiSprzeda¿y.OrderID INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID
		WHERE WartoœæCennikowa > 150
-- 6 LICZENIE WARTOŒCI ZAMÓWIENIA II - podkwerenda + agregacja
SELECT x.CompanyName, SUM(x.WartoœæCennikowa) AS Wartoœæ£¹cznie
FROM
(SELECT Customers.CompanyName, WartoœæPozycjiSprzeda¿y.WartoœæCennikowa
	FROM Orders INNER JOIN
        WartoœæPozycjiSprzeda¿y ON Orders.OrderID = WartoœæPozycjiSprzeda¿y.OrderID INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID
		WHERE WartoœæCennikowa > 150) AS x
	GROUP BY CompanyName
	HAVING SUM(x.WartoœæCennikowa) > 5000
-- 7 TWORZENIE WIDOKU !
GO
CREATE VIEW Sprzeda¿£¹czna
AS
SELECT x.CompanyName, SUM(x.WartoœæCennikowa) AS Wartoœæ£¹cznie
FROM
(SELECT Customers.CompanyName, WartoœæPozycjiSprzeda¿y.WartoœæCennikowa
	FROM Orders INNER JOIN
        WartoœæPozycjiSprzeda¿y ON Orders.OrderID = WartoœæPozycjiSprzeda¿y.OrderID INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID
		WHERE WartoœæCennikowa > 150) AS x
	GROUP BY CompanyName
	HAVING SUM(x.WartoœæCennikowa) > 5000
-- 8 TWORZENIE WIDOKU POSORTOWANEGO !
GO
CREATE VIEW Sprzeda¿£¹cznaP
AS
SELECT TOP 100 PERCENT CompanyName, Wartoœæ£¹cznie
FROM
(SELECT x.CompanyName, SUM(x.WartoœæCennikowa) AS Wartoœæ£¹cznie
FROM
(SELECT Customers.CompanyName, 
		WartoœæPozycjiSprzeda¿y.WartoœæCennikowa
	FROM Orders INNER JOIN
        WartoœæPozycjiSprzeda¿y ON Orders.OrderID = WartoœæPozycjiSprzeda¿y.OrderID INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID
		WHERE WartoœæCennikowa > 150) AS x
	GROUP BY CompanyName
	HAVING SUM(x.WartoœæCennikowa) > 5000) AS y
	ORDER BY CompanyName