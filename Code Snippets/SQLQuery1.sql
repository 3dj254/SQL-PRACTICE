create table tblcustomer2
(
personid int  identity (1,1)not null primary key,
name nvarchar(50) not null
);

select * from  tblcustomer1

set IDENTITY_INSERT tblcustomer1 off
insert into tblcustomer1  values ('don')

DBCC CHECKIDENT ('tblcustomer1' , RESEED,0) 

DELETE  FROM tblcustomer1