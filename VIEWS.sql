select * from tblemployee
select * from tbldepartment


create view vWEmployeesByDepartment
as
select Name,Salary,Gender,DepartmentName 
from tblemployee
join tbldepartment
on tblemployee.DepartmentId=tbldepartment.ID

select * from vWEmployeesByDepartment

create view vWITEmployees
as
select Name,Salary,Gender,DepartmentName 
from tblemployee
join tbldepartment
on tblemployee.DepartmentId=tbldepartment.ID
where tbldepartment.DepartmentName='IT'

select* from vWITEmployees

create view vWNonConfidentialdata
as
select Name,Gender,DepartmentName 
from tblemployee
join tbldepartment
on tblemployee.DepartmentId=tbldepartment.ID

select * from vWNonConfidentialdata

create view vWSummarizeddata
as
select departmentName, count('ID')as Totalemployees
from tblemployee
join tbldepartment
on tblemployee.departmentId=tbldepartment.ID
GROUP BY DepartmentName

select * from vWSummarizeddata
