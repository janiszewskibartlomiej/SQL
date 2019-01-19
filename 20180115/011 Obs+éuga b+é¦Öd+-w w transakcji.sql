CREATE TABLE #Pojazdy 
	(id INT, Pojazd nvarchar(20))
BEGIN TRANSACTION
	BEGIN TRY 
	-- dodawanie danych
		INSERT INTO #Pojazdy (id, Pojazd) VALUES (1, 'Rower')
		INSERT INTO #Pojazdy (id, Pojazd) VALUES (2, 'Hulajnoga')
		INSERT INTO #Pojazdy (id, Pojazd) VALUES ('a', 'Wrotki')
	-- wywo�anie b��du
	--PRINT 5/0
	END TRY
	BEGIN CATCH
		PRINT ERROR_NUMBER()
		PRINT ERROR_MESSAGE()
		ROLLBACK TRANSACTION
	END CATCH
-- sprawdzamy zawarto�� tabeli
SELECT * FROM #Pojazdy
-- usuwamy tabel�
DROP TABLE #Pojazdy