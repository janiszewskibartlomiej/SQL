DECLARE @path nvarchar(255)
DECLARE @sql nvarchar(2000)
SET @path = 'ORDERS'
SET @sql = 'SELECT * FROM Northwind.dbo.' + @path
PRINT @sql
EXEC (@sql)	-- NAWIASY MUSZ¥ BYC!
-- SELECT * FROM Northwind.dbo.ORDERS