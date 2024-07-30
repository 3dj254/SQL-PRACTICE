select * from tblemployees
---inlined table
create function fn_ILTVF_Getemployees()
returns table 
as
  return (select ID, Name,cast(DateofBirth as date) as	DOB from tblemployees )

select* from dbo.fn_ILTVF_Getemployees()
update fn_ILTVF_Getemployees() set Name='Sammy' where ID=1

--- mutli-statement table
create function fn_MSTVF_Getemployees()
returns @table table(ID int, NAME nvarchar(20),DOB date)
as 
begin
     insert into @table
	 select ID, NAME,cast(DateofBirth as date) from tblemployees
	 return
end

select * from dbo.fn_MSTVF_Getemployees()
update dbo.fn_MSTVF_Getemployees() set Name='Sam' where ID= 1