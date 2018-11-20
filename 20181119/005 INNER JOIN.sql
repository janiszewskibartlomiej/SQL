SELECT  Customers.CustomerID, 
		CustomersOLD.CustomerID AS Expr1
FROM    Customers INNER JOIN
        CustomersOLD 
		ON Customers.CustomerID = CustomersOLD.CustomerID