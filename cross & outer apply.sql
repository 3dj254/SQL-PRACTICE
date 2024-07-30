select DepartmentName,Name,Gender,Salary
from Department d
cross apply [dbo].[fnEmployeeDepartment](d.Id)

select DepartmentName,Name,Gender,Salary
from Department d
outer apply [dbo].[fnEmployeeDepartment](d.Id)


select DepartmentName,Name,Gender,Salary
from Department d
 left join Employee e
 on d.Id=e.DepartmentId