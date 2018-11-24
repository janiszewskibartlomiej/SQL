
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Customers_Sebastian')
BEGIN
	DROP Table Customers_Sebastian
	PRINT 'Hello'
END

SELECT	CustomerID, CompanyName, ContactName, ContactTitle, 
	Address, City, Region, PostalCode, Country, Phone, Fax
	INTO	Customers_Sebastian
	FROM	[1449_nw].dbo.Customers



