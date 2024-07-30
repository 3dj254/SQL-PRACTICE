USE JOINS 
GO

create table tblproducts
(
Productid int ,
name nvarchar(20),
Unitprice int
)



insert into tblproducts values (4,'clips',10)

select* from tblproducts

create table tblproductsales
(
productid int ,
quantitysold int
)

insert into tblproductsales values (1,14)

select * from tblproductsales


create view vWTotalsalesbyproduct
with schemabinding
as
select  name,
sum(ISNULL((quantitysold* Unitprice),0)) as totalsales,
COUNT_BIG(*) as totaltransactions
from dbo.tblproductsales
join dbo.tblproducts
on dbo.tblproducts.Productid=dbo.tblproductsales.productid
group by name

select * from vWTotalsalesbyproduct

 create  unique clustered index UIX_vWTotalsalesbyproduct_name
 on vWTotalsalesbyproduct(name)