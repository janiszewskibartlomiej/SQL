-- WERSJA Z B��DEM
BEGIN TRY
	PRINT 5/0
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	GOTO koniec
END CATCH
	PRINT 'to si� wy�wietli je�li b��du nie b�dzie'
-- etykieta
koniec:

-- WERSJA BEZ B��DU
BEGIN TRY
	PRINT 5/1
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE() 
		GOTO koniec1
END CATCH
	PRINT 'to si� wy�wietli je�li b��du nie b�dzie'
-- etykieta
koniec1:

