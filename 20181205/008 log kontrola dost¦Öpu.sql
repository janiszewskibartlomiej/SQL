CREATE PROCEDURE LogMoje
AS
SELECT Czas, Operacja, Opis, Uwagi
  FROM Log_ostatnie5
	WHERE Użytkownik = SUSER_SNAME()

  -- SELECT * FROM Log_user
  -- EXEC LogMoje