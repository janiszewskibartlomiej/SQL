SELECT   Customers.CustomerID, 
		 CustomersOLD.CustomerID AS Expr1
FROM     Customers LEFT OUTER JOIN
         CustomersOLD 
		 ON Customers.CustomerID = CustomersOLD.CustomerID