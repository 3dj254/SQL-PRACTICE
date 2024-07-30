--List the employee names (first and last) along with their manager's name
with ManagerDetails 
as
(
select
ec.BusinessEntityID,
ec.Name,
ec.JobTitle
from
(
SELECT p.BusinessEntityID,FirstName+' '+LastName as Name,JobTitle
from[Person].[Person] p
join [HumanResources].[Employee] e
on p.BusinessEntityID=e.BusinessEntityID)ec
join [HumanResources].[EmployeeDepartmentHistory] edh
on ec.BusinessEntityID=edh.BusinessEntityID
where JobTitle like '%Manager%'
)
select * from managerdetails


with EmployeeDetails 
as
(
select
ec.BusinessEntityID,
ec.Name,
ec.JobTitle
from
(
SELECT p.BusinessEntityID,FirstName+' '+LastName as Name,JobTitle
from[Person].[Person] p
join [HumanResources].[Employee] e
on p.BusinessEntityID=e.BusinessEntityID)ec
join [HumanResources].[EmployeeDepartmentHistory] edh
on ec.BusinessEntityID=edh.BusinessEntityID
where JobTitle not like '%Manager%'
)
select * from Employeedetails

select * from [HumanResources].[Department]
select * from[HumanResources].[EmployeeDepartmentHistory]

create view vWDept
as
select BusinessEntityID,Name as DeptName,DepartmentID
from [HumanResources].[EmployeePayHistory] edh
join[HumanResources].[Department] d
on edh.DepartmentID=D.DepartmentID




