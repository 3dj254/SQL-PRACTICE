
select * from errorproduct
select * from errorproductsales



exec spsellproduct 2,10
alter proc spSellProduct
 @ProductId int,
 @Quantitysales int
as
begin
   declare @stockAvailable int
   select @stockAvailable=QtyAvailable
   from errorproduct where ProductId=@ProductId

if (@stockAvailable< @Quantitysales)
      begin
      raiserror(' stock not enough',16,1)
	  end
else
    begin
	begin try
	begin tran
	  update errorproduct set QtyAvailable=(QtyAvailable-@Quantitysales)
	  where ProductId=@ProductId

       declare @MaxProductSalesId int
       select @MaxProductSalesId= case
	      when max(ProductSalesId)is null then
	       0 else max(ProductSalesId) end from errorproductsales

      set @MaxProductSalesId=@MaxProductSalesId+1
      insert into errorproductsales values (@MaxProductSalesId,@ProductId,@Quantitysales)
    commit tran
	    End Try
    Begin Catch 
  Rollback Transaction
  Select 
   ERROR_NUMBER() as ErrorNumber,
   ERROR_MESSAGE() as ErrorMessage,
   ERROR_PROCEDURE() as ErrorProcedure,
   ERROR_STATE() as ErrorState,
   ERROR_SEVERITY() as ErrorSeverity,
   ERROR_LINE() as ErrorLine
    End Catch 
	end
end