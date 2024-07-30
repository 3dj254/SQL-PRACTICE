create table errorproduct
(
ProductId int primary key,
Name nvarchar(20),
UnitPrice int,
QtyAvailable int
)

Insert into errorproduct values(1, 'Laptops', 2340, 100)
Insert into errorproduct values(2, 'Desktops', 3467, 50)

create table errorproductsales
(
 ProductSalesId int primary key ,
 ProductId int,
 QuantitySold int
)

 select * from errorproduct
 select * from errorproductsales
  
  drop table errorproduct
  drop table errorproductsales

  
execute spGetSales 1,10

alter proc spGetSales
@ProductId int,
@QuantityTosell int
as
begin
   -- Check the stock available, for the product we want to sell
 Declare @StockAvailable int
 Select @StockAvailable = QtyAvailable 
 from errorproduct where ProductId = @ProductId
 
 -- Throw an error to the calling application, if enough stock is not available
 if(@StockAvailable < @QuantityToSell)
   Begin
  Raiserror('Not enough stock available',16,1)
   End
 -- If enough stock available
 Else
   Begin
    Begin Tran
         -- First reduce the quantity available
  Update errorproduct set QtyAvailable = (QtyAvailable - @QuantityToSell)
  where ProductId = @ProductId
  
  Declare @MaxProductSalesId int
  -- Calculate MAX ProductSalesId  
  Select @MaxProductSalesId = Case When 
          MAX(ProductSalesId) IS NULL 
          Then 0 else MAX(ProductSalesId) end 
         from errorproductsales
  -- Increment @MaxProductSalesId by 1, so we don't get a primary key violation
  Set @MaxProductSalesId = @MaxProductSalesId + 1
  Insert into errorproductsales values(@MaxProductSalesId, @ProductId, @QuantityToSell)
if (@@ERROR<>0)
   begin
   rollback transaction
   print 'Transaction rolled back'
   end
else
    begin
    Commit Tran
	print 'Transaction commited'
	end
   End
End




