begin tran
update TableB set Name= Name + 'Transaction 2'

update TableA set Name= Name + 'Transaction 2'

commit tran