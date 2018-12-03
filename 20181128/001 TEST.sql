-- 1
select * from Customers
-- 2
SELECT CONVERT(date, getdate())
SELECT CONVERT(Smalldatetime, getdate())
SELECT CONVERT(Datetime, getdate())
SELECT CONVERT(Datetime2, getdate())
-- 3
SELECT *
  FROM MNT

UPDATE MNT SET TitleOfCourtesy = 'Pan'
	WHERE TitleOfCourtesy = 'Mr.'

ALTER Table MNT 
	ADD POLE1 NVARCHAR(30)
-- 4
SELECT * FROM MNT
	WHERE LastName like 'd%'
-- 5
PRINT CONVERT(TINYINT, 255)
-- 6
SELECT * 
INTO MNT2
FROM MNT
--!
INSERT INTO MNT
           ([LastName],[FirstName])
		   VALUES
           ('IMIÊ', 'NAZWISKO')
-- 7
select DATEADD(day, ABS(-3), '2018-01-05')
-- 8
SELECT        ProductID, SUM(Quantity) AS ILOŒÆ, Quantity
FROM            [Order Details]
WHERE        (Quantity > 10)
GROUP BY ProductID, Quantity
HAVING        (SUM(Quantity) > 200)
ORDER BY ILOŒÆ
-- 10
PRINT ROUND(1234.564,-2)
-- 11
SELECT * FROM Customers
INTERSECT
SELECT * FROM CustomersOLD

SELECT        CustomersOLD.CustomerID, Customers.CustomerID AS Expr1
FROM            CustomersOLD INNER JOIN
                         Customers ON CustomersOLD.CustomerID = Customers.CustomerID

SELECT        CustomersOLD.CustomerID, Customers.CustomerID AS Expr1
FROM            CustomersOLD CROSS JOIN
                         Customers
