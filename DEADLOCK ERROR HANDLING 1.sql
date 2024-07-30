exec spupdate1

alter proc spupdate1
as
begin
begin tran
begin try
update TableA set Name=Name + 'Transaction 1'
where Id in (1,2,3,4,5)
waitfor delay '00:00:10'
update TableB set Name=Name+'Transaction 1'
commit transaction
	select 'transaction successful'
end try 
begin catch
  if (ERROR_NUMBER()=1205)
  begin
      select 'DeadLock transaction failure please retry again'
  end
  rollback tran
end catch
end




