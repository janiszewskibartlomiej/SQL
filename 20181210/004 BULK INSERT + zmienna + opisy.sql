PRINT CONVERT(time, getdate()) 
PRINT 'Rozpoczynam import daych'
--
DECLARE @path nvarchar(255)
DECLARE @sql nvarchar(2000)
PRINT CONVERT(time, getdate()) 
PRINT 'Tworzymy tabl� tymczasow�'
-- tworzymy tabl� tymczasow�
CREATE TABLE #sprzeda�
(
	id int,
	Klient int,
	Kwota nvarchar(30),
	Pracownik int,
	Czas smalldatetime
)
PRINT CONVERT(time, getdate()) 
PRINT 'Deklaruj� zmienne'
--
SET @path = 'C:\SQL\sprzeda�.csv'		-- �cie�ka do pliku
SET @sql = 'BULK INSERT #sprzeda�		/* montujemy polecenie SQL */
			FROM ''' + @path + '''
			WITH (FIELDTERMINATOR = '';'',
			MAXERRORS = 0,
			ROWTERMINATOR = ''\n'',
			FIRSTROW = 2)'
--PRINT @sql -- NAJPIER PRINT - PӏNIEJ EXEC
PRINT CONVERT(time, getdate()) 
PRINT 'Wykonujemy kod'
EXEC (@sql)	-- NAWIASY MUSZ� BYC!
-- robimy CO� z danymi
SELECT * FROM #sprzeda�
-- usuwamy tabel� tymczasow�
DROP TABLE #sprzeda�
PRINT CONVERT(time, getdate()) 
PRINT 'Koniec pracy'
