
create database alif
use alif
create table students
(
name varchar(10),
sem varchar(10),
faculty varchar(10)
)


insert into students values ('maib','cpism','missaatika')
select * from students
delete from students


--------------------------------------------CReating trigger1
CREATE TRIGGER students_trig1
    ON students
    AFTER INSERT, UPDATE   
    AS 
    print 'Value inserted'
    GO  

	 drop trigger students_trig1
--------------------------------------CReating trigger2
CREATE TRIGGER students_trig2
    ON students
    AFTER INSERT, UPDATE   
    AS 
   insert into students values ('ooo','cpism','missaatika')
    GO  

	 drop trigger students_trig2
--------------------------------------------CReating trigger3
CREATE TRIGGER students_trig3
    ON students
    AFTER INSERT, UPDATE   
    AS 
	begin
	Declare @faculty varchar(10)
	set @faculty=(select faculty from inserted)
print 'faculty is '+@faculty
 end
 go
  drop trigger students_trig3



 ----------------------------------------------CReating trigger4
 CREATE TRIGGER students_trig4
    ON students
    AFTER UPDATE   
    AS 
	begin
	Declare @faculty varchar(10)
	Declare @faculty2 varchar(10)
	set @faculty2=(select faculty from inserted)
	set @faculty=(select faculty from deleted)
print 'old faculty was '+@faculty+' and new faculty is '+@faculty2
 end
 go

 update students set faculty='missShazia' where name='maib'

 drop trigger students_trig4

 --------------------------------------------CReating trigger5

  CREATE TRIGGER students_trig5
    ON students
    AFTER INSERT, UPDATE   
    AS 
	IF (SELECT faculty from Inserted) != 'missaatika'
	begin
print 'very bad'
 end
 go

 insert into students values ('zain','cpism','missshazia')
  update students set faculty='missShazia' where name='maib'
  drop trigger students_trig5
  ------------------------------------------------------------------------
  ---- Viewing the Trigger

sp_helptext students_trig5


--------------------------- Modifying the trigger

ALTER TRIGGER students_trig5
ON students
WITH ENCRYPTION
FOR UPDATE
AS
	IF (SELECT faculty from Inserted) != 'missaatika'
	begin
print 'very bad'
 end
 go

 insert into students values ('maib','cpism','missshazia')
  update students set faculty='missShazia' where name='maib'


 ----------------------xxxxxxxxxxxxxxxxxx--------------------------------------------------------------------------



use alif
create table employee
(emp_id int,
emp_name varchar(50),
grade varchar(50),
salary int
)

create table back_up
(
gdate date,
lastempid int,
newempid int ,
lastemp_name varchar(50),
newemp_name varchar(50),
lastgrade varchar(50),
newgrade varchar(50),
lastsalary int,
newsalary int
)

CREATE TRIGGER tigg_emp 
   ON employee
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	Declare @last_empid int
	Declare @new_empid int
	
	set @last_empid=(select emp_id from deleted)
	set @new_empid=(select emp_id from inserted)

	Declare @last_empname varchar(50)
	Declare @new_empname varchar(50)

	set @last_empname=(select emp_name from deleted)
	set @new_empname=(select emp_name from inserted)

	Declare @last_grade varchar(50)
	Declare @new_grade varchar(50)

    set @last_grade=(select grade from deleted)
    set @new_grade=(select grade from inserted)

	Declare @last_salary int
	Declare @new_salary int

	set @last_salary=(select salary from deleted)
	set @new_salary=(select salary from inserted)

	insert into back_up
	values(GETDATE(),@last_empid,@new_empid,@last_empname,@new_empname,@last_grade,@new_grade,@last_salary,@new_salary)

END
GO
------------------------------------------Testing
select * from back_up
insert into employee values(101,'saba','A+',50000)
delete from employee where emp_id=101
update employee set emp_name = 'iqra' where emp_id=101


-------------------------------------Triggeres with transaction----------------


CREATE TRIGGER bank
ON BankAcc
FOR INSERT
AS
IF (SELECT Amount from Inserted) > 1000
    BEGIN
      PRINT 'Quantity cannot exceed more than 1000'
      ROLLBACK TRANSACTION
END

insert into BankAcc values (103, 'zardari', 1000000)