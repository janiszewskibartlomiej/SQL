CREATE FUNCTION Czas()
RETURNS date
AS
BEGIN
	Return Getdate()
END
GO
PRINT dbo.Czas()
GO
-- funkcja przeliczaj¹ca Brutto na Netto
CREATE FUNCTION Brutto(@Netto DECIMAL (18,2)) 
RETURNS DECIMAL (18,2)
AS
BEGIN
	SET @Netto = @Netto * 1.23
	RETURN @Netto
END
GO
SELECT dbo.Brutto(1000)
GO
-- data tekstem
-- PRINT CONVERT(char(10), Getdate(),121)
CREATE FUNCTION DataTekstem(@czas smalldatetime)
RETURNS char(10)
AS
BEGIN
	DECLARE @return char(10)
	SET @return = CONVERT(char(10), @czas, 121)
	RETURN @return
END
GO
PRINT dbo.Datatekstem(getdate())
PRINT dbo.Datatekstem('2015-05-12')