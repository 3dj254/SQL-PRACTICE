create table tblEmployees
(
Id int primary key,
Name nvarchar(20),
Salary int,
Gender nvarchar(10),
DepartmentId int
)

Insert into tblEmployees values (1,'John', 5000, 'Male', 3)
Insert into tblEmployees values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployees values (3,'Pam', 6000, 'Female', 1)
insert into tblEmployees values(6,'Ben',4800,'Male',3)

CREATE TABLE tblEmployeeAudit
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
)

create trigger tr_tblEmployees_ForInsert
on tblEmployees
for insert 
as 
begin
  declare @Id int
  select @Id=Id from inserted
  insert into tblEmployeeAudit
  values ('New employee with  Id=' + cast(@Id as nvarchar(5)) + 'is added at' + 
  cast(GETDATE()as nvarchar(20)))
  end

insert into tblEmployees values (7,'Tan', 2300, 'Female', 3)

select * from tblEmployeeAudit

CREATE TRIGGER tr_tblEMployees_ForDelete
ON tblEmployees
FOR DELETE
AS
BEGIN
 Declare @Id int
 Select @Id = Id from deleted
 
 insert into tblEmployeeAudit 
 values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is deleted at ' + Cast(Getdate() as nvarchar(20)))
END

delete from tblEmployees where Id=7

select * from tblEmployees
