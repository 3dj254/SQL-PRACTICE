create table tblEmployee
(
Employeeid int primary key,
Name nvarchar(20),
Managerid int
)

Insert into tblEmployee values (1, 'Tom', 2)
Insert into tblEmployee values (2, 'Josh', null)
Insert into tblEmployee values (3, 'Mike', 2)
Insert into tblEmployee values (4, 'John', 3)
Insert into tblEmployee values (5, 'Pam', 1)
Insert into tblEmployee values (6, 'Mary', 3)
Insert into tblEmployee values (7, 'James', 1)
Insert into tblEmployee values (8, 'Sam', 5)
Insert into tblEmployee values (9, 'Simon', 1)

select * from tblEmployee

select Employee.Name as [Employee Name],
isnull(Manager.Name,'Super boss') as [Manager Name]
from tblEmployee Employee
 left join tblEmployee Manager
on Employee.Managerid=Manager.Employeeid

with
EmployeeCTE(Employeeid,Name,Managerid,[level])
as
( 
    select Employeeid,Name,Managerid,1
	from tblEmployee
	where Managerid is null

	union all

	select tblEmployee.Employeeid,tblEmployee.Name,tblEmployee.Managerid,
	 EmployeeCTE.[Level]+1
	 from tblEmployee
	 join EmployeeCTE
	 on tblEmployee.Managerid=EmployeeCTE.Employeeid
)
select EmpCTE.Name as Employee,
ISNULL(MgrCTE.Name,'Super Boss') as Manager,
EmpCTE.[Level]
from EmployeeCTE EmpCTE
left join EmployeeCTE MgrCTE
on EmpCTE.Managerid=MgrCTE.Employeeid
