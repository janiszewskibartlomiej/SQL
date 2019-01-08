DECLARE @krok int = 0,
		@data date = '2010-01-01',
		@sql nvarchar(MAX) = '',
		@tabela nvarchar(50) = ''
WHILE @krok < 120
BEGIN
	SET @tabela = 'Zamówienia' + CONVERT(char(6), DATEADD(MONTH, @krok, @data), 112)
	IF EXISTS(SELECT * FROM sys.tables WHERE name = @tabela)
		-- PRINT @tabela + ' jest'
		SET @SQL = @SQL + 'SELECT * FROM ' + @tabela + char(13) + ' UNION ' + char(13)
	SET @krok = @krok + 1
END
EXEC (@SQL)