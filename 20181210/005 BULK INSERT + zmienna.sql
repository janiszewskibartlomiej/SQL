DECLARE @path nvarchar(255)
DECLARE @sql nvarchar(2000)
-- tworzymy tabl� tymczasow�
CREATE TABLE #sprzeda�
(
	id int,
	Klient int,
	Kwota nvarchar(30),
	Pracownik int,
	Czas smalldatetime
)
SET @path = 'C:\SQL\sprzeda�.csv'
SET @sql = 'BULK INSERT #sprzeda�
			FROM ''' + @path + '''
			WITH (FIELDTERMINATOR = '';'',
			MAXERRORS = 0,
			ROWTERMINATOR = ''\n'',
			FIRSTROW = 2)'
PRINT @sql
EXEC (@sql)	-- NAWIASY MUSZ� BYC!
-- robimy CO� z danymi
SELECT * FROM #sprzeda�
-- usuwamy tabel� tymczasow�
DROP TABLE #sprzeda�
