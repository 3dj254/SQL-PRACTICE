select * from Person.Person
select * from[HumanResources].[EmployeeDepartmentHistory]

select BusinessEntityID, FirstName+' '+LastName as Name
FROM Person.Person 

select  * from [HumanResources].[Employee]

select BusinessEntityID,JobTitle from [HumanResources].[Employee]
select * from [HumanResources].[Department]
select  BusinessEntityID, DepartmentID from [HumanResources].[EmployeeDepartmentHistory]

with EmployeeCTE(BusinessEntityID, Name,JobTitle)
as
(
select[Person].[Person].BusinessEntityID ,FirstName+' '+LastName as Name,JobTitle
FROM Person.Person
join [HumanResources].[Employee]
on [Person].[Person].BusinessEntityID=[HumanResources].[Employee].BusinessEntityID
),

EmployeeDept( BusinessEntityID,Name,JobTitle,DepartmentID)
as
(
select EmployeeCTE.BusinessEntityID,Name,JobTitle,DepartmentID
from EmployeeCTE
join [HumanResources].[EmployeeDepartmentHistory]
on [HumanResources].[EmployeeDepartmentHistory].BusinessEntityID=EmployeeCTE.BusinessEntityID
group by  EmployeeCTE.BusinessEntityID,Name,JobTitle,DepartmentID
)
select BusinessEntityID,Name,JobTitle from EmployeeDept
 where JobTitle like '%Manager%'






