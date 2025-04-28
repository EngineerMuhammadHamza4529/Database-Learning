--creating a database
create database www;
-- using database
use www;
--rename a database
alter database www
modify name  = neww
-- deleting a database
drop database neww;
--creating a table
create table Students(
id int, 
st_name varchar(50), 
f_name varchar(50),
st_address varchar(50),
d_o_b date
);
-- deleting a table
drop table Students
--renaming a table
sp_rename 'Students', 'Pupils'
--------------Alter Table
-- add a new column
alter table Pupils 
add m_name varchar(50);
-- deleting a column
alter table Pupils
drop column st_address
--changing datatype
alter table Pupils
alter column nationality int
--renaming a column
sp_rename 'dbo.Pupils.m_name', 'nationality','column'