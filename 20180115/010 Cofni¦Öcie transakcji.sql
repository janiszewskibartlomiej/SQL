SELECT   *
	INTO   CustomersTMP
	FROM   Customers
-- w�a�ciwy kod
DECLARE @NazwaTransakcji varchar(20) = 'Transakcja'
	BEGIN TRAN @NazwaTransakcji
		DELETE FROM CustomersTMP
	-- rozmy�lamy si� - cofamy transakcj�
		ROLLBACK TRAN @NazwaTransakcji
	-- sprawdzamy przywr�cenie
	SELECT * FROM CustomersTMP
-- sprz�tanie po kodzie
DROP TABLE CustomersTMP