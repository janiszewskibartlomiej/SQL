CREATE DATABASE HurtowniaDanych
GO
USE HurtowniaDanych
GO
-- przenosimy produkty do tabeli #tymczasowej
SELECT *
INTO #Produkty
FROM AdventureWorks2014.Production.Product
/*-- wyœwietlamy zawartoœæ tabeli #tymczasowej
SELECT *, YEAR(SELLSTARTDATE) -- ProductID, Name, ProductNumber 
	FROM #Produkty
	WHERE YEAR(SELLSTARTDATE) > 2008
-- */
-- tworzenie tabeli PRODUKTY
/*SELECT ProductID, Name, ProductNumber 
	INTO Produkty
	FROM #Produkty
	WHERE YEAR(SELLSTARTDATE) > 2008*/
-- usuwanie zawartoœci tabeli produkty
DELETE FROM Produkty
-- pobieramy dane z #produkty do produkty
INSERT INTO Produkty
            (ProductID, Name,	ProductNumber)
SELECT      ProductID,	Name,	ProductNumber
FROM        #Produkty
-- usuwanie tabeli tymczasowej
DROP TABLE #Produkty