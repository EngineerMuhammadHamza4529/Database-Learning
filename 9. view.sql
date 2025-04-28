use record1
CREATE VIEW firstBatch
 		As 
		SELECT name, marks FROM students --run this first to understand difference

select * from students				---------------table
SELECT *  FROM  firstBatch			-------------view

------------------------restricting row----------------------------

CREATE VIEW firstBatch1
 		As 
		SELECT * FROM students where marks>50
select * from firstBatch1

--OR making view with  a view
CREATE VIEW firstBatch2
 		As 
		SELECT * FROM firstBatch where marks>50
select * from firstBatch2

--------------------------------view with aggregate function

create view firstBatch3
as
select avg(marks) as AverageMarksOf1stBatch from students

select * from firstBatch3
INSERT INTO students (name,marks)  VALUES('sameer',80);
---------------------------------------------------view with two tables
select * from ordr
select * from product
insert into ordr (p_id,quantity) values (4,30)

create view firstbatch4
as
select p.p_name, o.quantity FROM ordr o
 	INNER JOIN 
	product p ON o.p_id = p.p_id;
	select * from firstbatch4

---------------------------you can do everything on this view table-------------------

----updating view
UPDATE firstBatchSET marks=70 where name='anas'; 

----inserting in a view
INSERT INTO firstBatch  VALUES('abcd',80);

----droping view
DROP VIEW firstBatch;
/*dropping table doesnot drop its view, however it doesnot fetch any output */

-------------------------------------------Altering view
ALTER VIEW firstBatch
		AS
		SELECT * FROM students

----------------------------another example explaining about not null
creaTE TABLE ABV
(
NAME VARCHAR(10),
AGE INT NOT NULL);
SELECT * FROM ABV
INSERT INTO ABV  VALUES('AATIKA',80);


CREATE VIEW firstBatch11
 		As 
		SELECT NAME FROM ABV 
INSERT INTO firstBatch11  VALUES('AATIKA');
		SELECT * FROM firstBatch11;
DROP VIEW firstBatch11
DROP TABLE ABV

-------------------------------viewing view defination--------------------------------------
--method1
Sp_helptext firstBatch;
--method2
select definition from sys.sql_modules 
		where object_id=object_id('firstBatch');
--method3
select object_definition(object_id('firstBatch'));


------------------------------------------------------------------------------------------------xxxxxxxxxxxxxxxxxxx------------------------------
-----With SCHEMABINDING 


use abc
select * from abcd
CREATE VIEW DemoSampleView 
With SCHEMABINDING 
As 
SELECT name, id FROM DBO.abcd;
select * from DemoSampleView 


drop VIEW DemoSampleView 
drop table abcd -- you can't alter the table

------------------With ENCRYPTION
ALTER VIEW DemoSampleView 
		AS
		SELECT name FROM DBO.abcd;
--------------------
CREATE VIEW DemoView 
With ENCRYPTION
As 
SELECT name, id FROM DBO.abcd;
Sp_helptext DemoView ;
-----------------------------------------------local partioned view
--creating db1
create database db1
USE db1
create table s1(
id int,
course varchar(50),
marks int
)
insert into s1 values(1,'CPISM',100)
insert into s1 values(2,'DISM',90)
insert into s1 values(3,'CPISM',50)
insert into s1 values(4,'ADSE',70)
select * from s1
--creating db2
create database db2
USE db2
create table s2(
id int,
name varchar(50),
age int
)
insert into s2 values(1,'hamza',18)
insert into s2 values(2,'anas',19)
insert into s2 values(3,'shahzaib',20)
insert into s2 values(4,'ahsan',20)
select * from s2

---creating view
CREATE VIEW  vw_LP
ASSELECT  
s.id, ss.name, s.marksFROM db1.dbo.s1 s 
 	INNER JOIN 
	db2.dbo.s2 ss ON s.id = ss.id;

select * from vw_LP

-----------------------------------------------global partioned view
----creating a table
create table s1(

id int,
course varchar(50),
marks int
)

insert into s1 values(1,'CPISIM',100)
insert into s1 values(2,'DISM',90)
insert into s1 values(3,'CPISM',50)
insert into s1 values(4,'ADSE',70)

select * from s1

-----linking the server
sp_addlinkedserver '10.0.0.161'

-----creating global partitioned view
create view vw_gp
as select s1.id,s1.course,s1.marks  from s1 inner join [10.0.0.161].db2.dbo.s2 
on s1.id=s2.id;

select* from vw_gp

--------------------------show server change------------------------------ 