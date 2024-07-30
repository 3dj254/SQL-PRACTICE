create table ##persondetails
(
ID int,
NAME nvarchar(20)
)

insert into #persondetails values (4, 'Beth')


select * from #persondetails

select name from tempdb..sysobjects
where name like '#persondetails%'

create proc spGetNameByID
@ID INT
as
begin 
  select Name from #persondetails where ID='@ID'
end

