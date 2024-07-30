SELECT * FROM StudentTarget
 
 ALTER TABLE StudentTarget

 update  StudentTarget
 set Account=1200 where Id=3

 begin try 
  begin transaction 
    update StudentTarget set Account=account+500 where Id=1
	update StudentTarget set Account=account-500 where Id='a'
   commit transaction 
   print 'transcation commmitted'
  
end try
begin catch
  Rollback Transaction
  print 'transaction rolled back'
end catch  