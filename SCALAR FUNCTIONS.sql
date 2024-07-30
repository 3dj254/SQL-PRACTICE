create function Calculateage1(@dob date)
returns int
as 
begin
declare @age int

 
 set @age= datediff(year,@dob,getdate()) -
       case
	     when (month(@dob)>month(getdate())) or
		      (month(@dob)=month(getdate()) and day(@dob) > day(getdate()))
         then 1
		 else 0
		end
return @age		
end

select ID,Name,dbo.Calculateage1(Dateofbirth) as age from tblemployees
where dbo.Calculateage1(Dateofbirth)>30

create proc spCalculateage1
@dob date
as 
begin
declare @age int

 
 set @age= datediff(year,@dob,getdate()) -
       case
	     when (month(@dob)>month(getdate())) or
		      (month(@dob)=month(getdate()) and day(@dob) > day(getdate()))
         then 1
		 else 0
		end
select @age		
end

execute spCalculateage1 '06/06/1924'

select ID,Name,dbo.spCalculateage1(Dateofbirth) as age from tblemployees
where dbo.Calculateage1(Dateofbirth)>30