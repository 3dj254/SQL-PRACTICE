CREATE TRIGGER [Trigger_Name]
ON [Scope (Server|Database)]
FOR [EventType1, EventType2, EventType3, ...],
AS
BEGIN
   -- Trigger Body
END

CREATE TRIGGER trMyFirstTrigger
ON Database
FOR CREATE_TABLE
AS
BEGIN
   Print 'New table created'
END

ALTER TRIGGER trMyFirstTrigger
ON Database
FOR  CREATE_TABLE,ALTER_TABLE, DROP_TABLE
AS
BEGIN
   Print 'you have  created,altered, drop a table '
END

ALTER TRIGGER trMyFirstTrigger
ON Database
FOR  CREATE_TABLE,ALTER_TABLE, DROP_TABLE
AS
BEGIN
 rollback
   Print 'you  cannot created,altered, drop a table '
END


create table test (id int)
DROP TABLE test

