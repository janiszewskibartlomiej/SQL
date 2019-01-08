DECLARE SumaKrocz�ca CURSOR FOR
	SELECT OrderID, Freight FROM Orders ORDER BY OrderID
	DECLARE @OrderID int, @Freight money, @FreightSuma money = 0 -- suma nie mo�e by� NULL
	OPEN SumaKrocz�ca
		FETCH NEXT FROM SumaKrocz�ca INTO @OrderID, @Freight
		WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @FreightSuma = @FreightSuma + @Freight
				PRINT CONCAT(@OrderID, ' ', @Freight, ' ', @FreightSuma)
				PRINT CONCAT_WS( ' | ', @OrderID, @Freight, @FreightSuma)
				FETCH NEXT FROM SumaKrocz�ca INTO @OrderID, @Freight
			END
	CLOSE SumaKrocz�ca
DEALLOCATE SumaKrocz�ca
-- uwzgl�dniamy wy��cznie freight > 20