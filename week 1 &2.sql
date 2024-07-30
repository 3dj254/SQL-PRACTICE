use AdventureWorks2017
go

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
select [Production].[Product].ProductID , Name ,count([Sales].[SalesOrderDetail].OrderQty) as OrderTOTAL
from [Production].[Product]
join [Sales].[SalesOrderDetail]
on [Production].[Product].ProductID=[Sales].[SalesOrderDetail].ProductID
group by[Production].[Product] .ProductID,Production.Product.Name
having count([Sales].[SalesOrderDetail].OrderQty) >100 
order by OrderTOTAL asc

--Retrieve the product names and total sales amount (order total) for the top 10 selling products
select* from[Sales].[SalesOrderDetail]

SELECT 
    [Production].[Product].ProductID, 
    [Production].[Product].Name,
    COUNT([Sales].[SalesOrderDetail].OrderQty) AS OrderTOTAL,
    (COUNT([Sales].[SalesOrderDetail].OrderQty) * COUNT([Sales].[SalesOrderDetail].LineTotal)) AS CalculatedValue
FROM 
    [Production].[Product]
JOIN 
    [Sales].[SalesOrderDetail]
ON 
    [Production].[Product].ProductID = [Sales].[SalesOrderDetail].ProductID
GROUP BY 
    [Production].[Product].ProductID, 
    [Production].[Product].Name
order by CalculatedValue desc

--Find the average number of days it took to ship an order (ShipDate - OrderDate) for all orders.

select 
     AVG(datediff(day,OrderDate,ShipDate)) as AverageDayDifference
from 
    [Sales].[SalesOrderHeader];

---List the product names and quantities in stock for products with a quantity in stock less than 50

select Name,SafetyStockLevel
from [Production].[Product]
where SafetyStockLevel<50

--Retrieve the customer names and the total number of orders placed by each customer
SELECT * FROM  [Sales].[SalesOrderHeader]

select FirstName,MiddleName,LastName ,count(SalesOrderNumber) as TotalOrders
from[Person].[Person]
join [Sales].[SalesOrderHeader]
on [Person].[Person].BusinessEntityID=[Sales].[SalesOrderHeader].CustomerID
Group by FirstName,	MiddleName,	LastName

--Find the product with the highest list price.Select top 1ProductID, Name ,ListPricefrom[Production].[Product]order by ListPrice desc--List the employee names (first and last) along with their manager's name.select FirstName+' '+LastName, (select FirstName+' '+LastName from HumanResources.vEmployee where JobTitle in 
(select case )
)

FROM [HumanResources].[Employee] e
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]
    INNER JOIN [HumanResources].[EmployeeDepartmentHistory] edh 
    ON e.[BusinessEntityID] = edh.[BusinessEntityID] 
    INNER JOIN [HumanResources].[Department] d 
    ON edh.[DepartmentID] = d.[DepartmentID] 

	select * from HumanResources.vEmployee where JobTitle like '%Manager%'

	select * from [HumanResources].[EmployeeDepartmentHistory]--[HumanResources].[Department]
	select * from [HumanResources].[vEmployeeDepartment]

