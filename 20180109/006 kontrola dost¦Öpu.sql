ALTER PROCEDURE CustomerShow
@has�o varchar(50) -- nie NVARCHAR
AS
SELECT * FROM Customers
	WHERE has�o = HASHBYTES('MD5', @has�o)
GO
-- modyfikacja tabeli - has�o otwartym tekstem nie jest do ko�ca dobrym pomys�em
ALTER TABLE Customers ADD Has�o nvarchar(50)
GO
UPDATE Customers SET Has�o = '123' WHERE Country = 'USA'
-- has�o w formie zaszyfrowanej
PRINT HASHBYTES('MD5', '123')
PRINT HASHBYTES('MD5', N'123') -- KODOWANIE UNICODE
PRINT HASHBYTES('SHA1', '123')
UPDATE Customers SET Has�o = HASHBYTES('MD5', '123') WHERE Country = 'UK'
-- wywo�anie procedury
EXEC CustomerShow '123'