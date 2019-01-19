-- skrypt zatrzymuje si�
PRINT 5/0
-- Obs�uga b��du
BEGIN TRY
	PRINT 5/0
END TRY
BEGIN CATCH 
	PRINT ERROR_MESSAGE() + ' m�j opis b��du'
END CATCH
PRINT 'komunikat po wyst�pieniu b��du'
-- Obs�uga b��du + informacje o b��dzie
BEGIN TRY
	PRINT 5/0
END TRY
BEGIN CATCH 
	PRINT ERROR_MESSAGE() + ' komunikat b��du'
	PRINT CONCAT(ERROR_NUMBER(), ' nr b��du')
	PRINT CONCAT(ERROR_SEVERITY(), ' stan b��du')
	PRINT CONCAT(ERROR_LINE(), ' wiersz z b��dem')
END CATCH
PRINT 'komunikat po wyst�pieniu b��du'
-- poziom b��du
BEGIN TRY
	DECLARE @liczba TINYINT
	SET @liczba = 999
END TRY
BEGIN CATCH
	DECLARE @komuikatb��du NVARCHAR(MAX);
	SET @komuikatb��du = ERROR_MESSAGE();
	--print @komuikatb��du
	-- b�edy 11-19 TRY/CATCH przechwytuje
	RAISERROR(@komuikatb��du, 11, 1);
END CATCH