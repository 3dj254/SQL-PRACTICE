select * from tblemployee

create view vWEmployeesdetails
as
select Id, name, gender,city
from tblemployee

---you can fiter gender in the where clause                                                                                                                                                                                                                                                                                                                                                                                     
select * from  vWEmployeesdetails where Gender='male'

---inline table valued function as a replacement for ----parametized views
create function fnEmployeedetails(@Gender nvarchar(20))
returns table
as
return (select ID,name,Gender,city
from tblemployee where Gender=@Gender)

select * from dbo.fnEmployeedetails('female')
