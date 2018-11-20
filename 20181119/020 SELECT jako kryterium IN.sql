SELECT * 
	FROM Customers
	WHERE CustomerID IN(SELECT CustomerID FROM CustomersOLD)