select is_user_process,ORIGINAL_LOGIN_name, *
from sys.dm_exec_sessions order by login_time desc

 drop trigger tr_LogonAuditTriggers
ON ALL SERVER

AlTEr TRIGGER tr_LogonAuditTriggers
ON ALL SERVER
FOR LOGON
AS
BEGIN
    DECLARE @LoginName NVARCHAR(100)

    Set @LoginName = ORIGINAL_LOGIN()

    IF (SELECT COUNT(*) FROM sys.dm_exec_sessions
         WHERE is_user_process = 1
         AND original_login_name = @LoginName) > 5
    BEGIN
         Print 'Fourth connection of ' + @LoginName + ' blocked'
         ROLLBACK
    END
END