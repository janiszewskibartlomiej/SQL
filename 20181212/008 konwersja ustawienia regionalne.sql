DECLARE @krok int = 0
DECLARE @data_min date
DECLARE @data_max date
-- przypisanie warto�ci do zmiennych
SET @data_min = (SELECT MIN(CONVERT(date, OrderDate)) FROM Northwind.dbo.Orders) -- NAWIASY MUSZ� BYC!
SET @data_max = (SELECT MAX(CONVERT(date, OrderDate)) FROM Northwind.dbo.Orders) -- NAWIASY MUSZ� BYC!
SET @krok = DATEDIFF(MONTH, @data_min, @data_max) 
WHILE @krok >= 0
BEGIN
	PRINT TRY_CONVERT(char(6),DATEADD(MONTH, @krok, @data_min),112) -- konwersja regionalna 112 i 12
	SET @krok = @krok - 1
END

/*
PRINT @data_min
PRINT @data_max
PRINT @krok


SELECT OrderID, CustomerID, CONVERT(date, OrderDate) AS OrderDate, Freight
	FROM Northwind.dbo.Orders
	*/