use joins
go

select * from tblemployee
select * from tbldepartment

create view vWEmployeesDataExceptSalary
as
select Id,Name,Gender,DepartmentId
from tblemployee

select * from vWEmployeesDataExceptSalary

update vWEmployeesDataExceptSalary
set Name='Sammy'where ID=6

delete from  vWEmployeesDataExceptSalary
where ID=6


set identity_insert tblemployee on

insert into tblemployee(ID,Name,Gender,Salary,DepartmentId) VALUES (6,'Sammy','male',8900,2)

create view vWEmployeesDetailsByDepartment
as
select  Name,Gender,Salary, DepartmentName
from tblemployee
join tbldepartment
on tblemployee.DepartmentId=tbldepartment.ID

select * from  vWEmployeesDetailsByDepartment

update vWEmployeesDetailsByDepartment
set departmentName='HR' where Name='sara'