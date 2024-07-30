use SQL1
go

select* from tblemployee

create index IX_tblemployee_salary
on tblemployee  (salary desc)

drop  index tblemployee. IX_tblemployee_salary