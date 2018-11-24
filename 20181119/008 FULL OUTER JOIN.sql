SELECT   Customers.CustomerID, 
		 CustomersOLD.CustomerID AS Expr1
FROM     Customers FULL OUTER JOIN
         CustomersOLD 
		 ON Customers.CustomerID = CustomersOLD.CustomerID