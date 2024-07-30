set transaction isolation level repeatable read

 begin transaction
 select * from tblinventory
 where Id=1

 waitfor delay '00:00:15'
 select * from tblinventory
 where Id=1

 commit transaction
