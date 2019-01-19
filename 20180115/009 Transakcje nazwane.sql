CREATE TABLE Tabela (wartoœæ int)
GO
DECLARE @NazwaTransakcji varchar(20) = 'Transakcja'
	BEGIN TRAN @NazwaTransakcji
	-- dodanie wartoœci 1 i 2
		INSERT INTO Tabela VALUES (1), (2)
	-- cofniêcie poprzedniej akcji
		ROLLBACK TRAN @NazwaTransakcji
	-- dodanie wartoœci 3 i 4
		INSERT INTO Tabela VALUES (3), (4)
SELECT * FROM Tabela
DROP TABLE Tabela