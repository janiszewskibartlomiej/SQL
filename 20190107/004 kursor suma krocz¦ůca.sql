DECLARE SumaKrocz¹ca CURSOR FOR
	SELECT OrderID, Freight FROM Orders ORDER BY OrderID
	DECLARE @OrderID int, @Freight money, @FreightSuma money = 0 -- suma nie mo¿e byæ NULL
	OPEN SumaKrocz¹ca
		FETCH NEXT FROM SumaKrocz¹ca INTO @OrderID, @Freight
		WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @FreightSuma = @FreightSuma + @Freight
				PRINT CONCAT(@OrderID, ' ', @Freight, ' ', @FreightSuma)
				PRINT CONCAT_WS( ' | ', @OrderID, @Freight, @FreightSuma)
				FETCH NEXT FROM SumaKrocz¹ca INTO @OrderID, @Freight
			END
	CLOSE SumaKrocz¹ca
DEALLOCATE SumaKrocz¹ca
-- uwzglêdniamy wy³¹cznie freight > 20