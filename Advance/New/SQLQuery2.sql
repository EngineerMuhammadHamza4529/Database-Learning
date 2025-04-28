create database abc
alter database abc modify name=abcd
use master;
drop database abcd;
create database xyz;

use xyz;
create table beta(
id int identity(1,1),
name varchar(20),
password int,
email varchar(20)
)

-- To drop a column
alter table beta
drop column email

-- To rename a column
exec sp_rename 'beta.name','username','COLUMN'

-- To add a new column
alter table beta
add contact varchar(20)

-- To add unique to username
alter table beta
add constraint username unique(username)

-- To drop column with a unique constarint
alter table beta drop constraint username  --specific key name mention karna hai
alter table beta
drop column username

-- to add primary key
alter table beta
add constraint id primary key(id)