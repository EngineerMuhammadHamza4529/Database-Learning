
exec sp_tables '%','dbo','class'

sp_databases

execute sp_who'sa'

execute sp_help 'students'

EXEC sp_renamedb 'new_name', 'DB_NAME'

USE DB_NAME
EXEC sp_rename 'students11', 'students';

EXEC sp_renamedb 'new_name', 'DB_NAME'

sp_helptext 'sp_renamedb'


--https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/database-engine-stored-procedures-transact-sql?view=sql-server-2017

--------------------------- new user
execute sp_addlogin 'abc','123','record'
exec sp_adduser 'abc'
exec sp_droplogin 'abc'

