select top 10 * from tblProducts
select top 10 * from tblProductSales


update tblProductSales
 set UnitPrice=case
                   when Name='product - 55' then 55
				   when Name='product - 65' then 65
				   when Name like 'product - 100%' then 1000
			  end 

from tblProductSales s
join tblProducts p
on s.ProductId=p.Id
where  Name='product -55' or Name='product - 65' or  Name like 'product - 100%'

--if you do not put the where clause ensure you use else clause to return the unitprice otherwise the rest will be  updated to NULL
update tblProductSales
 set UnitPrice=case
                   when Name='product - 55' then 55
				   when Name='product - 65' then 65
				   when Name like 'product - 100%' then 1000
				   ELSE 
				       UnitPrice
			  end

from tblProductSales s
join tblProducts p
on s.ProductId=p.Id
--To check the result of the UPDATE statement, use the following query.
Select  Name, UnitPrice from 
tblProducts join
tblProductSales
on tblProducts.Id = tblProductSales.ProductId
where (Name='Product - 55' or Name='Product - 65' or 
Name like 'Product - 100%')