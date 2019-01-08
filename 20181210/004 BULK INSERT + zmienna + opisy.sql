PRINT CONVERT(time, getdate()) 
PRINT 'Rozpoczynam import daych'
--
DECLARE @path nvarchar(255)
DECLARE @sql nvarchar(2000)
PRINT CONVERT(time, getdate()) 
PRINT 'Tworzymy tablÍ tymczasowπ'
-- tworzymy tablÍ tymczasowπ
CREATE TABLE #sprzedaø
(
	id int,
	Klient int,
	Kwota nvarchar(30),
	Pracownik int,
	Czas smalldatetime
)
PRINT CONVERT(time, getdate()) 
PRINT 'DeklarujÍ zmienne'
--
SET @path = 'C:\SQL\sprzedaø.csv'		-- úcieøka do pliku
SET @sql = 'BULK INSERT #sprzedaø		/* montujemy polecenie SQL */
			FROM ''' + @path + '''
			WITH (FIELDTERMINATOR = '';'',
			MAXERRORS = 0,
			ROWTERMINATOR = ''\n'',
			FIRSTROW = 2)'
--PRINT @sql -- NAJPIER PRINT - P”èNIEJ EXEC
PRINT CONVERT(time, getdate()) 
PRINT 'Wykonujemy kod'
EXEC (@sql)	-- NAWIASY MUSZ• BYC!
-- robimy COå z danymi
SELECT * FROM #sprzedaø
-- usuwamy tabelÍ tymczasowπ
DROP TABLE #sprzedaø
PRINT CONVERT(time, getdate()) 
PRINT 'Koniec pracy'
