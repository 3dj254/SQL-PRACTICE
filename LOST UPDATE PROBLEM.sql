

--transaction 1

begin transaction 

 declare @ItemsInStock int

 select @ItemsInStock=ItemsInStock 
 from tblinventory where Id=1

 waitfor delay '00:00:15'
 set @ItemsInStock=@ItemsInStock-1
  

 update tblinventory 
 set ItemsInStock=@ItemsInStock where Id=1

 select @ItemsInStock

commit transaction 


