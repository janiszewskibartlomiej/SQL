SELECT *, UnitPrice * Quantity AS Wartoœæ
FROM
(SELECT        dbo.Orders.OrderID, dbo.Orders.CustomerID, dbo.Orders.OrderDate, dbo.Orders.ShippedDate, dbo.[Order Details].ProductID, dbo.[Order Details].Quantity, dbo.Products.ProductName, dbo.Products.CategoryID, 
                         dbo.[Order Details].UnitPrice
FROM            dbo.Orders INNER JOIN
                         dbo.[Order Details] ON dbo.Orders.OrderID = dbo.[Order Details].OrderID INNER JOIN
                         dbo.Products ON dbo.[Order Details].ProductID = dbo.Products.ProductID) AS X