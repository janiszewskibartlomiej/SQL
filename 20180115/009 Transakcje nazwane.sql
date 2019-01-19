CREATE TABLE Tabela (warto�� int)
GO
DECLARE @NazwaTransakcji varchar(20) = 'Transakcja'
	BEGIN TRAN @NazwaTransakcji
	-- dodanie warto�ci 1 i 2
		INSERT INTO Tabela VALUES (1), (2)
	-- cofni�cie poprzedniej akcji
		ROLLBACK TRAN @NazwaTransakcji
	-- dodanie warto�ci 3 i 4
		INSERT INTO Tabela VALUES (3), (4)
SELECT * FROM Tabela
DROP TABLE Tabela