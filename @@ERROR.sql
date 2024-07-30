select * from errorproduct
select * from errorproductsales


drop proc spGetSales

exec spGetsales 1,10

alter proc spGetSales
@ProductId int,
@QuantityToSell int
as 
begin 
   declare @StockAvailable int
   select @stockAvailable=QtyAvailable
    from errorproduct where ProductId=@ProductId
if (@StockAvailable < @QuantityToSell)
   begin
   raiserror('stock not enough',16,1)
   end
else
   begin
   begin tran
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
    if(@@ERROR <> 0)
  Begin
   Rollback Tran
   Print 'Rolled Back Transaction'
  End
  Else
  Begin
   Commit Tran 
   Print 'Committed Transaction'
  End
  end
End



Insert into errorproduct values(2, 'Mobile Phone', 1500, 100)
if(@@ERROR <> 0)
 Print 'Error Occurred'
Else
 Print 'No Errors'

Insert into errorproduct values(2, 'Mobile Phone', 1500, 100)
--At this point @@ERROR will have a NON ZERO value 
Select * from errorproduct
--At this point @@ERROR gets reset to ZERO, because the 
--select statement successfullyexecuted
if(@@ERROR <> 0)
 Print 'Error Occurred'
Else
 Print 'No Errors'

Declare @Error int
Insert into errorproduct values(2, 'Mobile Phone', 1500, 100)
Set @Error = @@ERROR
Select * from errorproduct
if(@Error <> 0)
 Print 'Error Occurred'
Else
 Print 'No Errors'
