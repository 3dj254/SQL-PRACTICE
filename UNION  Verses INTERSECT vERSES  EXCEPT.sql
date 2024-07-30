select * from  TableA
select * from TableB

Create Table TableA
(
    Id int,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

Insert into TableA values (1, 'Mark', 'Male')
Insert into TableA values (2, 'Mary', 'Female')
Insert into TableA values (3, 'Steve', 'Male')
Insert into TableA values (3, 'Steve', 'Male')
Go

Create Table TableB
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

Insert into TableB values (2, 'Mary', 'Female')
Insert into TableB values (3, 'Steve', 'Male')
Insert into TableB values (4, 'John', 'Male')
Go

select Id,Name,Gender from TableA
union
select Id,Name,Gender from TableB

select Id,Name,Gender from TableA
union all
select Id,Name,Gender from TableB


select Id,Name,Gender from TableA
intersect
select Id,Name,Gender from TableB


select Id,Name,Gender from TableA
except
select Id,Name,Gender from TableB

select Id,Name,Gender from TableB 
except
select Id,Name,Gender from TableA