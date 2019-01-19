ALTER PROCEDURE CustomerShow
@has這 varchar(50) -- nie NVARCHAR
AS
SELECT * FROM Customers
	WHERE has這 = HASHBYTES('MD5', @has這)
GO
-- modyfikacja tabeli - has這 otwartym tekstem nie jest do ko鎍a dobrym pomys貫m
ALTER TABLE Customers ADD Has這 nvarchar(50)
GO
UPDATE Customers SET Has這 = '123' WHERE Country = 'USA'
-- has這 w formie zaszyfrowanej
PRINT HASHBYTES('MD5', '123')
PRINT HASHBYTES('MD5', N'123') -- KODOWANIE UNICODE
PRINT HASHBYTES('SHA1', '123')
UPDATE Customers SET Has這 = HASHBYTES('MD5', '123') WHERE Country = 'UK'
-- wywo豉nie procedury
EXEC CustomerShow '123'