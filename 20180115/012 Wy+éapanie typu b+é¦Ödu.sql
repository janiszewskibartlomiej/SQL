CREATE TABLE #Pojazdy 
	(id INT, Pojazd nvarchar(20))
	-- pr�ba operacji
	INSERT INTO log_u.dbo.log_user (Operacja,Opis) VALUES (1, 'pr�ba operacji')
BEGIN TRANSACTION
	BEGIN TRY 
		INSERT INTO log_u.dbo.log_user (Operacja,Opis) VALUES (1, 'pocz�tek transakcji')
	-- dodawanie danych
		INSERT INTO #Pojazdy (id, Pojazd) VALUES (1, 'Rower')
		INSERT INTO #Pojazdy (id, Pojazd) VALUES (2, 'Hulajnoga')
		INSERT INTO #Pojazdy (id, Pojazd) VALUES (3, 'Wrotki')
	-- wywo�anie b��du innego
	PRINT 5/0
	END TRY
	BEGIN CATCH
		-- cofamy wy��cznie b��d 245 inne nas nie obchodz�
		IF ERROR_NUMBER() = 245
			BEGIN
			INSERT INTO log_u.dbo.log_user (Operacja,Opis) VALUES (1, 'b��d 245')
				PRINT 'B��d konwersji'
				-- PRINT ERROR_MESSAGE()
				ROLLBACK TRANSACTION
			END
		ELSE
		PRINT 'Jaki� inny b��d'
		INSERT INTO log_u.dbo.log_user (Operacja,Opis) VALUES (1, 'jaki� inny b��d')
	END CATCH
-- sprawdzamy zawarto�� tabeli
SELECT * FROM #Pojazdy
-- usuwamy tabel�
DROP TABLE #Pojazdy