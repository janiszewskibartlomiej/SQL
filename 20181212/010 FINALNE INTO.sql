DECLARE @krok int = 0
DECLARE @data_min date
DECLARE @data_max date
DECLARE @sql nvarchar(2000) = ''
DECLARE @miesi¹c char(6) = ''
DECLARE @tabela nvarchar(50) = ''
-- przypisanie wartoœci do zmiennych
SET @data_min = (SELECT MIN(CONVERT(date, OrderDate)) FROM Northwind.dbo.Orders) -- NAWIASY MUSZ¥ BYC!
SET @data_max = (SELECT MAX(CONVERT(date, OrderDate)) FROM Northwind.dbo.Orders) -- NAWIASY MUSZ¥ BYC!
SET @krok = DATEDIFF(MONTH, @data_min, @data_max) 
WHILE @krok >= 0
BEGIN
	SET @miesi¹c =  TRY_CONVERT(char(6),DATEADD(MONTH, @krok, @data_min),112) -- konwersja regionalna 112 i 12
	SET @tabela = 'Zamówienia' + @miesi¹c
	IF EXISTS (SELECT * FROM sys.tables WHERE NAME = @tabela)
	BEGIN
		SET @SQL = 'DROP TABLE ' + @tabela
		EXEC (@SQL)
	END
	-- PRINT @tabela
	SET @sql = 'SELECT OrderID, CustomerID, 
				CONVERT(date, OrderDate) AS OrderDate, 
				Freight, ' 
				+ @miesi¹c + ' AS Okres, 
				GETDATE() AS CzasDodania 
				INTO ' + @tabela +
				' FROM Northwind.dbo.Orders 
				WHERE CONVERT(char(6), OrderDate, 112) = ' + @miesi¹c
	SET @krok = @krok - 1
	EXEC (@SQL)
END

/*
PRINT @data_min
PRINT @data_max
PRINT @krok


SELECT OrderID, CustomerID, CONVERT(date, OrderDate) AS OrderDate, Freight
	INTO 
	FROM Northwind.dbo.Orders
	*/