CREATE TABLE #Pojazdy 
	(id INT, Pojazd nvarchar(20))
	-- próba operacji
	INSERT INTO log_u.dbo.log_user (Operacja,Opis) VALUES (1, 'próba operacji')
BEGIN TRANSACTION
	BEGIN TRY 
		INSERT INTO log_u.dbo.log_user (Operacja,Opis) VALUES (1, 'pocz¹tek transakcji')
	-- dodawanie danych
		INSERT INTO #Pojazdy (id, Pojazd) VALUES (1, 'Rower')
		INSERT INTO #Pojazdy (id, Pojazd) VALUES (2, 'Hulajnoga')
		INSERT INTO #Pojazdy (id, Pojazd) VALUES (3, 'Wrotki')
	-- wywo³anie b³êdu innego
	PRINT 5/0
	END TRY
	BEGIN CATCH
		-- cofamy wy³¹cznie b³¹d 245 inne nas nie obchodz¹
		IF ERROR_NUMBER() = 245
			BEGIN
			INSERT INTO log_u.dbo.log_user (Operacja,Opis) VALUES (1, 'b³¹d 245')
				PRINT 'B³¹d konwersji'
				-- PRINT ERROR_MESSAGE()
				ROLLBACK TRANSACTION
			END
		ELSE
		PRINT 'Jakiœ inny b³¹d'
		INSERT INTO log_u.dbo.log_user (Operacja,Opis) VALUES (1, 'jakiœ inny b³¹d')
	END CATCH
-- sprawdzamy zawartoœæ tabeli
SELECT * FROM #Pojazdy
-- usuwamy tabelê
DROP TABLE #Pojazdy