-- zapytanie ze wskazan¹ domyœln¹ baz¹ danych w ODBC
SELECT *
	FROM OPENQUERY
	([MY_MYSQL],'SELECT * FROM Customers')
-- zapytanie BEZ WSKAZANEJ bazy danych w ODBC, wskazujê w zapytaniu
SELECT *
	FROM OPENQUERY
	([MY_MYSQL],'SELECT * FROM siplus_wp1.wp_users')
-- zamiana na widok
GO
CREATE VIEW MyCustomers
AS
SELECT *
	FROM OPENQUERY
	([MY_MYSQL],'SELECT * FROM siplus_northwind.Customers')
GO
-- u¿ycie WHERE w MySQL
SELECT *
	FROM OPENQUERY
	([MY_MYSQL],'SELECT * FROM siplus_northwind.Customers
				 WHERE CustomerID = ''BOLID''')
-- u¿ycie WHERE po stronie MSSQL
SELECT *
	FROM OPENQUERY
	([MY_MYSQL],'SELECT * FROM siplus_northwind.Customers')
	WHERE CustomerID = 'BOLID'	
-- tworzenie tabeli na mysql - b³¹d nieznany
INSERT INTO 
	OPENQUERY ([MY_MYSQL],'SELECT * FROM siplus_northwind.Customers') 
	SELECT * FROM MyCustomers
-- dodawanie wiersza przez OPENQUERY
INSERT INTO	
	OPENQUERY ([MY_MYSQL], 'SELECT CustomerID, CompanyName FROM siplus_northwind.Customers')
	VALUES ('YDFGS', 'Firma CDS')
-- kasowanie - b³¹d zg³aszany jest OK!
DELETE FROM
	OPENQUERY ([MY_MYSQL],'SELECT * FROM siplus_northwind.Customers')
	WHERE CustomerID = 'YDFGS'