CREATE VIEW Log_ostatnie5
AS
SELECT TOP 5 
	id, Czas, Operacja, Opis, Uwagi, StatusOperacji, Użytkownik
	FROM log_user
	ORDER BY id DESC