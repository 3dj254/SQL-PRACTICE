WITH EmployeeCount (DepartmentId, TotalEmployees)
as
(
   select DepartmentId ,COUNT(*) as TotalEmployees
   from tblEmployee
   group by DepartmentId
)

select DeptName,TotalEmployees
from tblDepartment
join EmployeeCount
on tblDepartment.DeptId=EmployeeCount.DepartmentId
order by TotalEmployees

select * from tblDepartment
select * from tblEmployee

With EmployeeCountBY_IT_Payroll(DeptName, Total)
as
(
select DeptName, count(ID) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
where DeptName IN ('IT','Payroll')
group by DeptName
),
EmployeeCountBY_HR_Admin(DeptName, Total)
as
(select DeptName, count(ID) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
where DeptName IN ('HR','Admin')
group by DeptName
)
select * from  EmployeeCountBY_HR_Admin
union
select * from  EmployeeCountBY_IT_Payroll