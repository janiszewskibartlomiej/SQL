CREATE PROCEDURE LogDodaj
AS
/* 
procedura dodaj¹ca wpis do log 2018-12-05
*/
INSERT INTO log_user
           (Operacja, Opis, Uwagi, U¿ytkownik)
     VALUES
           (2,'test','jakiœ tekst', user)

-- SELECT * FROM log_user