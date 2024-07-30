if exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME='tblemployee')
begin 
     drop table tblemployee
end
 create table tblemployee
 (
 Id int  identity primary key,
 Name nvarchar(20),
 Gender nvarchar(20),
 Salary nvarchar(20)
 )

 insert into tblemployee values ('Jeff','Male',855000)
 insert into tblemployee values ('Kinugu','Female',450000)
 insert into tblemployee values ('PapaDanielo','Male',375000)
 insert into tblemployee values ('Victoria','Female',700000)
 insert into tblemployee values ('John','Male',876000)
 insert into tblemployee values ('Anne','Female',909000)
 
 select * from tblemployee

 select Gender, sum (Salary) as Total
 from tblemployee
 group by Gender

 alter table tblemployee
 alter column Salary int