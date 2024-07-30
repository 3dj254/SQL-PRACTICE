-- creating local temporary table
create table #tblPersonDetails
(
Id int,
Name nvarchar(20)
)

insert into #tblPersonDetails values (3,'Jackson')

select * from  #tblPersonDetails

select name from tempdb..sysobjects
where name like '#PersonDetails%'

spLocalTemplate

 create proc spLocalTemplate
 as 
 begin
 create table #tblPersonDetails
(
Id int,
Name nvarchar(20)
)

insert into #tblPersonDetails values(1,'sam')
insert into #tblPersonDetails values(2,'Nelly')
insert into #tblPersonDetails values (3,'Jackson')

select * from  #tblPersonDetails
end

select* from  #tblPersonDetails
