select * from [HumanResources].[Department]
select * from [HumanResources].[EmployeeDepartmentHistory]


Alter view vWDEPT
as
select BusinessEntityID,Name as DeptName,edh.DepartmentID
from [HumanResources].[EmployeeDepartmentHistory] edh
join[HumanResources].[Department] d
on edh.DepartmentID=d.DepartmentID


select * from  vWDEPT
order by BusinessEntityID 

DROP VIEW vWDEPT

select * from managerdetails

select managerdetails.BusinessEntityID,Name,JobTitle,DeptName
from managerdetails Md
inner join vWDEPT 
on Md.BusinessEntityID=vWDEPT.BusinessEntityID 


select * from [HumanResources].[Department]
 select * from [HumanResources].[Employee]