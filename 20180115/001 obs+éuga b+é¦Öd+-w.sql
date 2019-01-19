-- skrypt zatrzymuje siê
PRINT 5/0
-- Obs³uga b³êdu
BEGIN TRY
	PRINT 5/0
END TRY
BEGIN CATCH 
	PRINT ERROR_MESSAGE() + ' mój opis b³êdu'
END CATCH
PRINT 'komunikat po wyst¹pieniu b³êdu'
-- Obs³uga b³êdu + informacje o b³êdzie
BEGIN TRY
	PRINT 5/0
END TRY
BEGIN CATCH 
	PRINT ERROR_MESSAGE() + ' komunikat b³êdu'
	PRINT CONCAT(ERROR_NUMBER(), ' nr b³êdu')
	PRINT CONCAT(ERROR_SEVERITY(), ' stan b³êdu')
	PRINT CONCAT(ERROR_LINE(), ' wiersz z b³êdem')
END CATCH
PRINT 'komunikat po wyst¹pieniu b³êdu'
-- poziom b³êdu
BEGIN TRY
	DECLARE @liczba TINYINT
	SET @liczba = 999
END TRY
BEGIN CATCH
	DECLARE @komuikatb³êdu NVARCHAR(MAX);
	SET @komuikatb³êdu = ERROR_MESSAGE();
	--print @komuikatb³êdu
	-- b³edy 11-19 TRY/CATCH przechwytuje
	RAISERROR(@komuikatb³êdu, 11, 1);
END CATCH