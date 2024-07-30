select * from tblProducts
select * from tblproductsales

--Example of a non-correlated subquery 
select ID,Name,Description
from tblProducts where ID not in (select distinct ProductId from tblproductsales)

--Example of a correlated subquery
select Name,
(select sum(Quantitysold) from tblproductsales where ProductId=p.ID)
from tblProducts p