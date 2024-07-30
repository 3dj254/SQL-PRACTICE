select * from [dbo].[vWEmployeedetails]

---using temporary tables
select DeptName, DepartmentId, COUNT(*) as TotalEmployees
into #tblEmployeeCount
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
group by DeptName,DepartmentId

select DeptName,TotalEmployees
from #tblEmployeeCount
where TotalEmployees>=2

drop table #tblEmployeeCount

--using table variable
declare @tblEmployeeCount table (DeptName nvarchar(20),DepartmentId int, TotalEmployees int)
insert @tblEmployeeCount
select DeptName, DepartmentId, COUNT(*) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
group by DeptName, DepartmentId

select DeptName, TotalEmployees
from @tblEmployeeCount
where TotalEmployees>=2

---using Derived tables
select DeptName,TotalEmployees
from
(
    select DeptName, DepartmentId, COUNT(*) as TotalEmployees
    from tblEmployee
    join tblDepartment
    on tblEmployee.DepartmentId=tblDepartment.DeptId
    group by DeptName, DepartmentId
)
as EmployeeCount
where TotalEmployees>=2

---using CTE
with EmployeeCount(DeptName,DepartmentId,TotalEmployees)
as
(
    select DeptName, DepartmentId, COUNT(*) as TotalEmployees
    from tblEmployee
    join tblDepartment
    on tblEmployee.DepartmentId=tblDepartment.DeptId
    group by DeptName, DepartmentId 
)

select DeptName, TotalEmployees
from EmployeeCount
where TotalEmployees>=2

