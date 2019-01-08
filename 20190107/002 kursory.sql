-- ALOKACJA kursora dla zbioru danych
DECLARE firma SCROLL CURSOR FOR
	SELECT CustomerId FROM Customers	
		ORDER BY CustomerID -- koniecznie posortowaæ
-- deklaracja zmiennej dla pobieranego pola
	DECLARE @Cid char(5)
	-- otwieramy kursor
	OPEN firma
		FETCH LAST  FROM firma INTO @Cid		-- ostatni
			PRINT @Cid
		FETCH PRIOR FROM firma INTO @Cid		-- poprzedni
			PRINT @Cid
		FETCH ABSOLUTE 2 FROM firma INTO @Cid	-- drugi od góry
			PRINT @Cid
		FETCH RELATIVE 3 FROM firma INTO @Cid	-- trzeci wzglêdnie
			PRINT @Cid
		FETCH RELATIVE -2 FROM firma INTO @Cid	-- dwa do góry
			PRINT @Cid
	-- zamykamy kursor
	CLOSE firma
-- DEALOKACJA kursora
DEALLOCATE firma