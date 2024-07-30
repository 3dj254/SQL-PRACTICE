select ABS(-15.2)

select CEILING(19.9)
select CEILING(-19.9

select FLOOR(30.1)
select FLOOR(-30.1)

select POWER(2,200)

select SQUARE(60)

select SQRT(1024)
select PI() 

select RAND()
select FLOOR(RAND()* 100)

declare @counter int
set    @counter=1
while  @counter<=10
begin 
     print FLOOR(RAND()* 100)
	 set @counter=@counter+1
end

select ROUND(8588.3459,-2)