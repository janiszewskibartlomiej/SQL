
ALTER VIEW [1449_kurs].[AnalizaSebastian]
AS
SELECT [OrderID]
      ,[CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
--      ,[ShipVia]
      ,[ProductName]
      ,[Quantity]
      ,[Discount]
      ,[UnitPrice]
      ,[Warto��]
  FROM [1449_nw].[dbo].[AnlizaSprzeda�y]
GO


