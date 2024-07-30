with Employeeby_Name_Gender
as
(
   select Id, Name,Gender from tblEmployee
 )
 select Name,Gender from Employeeby_Name_Gender

 --update CTEs
 with Employeeby_Name_Gender
as
(
   select Id, Name,Gender from tblEmployee
 )
select * from EmployeeByDepartment

 update Employeeby_Name_gender
set Gender='male' where ID=1

--UPDATING CTEs based on 2 tables
with EmployeeByDepartment
as
(
   select Id, Name,Gender,DeptName
   from tblEmployee
   join tblDepartment
   on tblEmployee.DepartmentId=tblDepartment.DeptId
)
select * from EmployeeByDepartment

--NOTE: if aCTEs is based on more than one table,and if the UPDATE affects only ONE BASE TABLE ,then the UPDATE is allowed
with EmployeeByDepartment
as
(
   select Id,Name,Gender,DeptName
   from tblEmployee
   join tblDepartment
   on tblEmployee.DepartmentId=tblDepartment.DeptId
)
Update EmployeeByDepartment
set Gender ='Male' where Id=8


--NOTE: if a CTE is based on mutiple tables ,and if the UPDATE statement affects more than 1 base table then the UPDATE is not allowed.
with EmployeeByDepartment
as
(
   select Id,Name,Gender,DeptName
   from tblEmployee
   join tblDepartment
   on tblEmployee.DepartmentId=tblDepartment.DeptId
)
update EmployeeByDepartment
set  Gender='Female',DeptName='IT' where Id=8

---NOTE:A CTE is based on more than one base table,
--and if the UPDATE affects only one base table ,the UPDATE SUCCEEDS(but not as expected always )
with EmployeeByDepartment
as
(
   select Id,Name,Gender,DeptName
   from tblEmployee
   join tblDepartment
   on tblEmployee.DepartmentId=tblDepartment.DeptId
)
update EmployeeByDepartment
set  DeptName='IT' where Id=8
