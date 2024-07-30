SELECT *from dbo.tblPerson
delete  from dbo.tblPerson  where id in (4);


alter table dbo.tblPerson
add constraint  CK_tblPerson_AGE CHECK (AGE>0 AND AGE<70)

alter table dbo.tblPerson
drop constraint  CK_tblPerson_AGE 



insert into tblPerson values (5, 'Zumbi', 54, 2)

alter table dbo.tblperson
drop constraint UQ_tblPerson_AGE