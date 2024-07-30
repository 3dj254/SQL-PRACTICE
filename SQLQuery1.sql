USE Timeline
go

create table tbldatetime
(
C_time time(7) null,
c_date date null,
C_smalldatetime smalldatetime null,
C_datetime datetime null,
C_datetime2 datetime2(7) null,
C_datetimeoffset datetimeoffset(7)null
)

select * from tbldatetime 

INSERT INTO tbldatetime (C_time, c_date, C_smalldatetime, C_datetime, C_datetime2, C_datetimeoffset)
VALUES ('12:34:56.7891234', '2024-06-20', '2024-06-20 12:34:00', '2024-06-20 12:34:56.789', '2024-06-20 12:34:56.7891234', '2024-06-20 12:34:56.7891234 +00:00');


insert into tblemployees values (1,'Sam', '1980-12-30 00:00:00.000')

select GETDATE()

select  current_timestamp

select SYSDATETIME()

select SYSDATETIMEOFFSET()

select GETUTCDATE()

select isdate ('2020-12-31 ')

select day(getdate())
select DAY('01/31/2012')

select month(getdate())
select month('01/31/2012')

select year(getdate())
select year('01/31/2012')
