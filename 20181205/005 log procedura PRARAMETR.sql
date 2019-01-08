ALTER PROCEDURE LogDodaj
	@operacja tinyint, 
	@opis nvarchar(32),
	@uwagi nvarchar(255)
AS
/* 
procedura dodająca wpis do log 2018-12-05
*/
INSERT INTO log_user
           (Operacja, Opis, Uwagi, Użytkownik)
     VALUES
           (@operacja, @opis, @uwagi, Suser_Sname())

-- SELECT * FROM log_user
-- EXEC LogDodaj
-- EXECUTE LogDodaj
/*
PRINT @@language
PRINT @@version
PRINT @@servername
PRINT User_Id()
PRINT User_Name()
PRINT Suser_Sname()
*/