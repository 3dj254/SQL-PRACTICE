select * from tblEmployee1

select isnull('Jeff', 'no manager') as manager

select E.name as employee,isnull(M.name, 'no manager') as manager
from tblEmployee1 e
left join tblEmployee1 m
on E.ManagerId =M.EmployeeId


select E.name as employee,coalesce(M.name, 'no manager') as manager
from tblEmployee1 e
left join tblEmployee1 m
on E.ManagerId =M.EmployeeId

select E.name as employee,case when M.name is null then 'no manager'else M.name end as manager
from tblEmployee1 e
left join tblEmployee1 m
on e.ManagerId = m.EmployeeId

select isnull(E.name, 'no employee') as employee, coalesce(M.name, 'no manager') as manager
from tblEmployee1 e
full join tblEmployee1 m
on e.ManagerId = m.EmployeeId

create table tblperson 
(
Id int not null identity (1,1) primary key,
FirstName nvarchar(10) null,
MiddleName nvarchar(10) null,
LastName nvarchar(10) null
)
insert into tblperson values ('James','Nick' ,'Nancy')

select * from tblperson

select ID, coalesce (firstname, middlename,lastname) as Name from tblperson
