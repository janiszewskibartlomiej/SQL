-- zwyk³a kwerenda
UPDATE Customers
	SET City = 'Londyn'
	WHERE City = 'London'
-- kwerenda z u¿yciem transakcji
-- obie operacje s¹ traktowane jako jedna
BEGIN TRANSACTION
	UPDATE Customers
		SET City = 'Londyn'
		WHERE City = 'London'
	UPDATE Customers
		SET City = 'Nowy Jork'
		WHERE City = 'New York'
COMMIT TRANSACTION
-- Cofanie transakcji
BEGIN TRANSACTION
UPDATE Customers
	SET City = 'London'
	WHERE City = 'Londyn'
	IF @@ROWCOUNT = 2
		COMMIT TRANSACTION
	ELSE
		ROLLBACK TRANSACTION