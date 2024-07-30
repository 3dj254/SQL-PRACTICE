set transaction isolation level read uncommitted
select * from tblinventory 

set transaction isolation level read committed
select * from tblinventory (NOLOCK) WHERE Id=1