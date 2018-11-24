SELECT Orders.OrderID, 
		Orders.CustomerID, 
		Orders.OrderDate, 
		Orders.ShippedDate, 
		[Order Details].ProductID, 
		[Order Details].Quantity, 
		Products.ProductName, 
		Products.CategoryID, 
        [Order Details].UnitPrice
	FROM Orders INNER JOIN
         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
         Products ON [Order Details].ProductID = Products.ProductID