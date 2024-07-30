set deadlock_priority low
begin transaction 
update TableA set Name= Name + 'Transaction 1'

update TableB set Name= Name + 'Transaction 1'

commit tran
