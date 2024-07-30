USE [Timeline]
GO

execute spcalculateage'10/2/1953'

Create proc spCalculateage
@DOB date
as
begin

declare @age int

set @age= DATEDIFF(year,@DOB,GETDATE()) -
      case
		 when (MONTH(@DOB)>MONTH(GETDATE())) or
		     (month(@DOB)=MONTH(GETDATE()) and DAY(@DOB)> DAY(GETDATE()))
		 THEN 1
		 ELSE 0
	 END
select @age as age
end



