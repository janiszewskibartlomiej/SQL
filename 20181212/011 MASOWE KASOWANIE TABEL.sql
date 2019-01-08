DECLARE @sql varchar(2000),
		@krok int = 0
SET @krok = (SELECT COUNT(*) FROM sys.tables WHERE name Like 'Zamówienia%')
WHILE @krok > 0
BEGIN
	SET @SQL = 'DROP TABLE ' + (SELECT TOP 1 name FROM sys.tables WHERE name Like 'Zamówienia%')
	EXEC (@SQL)
	SET @krok = @krok - 1
END