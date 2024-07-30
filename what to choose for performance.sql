select count(*) from tblProducts
select count(*) from tblProductSales

CHECKPOINT; 
GO 
DBCC DROPCLEANBUFFERS; -- Clears query cache
Go
DBCC FREEPROCCACHE; -- Clears execution plan cache
GO


select distinct p.Id, Name, Description
from tblProducts p
where Id in (select productId from tblProductSales)


select  distinct p.Id,Name,Description
 from tblProducts p
 join tblProductSales s
 on p.Id=s.ProductId

 select Id,Name,Description
  from tblProducts p
  where not exists (select ProductId  from tblProductSales where ProductId=p.Id)

  select p.Id,Name,Description
  from tblProducts p
  left join tblProductSales s
  on p.Id=s.ProductId
  where s.ProductId is null