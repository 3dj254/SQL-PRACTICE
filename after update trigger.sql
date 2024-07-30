select * from tblemployee

insert into tblemployee values (1,'Kim',25000,'Male','Ruiru')

insert into tblemployee values (2,'Jane',19000,'Female','Nazareth')
							   
insert into tblemployee values(3,'Phaty',10000,'Male','Mutuya')
							  
insert into tblemployee values (4,'Maina',25000,'Male','Watethie')
							  
insert into tblemployee values (7,'kinuthia',9500,'Female','Angala')




  create trigger tr_tblemployee_forUpdate
  on tblemployee
  for update
  as
  begin 
     select * from inserted
	 select * from deleted
end


update tblemployee
set NAME='Kimsky',SALARY=87500, GENDER='Female',City='Wiston'
where ID=1

select * from tblemployeeaudit
select * from tblemployee

Alter trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
      -- Declare variables to hold old and updated data
      Declare @Id int
      Declare @OldName nvarchar(20), @NewName nvarchar(20)
      Declare @OldSalary int, @NewSalary int
      Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
      Declare @Oldcity nvarchar(50), @Newcity nvarchar(50)
     
      -- Variable to build the audit string
      Declare @AuditString nvarchar(1000)
      
      -- Load the updated records into temporary table
      Select *
      into #TempTable
      from inserted
     
      -- Loop thru the records in temp table
      While(Exists(Select Id from #TempTable))
      Begin
            --Initialize the audit string to empty string
            Set @AuditString = ''
           
            -- Select first row data from temp table
            Select Top 1 @Id = Id, @NewName = Name, 
            @NewGender = Gender, @NewSalary = Salary,
            @Newcity= city
            from #TempTable
           
            -- Select the corresponding row from deleted table
            Select @OldName = Name, @OldGender = Gender, 
            @OldSalary = Salary, @Oldcity= city
            from deleted where Id = @Id
   
     -- Build the audit string dynamically           
            Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(4)) + ' changed'
            if(@OldName <> @NewName)
                  Set @AuditString = @AuditString + ' NAME from ' + @OldName + ' to ' + @NewName
                 
            if(@OldGender <> @NewGender)
                  Set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender
                 
            if(@OldSalary <> @NewSalary)
                  Set @AuditString = @AuditString + ' SALARY from ' + Cast(@OldSalary as nvarchar(10))+ ' to ' + Cast(@NewSalary as nvarchar(10))
                  
     if(@Oldcity <> @Newcity)
                  Set @AuditString = @AuditString + ' city from ' + Cast(@Oldcity as nvarchar(10))+ ' to ' + Cast(@Newcity as nvarchar(10))
           
            insert into tblEmployeeAudit values(@AuditString)
            
            -- Delete the row from temp table, so we can move to the next row
            Delete from #TempTable where Id = @Id
      End
End

