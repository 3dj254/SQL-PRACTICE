create table tblemployee 
(
ID int primary key,
NAME nvarchar(50),
SALARY int ,
GENDER nvarchar(20),
CITY nvarchar(50)
)

select * from tblemployee

sp_helpindex tblemployee


insert into tblemployee values(1,'Sam',185000,'Male','London')
insert into tblemployee values(2,'Ram',105000,'Male','New York')

alter  table tblemployee 
add constraint UQ_tblemployee_city
unique (city)

sp_helptext UQ_tblemployee_city

