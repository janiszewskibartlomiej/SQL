SELECT	Orders.OrderID, 
		Orders.OrderDate, 
		Customers.CompanyName, 
		Products.ProductName, 
		[Order Details].UnitPrice, 
		[Order Details].Quantity,
		[Order Details].UnitPrice * [Order Details].Quantity AS Wartoœæ
FROM    Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                         Products ON [Order Details].ProductID = Products.ProductID