create database xyz
use xyz5

--------------------------------------------------------------table 1
 create table students
(
id int IDENTITY(1,1) PRIMARY KEY,
firstName  varchar(30),
lastName varchar(30),
email varchar(30),
city varchar(30),
phone varchar(30)
)
select * from students
insert into students values('hamza', 'shoaib', 'hamza@gmail.com', 'karachi', '626-222')
-----------------------------------------------------------table 2
create table pupil
(
id int,
name varchar(50),
marks int,
location varchar(30)
)

insert into pupil (id, name, marks, location) values (1, 'hamza', '50', 'Karachi')
insert into pupil (id, name, marks, location) values (2, 'maib', '50', 'Karachi')


--------------------------------------------------------------------------------Stored Procedure-----------

/*


A procedure can contain any valid Transact-SQL command except these:
 CREATE DEFAULT, CREATE FUNCTION, CREATE PROC, CREATE RULE, CREATE SCHEMA, 
 CREATE TRIGGER, CREATE VIEW, SET SHOWPLAN_TEXT, and SET SHOWPLAN_ALL. 
 These commands must reside in their own command batches, and, therefore, 
 can't be part of a stored procedure. Procedures can create databases, 
 tables, and indexes, but not other procedures, defaults, functions, rules, 
 schemas, triggers, or views.
*/



------------------------select query procedure --

create PROCEDURE select1
as
BEGIN
    SELECT id  ,firstname  ,phone 
    FROM students
END
GO
exec select_pro1

-------------------------------------

create procedure select2
as

 select id, name from pupil


go

 select2--you can also excute it witout using the keyword exec

 -------------------------------------------

------- search procedure --


create PROCEDURE search1
@location varchar(10)
AS
begin
SELECT id,firstnameFROM studentsWHERE city = @location
end
go

exec search1  'karachi'

select * from students

----------------search like wild_card --

Create procedure search2
@city123 varchar(20) 
as
begin
Select * from pupil where location like @city123
end
go

exec search2 'k%'

--------------------------------------INSERT procedure----





create procedure deleterec
@name varchar(50)
as 
begin
delete from students where firstName= @name
end


deleterec 'hamza'



select * from students

---1st-------

create procedure insert1
(
@firstName varchar(50), 
@lastName varchar(50),
@email varchar(30),
@city varchar(30),
@phone varchar(30)
)
as
begin
insert into students values(@firstName,@lastName,@email,@city,@phone)
end
go
select *  from students
exec insert1 'anas','zaki','anas@gamil.com','karachi','123-236'

---UPDATE---


create procedure update1
@id int,
@name varchar(50),
@marks bigint,
@location varchar(30)
as
begin
update pupil set name=@name,
				marks=@marks,
					location=@location
	where id=@id
end



exec update1 2, 'maib' ,125469873,'balochistan'

select * from pupil

--------delete------

create proc delete1
@id int
as
begin

delete from students where id=@id
end
go

exec delete1 1
select * from students

if()
{
}

if
begin 
end


------------------------------------------------------------------------------------------------
create procedure yourChoice

@choice varchar(50),
@id int,
@name varchar(50),
@marks bigint,
@location varchar(30)


as
begin
	
		if @choice='INSERT' 
			begin
				insert into pupil values(@id,@name,@marks,@location)

			end


		if @choice='SELECT'
			begin

				select * from pupil
			end


		if @choice='UPDATE'
			begin
				update pupil set name=@name,
						marks=@marks,
						location=@location
						where id=@id
			end
			

		else if @choice='DELETE'
			begin
				delete from pupil where id=@id
			end
end



yourchoice 'insert',3,'saif',600,'islamabad'
yourchoice 'select',3,'saif',600,'islamabad'
yourchoice 'delete',3,'saif',600,'islamabad'

yourchoice @choice='insert',@id=3


exec yourChoice @choice='INSERT' , @id=9 , @name='hashim' , @marks='100' , @location='gujraat'
exec yourChoice @choice='UPDATE' , @id=3 ,@name='maib' , @marks='100' , @location='KARAHCI'
exec yourChoice @choice='SELECT'
select * from pupil

drop procedure yourChoicee