-- WERSJA Z B£ÊDEM
BEGIN TRY
	PRINT 5/0
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	GOTO koniec
END CATCH
	PRINT 'to siê wyœwietli jeœli b³êdu nie bêdzie'
-- etykieta
koniec:

-- WERSJA BEZ B£ÊDU
BEGIN TRY
	PRINT 5/1
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE() 
		GOTO koniec1
END CATCH
	PRINT 'to siê wyœwietli jeœli b³êdu nie bêdzie'
-- etykieta
koniec1:

