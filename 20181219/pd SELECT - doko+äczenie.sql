DECLARE @krok int = 0,
		@data date = '2010-01-01',
		@sql nvarchar(MAX) = '',
		@tabela nvarchar(50) = ''
WHILE @krok < 120
BEGIN
	SET @tabela = 'Zam�wienia' + CONVERT(char(6), DATEADD(MONTH, @krok, @data), 112)
	IF EXISTS(SELECT * FROM sys.tables WHERE name = @tabela)
		-- PRINT @tabela + ' jest'
		SET @SQL = @SQL + 'SELECT * FROM ' + @tabela + char(13) 
	-- Sprawdzamy, czy istnieje kolejna tabela - je�li tak dodajemy do @SQL UNION
	SET @tabela = 'Zam�wienia' + CONVERT(char(6), DATEADD(MONTH, @krok + 1, @data), 112)
	IF EXISTS(SELECT * FROM sys.tables WHERE name = @tabela)
		SET @SQL += ' UNION ' + char(13)
		-- W ww przyk�adzie pojawia si� na pocz�tku @SQL = ' UNION ' + char(13), kt�ry zamieniamy na ''
		IF @SQL = ' UNION ' + char(13)
			SET @sql = ''
	--
	SET @krok = @krok + 1
END
PRINT (@SQL)
EXEC (@SQL)