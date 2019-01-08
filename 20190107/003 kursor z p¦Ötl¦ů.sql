DECLARE kursor CURSOR FOR
	SELECT CustomerID, CompanyName FROM Customers ORDER BY CustomerID
	DECLARE @CustomerID char(5), @CompanyName nvarchar(40), @oldID char(5)
	OPEN kursor
	FETCH NEXT FROM kursor INTO @CustomerID, @CompanyName
	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @oldID = @CustomerID
			PRINT @CustomerID
			FETCH NEXT FROM kursor INTO @CustomerID, @CompanyName
			PRINT @CustomerID + @oldID
		END
	CLOSE kursor
DEALLOCATE kursor