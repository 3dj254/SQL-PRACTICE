begin transaction 
update TableB set Name='Mary Transaction 2'

update TableA set Name='Mark Transaction 2'
commit transaction
