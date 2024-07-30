create table tblemployee 
(
ID int primary key,
NAME nvarchar(50),
SALARY int ,
GENDER nvarchar(20),
CITY nvarchar(50)
)

select * from tblemployee

sp_helpindex tblemployee, IX_tblemployee_Name

insert into tblemployee values(1,'Sam',185000,'Male','London')
insert into tblemployee values(3,'Pam',95000,'Female','Miami')
insert into tblemployee values(2,'Ram',105000,'Male','New York')
insert into tblemployee values(4,'Pamela',325000,'Female','Sydney')
insert into tblemployee values(5,'Tom',15000,'Male','Chile')

create clustered index IX_tblemployee_Gender_salary
on tblemployee (Gender asc ,Salary desc)

create nonclustered index IX_tblemployee_Name
on tblemployee(Name)