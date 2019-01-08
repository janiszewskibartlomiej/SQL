CREATE PROCEDURE AktualizacjaOsoby
AS
SELECT BusinessEntityID, 
	PersonType, 
	FirstName, LastName, EmailPromotion
	INTO #Osoby
FROM  AdventureWorks2014.Person.Person
-- sprawdzamy czy tabela OSOBY istnieje
IF EXISTS(SELECT * FROM sys.tables WHERE name = 'Osoby')
	DROP Table Osoby
--
SELECT *
	INTO Osoby
	FROM #Osoby
--
DROP Table #Osoby