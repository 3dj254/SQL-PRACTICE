create  table tblProducts
(
ID int identity(1,1) primary key,
Name nvarchar(20),
Description nvarchar(250)
)

create table tblproductsales
(
 ID int primary key identity,
 ProductId int foreign key references tblproducts(ID),
 UnitPrice int,
 Quantitysold int
 )

 insert into tblProducts values ('TV','52 inch black colour LCD TV')
 insert into tblProducts values ('Laptop','Very thin black color acer laptop')
 insert into tblProducts values ('Desktop','HP high performance desktop')

insert into tblproductsales values (3,450,5)
insert into tblproductsales values (2,250,7)
insert into tblproductsales values (3,450,4)
insert into tblproductsales values (3,450,9)

select * from tblProducts
select * from tblproductsales

select Id,Name,[Description]
from tblproducts
where ID not in (select  distinct productid from tblproductsales) 

select p.Id,Name , [Description]
from tblProducts p
left join tblproductsales s
on p.ID=s.ProductId
where s.ProductId is null

--select Name and quantitysold
select Name ,
(select sum(Quantitysold) from tblproductsales where ProductId=p.ID)as sales
from tblProducts p
--where p.ID=2
order by Name


select Name ,sum(Quantitysold) as sales
from tblProducts p
left join tblproductsales s
on p.ID=s.ProductId
--where ProductId=2
group by Name