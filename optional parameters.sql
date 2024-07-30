CREATE TABLE tblEmployee
(
 Id int IDENTITY PRIMARY KEY,
 Name nvarchar(50),
 Email nvarchar(50),
 Age int,
 Gender nvarchar(50),
 HireDate date,
)



Insert into tblEmployee values
('Sara Nan','Sara.Nan@test.com',35,'Female','1999-04-04')
Insert into tblEmployee values
('James Histo','James.Histo@test.com',33,'Male','2008-07-13')
Insert into tblEmployee values
('Mary Jane','Mary.Jane@test.com',28,'Female','2005-11-11')
Insert into tblEmployee values
('Paul Sensit','Paul.Sensit@test.com',29,'Male','2007-10-23')
 
select * from tblemployee

exec  sPgetemployee 

CREATE PROCEDURE sPgetEmployee
  @Name NVARCHAR(50) = NULL,
  @Email NVARCHAR(50) = NULL,
  @Age INT = NULL
AS
BEGIN
  SELECT *
  FROM tblEmployee
  WHERE 
    (@Name IS NULL OR Name = @Name)  AND
    (@Email IS NULL OR Email = @Email) AND
    (@Age IS NULL OR Age = @Age);
END




