SELECT   *
	INTO   CustomersTMP
	FROM   Customers
-- w³aœciwy kod
DECLARE @NazwaTransakcji varchar(20) = 'Transakcja'
	BEGIN TRAN @NazwaTransakcji
		DELETE FROM CustomersTMP
	-- rozmyœlamy siê - cofamy transakcjê
		ROLLBACK TRAN @NazwaTransakcji
	-- sprawdzamy przywrócenie
	SELECT * FROM CustomersTMP
-- sprz¹tanie po kodzie
DROP TABLE CustomersTMP