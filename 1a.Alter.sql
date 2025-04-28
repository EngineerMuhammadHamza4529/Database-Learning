--------------------------------------ALTER TABLE--------------------------------------------


create table tabb(id int, name varchar(50),age int, d_o_b date,fname varchar(50))

-----------------Deleting a column from table
alter table tabb
drop column d_o_b


------------------Changing datatype of a column in table
alter table tabb
alter column age varchar(50)

-----------------Addign a new column in table
alter table tabb
add phone varchar(50)


-----------------Changing name of a column
EXEC sp_RENAME 'tabb.id', 'idd', 'COLUMN'