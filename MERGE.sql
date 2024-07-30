create table StudentSource
(
Id int Primary key,
Name nvarchar(20)
)

create table StudentTarget
(
Id int Primary key,
Name nvarchar(20)
)

insert into StudentSource values (1,'Mike')
insert into StudentSource values (2,'Sara')


insert into StudentTarget values (1,'Mike M')
insert into StudentTarget values (3,'John')

select * from StudentSource
select * from StudentTarget

merge StudentTarget as T
USING StudentSource as S
on S.Id=T.Id
when matched then
 update set T.Name=S.name
when not matched  by Target then
 insert (Id,Name) values (S.Id,S.Name)
when not matched by source then
 delete;


 
Truncate table StudentSource
Truncate table StudentTarget
GO

Insert into StudentSource values (1, 'Mike')
Insert into StudentSource values (2, 'Sara')
GO

Insert into StudentTarget values (1, 'Mike M')
Insert into StudentTarget values (3, 'John')
GO

MERGE StudentTarget AS T
USING StudentSource AS S
ON T.ID = S.ID
WHEN MATCHED THEN
     UPDATE SET T.NAME = S.NAME
WHEN NOT MATCHED BY TARGET THEN
     INSERT (ID, NAME) VALUES(S.ID, S.NAME);



