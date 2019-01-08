
SELECT OrderID, CustomerID, CONVERT(date, OrderDate) AS OrderDate, Freight
  FROM Northwind.dbo.Orders
  WHERE YEAR(OrderDate) = YEAR(GETDATE())