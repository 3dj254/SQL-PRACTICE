CREATE TABLE tblinventory
(
Id int  identity primary key,
Item nvarchar(20),
ItemsInStock int
)

insert into tblinventory values ('Iphone',20)

begin transaction 
 update tblinventory set ItemsInStock=18 where Id=1

 ---billing the customer
 waitfor delay '00:00:15'
 --insucciffient funds
 rollback transaction
