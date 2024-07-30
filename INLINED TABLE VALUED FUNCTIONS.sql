select * from tblemployee
select * from tbldepartment

create function fn_EmployeesByGender (@Gender nvarchar(20))
returns table
as 
return (select ID,Name,Gender,Salary,DepartmentId
         from tblemployee
		 where Gender=@Gender)

		 select* from  fn_EmployeesByGender('female')

		 select Name ,Gender,DepartmentName
		 from fn_EmployeesByGender('male') E
		 join tbldepartment D on D.ID = E.DepartmentId