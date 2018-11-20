SELECT   Customers.CustomerID, 
		 CustomersOLD.CustomerID AS Expr1
FROM     Customers RIGHT OUTER JOIN
         CustomersOLD 
		 ON Customers.CustomerID = CustomersOLD.CustomerID