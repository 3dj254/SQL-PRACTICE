 create table tblRutopropaganda
 (
 Id int  primary key,
 ProjectName nvarchar(1000),
 Funds int,
 ProgressId int
 )
 

 create table rutosuccess
 (
 ProgressId int primary key,
 DciGENZ nvarchar(20) not null
 )
 
 select * from  tblRutopropaganda

 insert into  tblRutopropaganda values (2,'housingproject',300,3)