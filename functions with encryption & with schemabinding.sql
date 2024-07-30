alter function fn_GetNameById( @ID int)
returns nvarchar(20)
with schemabinding
as
begin 
     return(select Name from dbo.tblemployees where ID=@ID)
end

select dbo.fn_GetNameById(2)

sp_helptext  fn_GetNameById

drop table tblemployees