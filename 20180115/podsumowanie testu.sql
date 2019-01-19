SELECT        CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
FROM            Customers
UNION
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax FROM CustomersOLD

SELECT        CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
FROM            Customers
UNION ALL
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax FROM CustomersOLD

SELECT        CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
FROM            Customers
EXCEPT 
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax FROM CustomersOLD

SELECT        CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
FROM            Customers
INTERSECT 
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax FROM CustomersOLD

SELECT        Customers.CustomerID, CustomersOLD.CustomerID AS Expr1
FROM            Customers INNER JOIN
                         CustomersOLD ON Customers.CustomerID = CustomersOLD.CustomerID
SELECT        Customers.CustomerID, CustomersOLD.CustomerID AS Expr1
FROM            Customers FULL OUTER JOIN
                         CustomersOLD ON Customers.CustomerID = CustomersOLD.CustomerID
-- Wartoœci unikalne dla kombinacji pól City,Country
SELECT DISTINCT City,Country From Customers

SELECT        City
FROM            Customers
GROUP BY City

SELECT        City, COUNT(city)
FROM            Customers
GROUP BY City
-- NULL
SELECT City + NULL FROM Customers

SELECT City + Region FROM Customers

SELECT City + ISNULL(Region, '?') FROM Customers

SELECT CONCAT(City, Region, 111) FROM Customers

SELECT CONCAT_WS('\',City, Country) FROM Customers

SELECT "City", [city] FROM Customers

PRINT 'jakiœ' + char(13) + 'tekst'

PRINT @@Version

