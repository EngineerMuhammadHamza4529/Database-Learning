use record
select * from pupil
select * from students
insert into pupil values (123,'abc',3,'ghn');
--------------------------------------------------------------------------group by-------------------------------
SELECT name,COUNT(name)FROM pupil GROUP BY name;
SELECT COUNT(name), ageFROM pupil GROUP BY age;
SELECT COUNT(name), age FROM pupilGROUP BY ageORDER BY COUNT(name) DESC;
Select name,avg(age) as averageAge from pupil where name like '%a%' group by name
SELECT Students.name, COUNT(students.marks) AS countOfmarks FROM studentsLEFT JOIN pupil ON students.name=pupil.name GROUP BY  students.name;

--with null
select location,count(name) from pupil where location is NULL group by location
--with all
Select name,sum(age) from pupil where name like 'a%' or name like 'c% 'group by all name
Select name,sum(age) from pupil where name like 's%' or name like 'c% 'group by name

-- having clause
select name, SUM(age) from pupil group by name having SUM(age) < 3

-------------------------rollup & cube-----------------------------------------------------------------------------------------------------------
create table data
(
name varchar(10),
batch varchar(10),
subjects int
)
drop table data
insert into data values('SHAHZAIB', '1805C1', 1)
insert into data values('SHAHZAIB', '1803B2', 2)
insert into data values('Zain', '1805C1', 2)
insert into data values('Zain', '1803B2', 1)

select * from data

select name,batch, SUM(subjects)
from data group by batch, name with rollup
-------------------or
select name,batch, SUM(subjects)
from data group by name, batch with rollup

select name,batch, SUM(subjects)
from data group by batch, name with cube
------------------------OR
select name,batch, SUM(subjects)
from data group by name, batch with cube