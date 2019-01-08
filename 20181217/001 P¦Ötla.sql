DECLARE @krok int = 0,
		@data date = '2010-01-01'
WHILE @krok < 120
BEGIN
	PRINT CONVERT(char(6), DATEADD(MONTH, @krok, @data), 112)
	SET @krok = @krok + 1
END
