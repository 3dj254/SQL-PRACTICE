--transaction 2
begin transaction 

 declare @ItemsInStock int

 select @ItemsInStock=ItemsInStock 
 from tblinventory where Id=1

 --waitfor delay '00:00:01'
 set @ItemsInStock=@ItemsInStock-2
  

 update tblinventory 
 set ItemsInStock=@ItemsInStock where Id=1

 select @ItemsInStock
commit transaction 


