Create table Sales
(
    Product nvarchar(50),
    SaleAmount int
)
Go

Insert into Sales values ('iPhone', 500)
Insert into Sales values ('Laptop', 800)
Insert into Sales values ('iPhone', 1000)
Insert into Sales values ('Speakers', 400)
Insert into Sales values ('Laptop', 600)
Go

select	product,sum(SaleAmount) as Total
from sales
group by product

select Product,sum(SaleAmount) as Total
from Sales
where Product in ('iphone','laptop')
group by Product

select Product,sum(SaleAmount) as Total
from Sales
group by Product
having  Product in ('iphone','laptop')

select Product,sum(SaleAmount) as Total
from Sales
where Product in ('iphone','laptop')
group by Product
having sum(SaleAmount)>1400