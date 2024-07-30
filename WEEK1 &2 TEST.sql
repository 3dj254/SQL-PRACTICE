--Find the total number of orders in the SalesOrderHeader table
select * from Sales.SalesOrderHeader
select count(SalesOrderNumber) as total 
 from Sales.SalesOrderHeader

 SELECT *FROM SALES.SalesOrderDetail
 -- List the top 5 customers (by customer ID) along with the total amount they have spent (order total) on all orders.
select * from Sales.SalesOrderDetail

select top 5 customerid,LineTotal
from  Sales.SalesOrderHeader
join  Sales.SalesOrderDetail
on [Sales].[SalesOrderHeader].SalesOrderID=[Sales].[SalesOrderDetail].salesorderID
ORDER BY LineTotal desc

--Retrieve the employee ID, first name, and last name of employees who have the job title 'Sales Representative'.

select * from [HumanResources].[Employee]
select * from[Person].[Person]

select [Person].[Person].BusinessEntityID as employeeID, FirstName,LastName , JobTitle
from HumanResources.Employee
join Person.Person
on [HumanResources].[Employee].BusinessEntityID=[Person].[Person].BusinessEntityID
where JobTitle='Sales Representative'

--Find the average list price of all products in the Product table.
select * from [Production].[Product]

select  sum(listprice) from [Production].[Product]
select  count(listprice) from [Production].[Product]
]
select (sum(ListPrice)/count(ListPrice))as average
from [Production].[Product]

--List the product names and quantities ordered for all products that have been ordered more than 100 times.
select [Production].[Product].ProductID , Name ,count(OrderQty) as OrderTOTAL
from [Production].[Product]
join [Sales].[SalesOrderDetail]
on [Production].[Product].ProductID=[Sales].[SalesOrderDetail].ProductID
group by[Production].[Product] .ProductID,Production.Product.Name
having orderTOTAL>100