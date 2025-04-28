create database record
use record
CREATE table students(name varchar(10),age int, marks int)
INSERT INTO students (name, age, marks,dated)VALUES ('shazaib', '2014', '70','1500');
INSERT INTO studentsVALUES ('hamza', '2014', '72','1600');
INSERT INTO studentsVALUES ('anas', '2014', '62','1700');
INSERT INTO studentsVALUES ('shazaib', '21', '2','1800');
INSERT INTO studentsVALUES ('zain', '200', '8','1990');
SELECT DISTINCT marks FROM students
select * from students
DELETE FROM students
SELECT COUNT(DISTINCT age) FROM students;
DELETE FROM students WHERE marks=2;
UPDATE STUDENTSSET marks='50'WHERE name='ALTAMASH';
UPDATE STUDENTSSET age='14'WHERE age>'10';
SELECT * FROM studentsWHERE name='zain' AND NOT marks='8';
SELECT * FROM studentsWHERE marks BETWEEN 10 and 80;
SELECT * FROM studentsWHERE name BETWEEN 'Altamash' AND  'maib'ORDER BY name;
ALTER TABLE studentsADD dated date 
UPDATE STUDENTSSET dated='01/07/1996'WHERE name='zain';
SELECT * FROM studentsWHERE (marks BETWEEN 10 AND 80)AND NOT age IN (14,2,3);
use record
create table pupil (name varchar(10), marks int, age int);
insert into pupil values('shahzaib',52,14);
insert into pupil values('zain',25,17);
insert into pupil values('abbas',80,13);
insert into pupil values('ashar',90,19);
insert into pupil values('khizar',52,12);
select * from pupil
SELECT * FROM studentsWHERE marks IN (SELECT marks from pupil);
UPDATE pupilSET marks='10'WHERE name='ashar';
SELECT * FROM students ORDER BY marks asc;
SELECT * FROM students WHERE name LIKE 'h%a';
SELECT * FROM students WHERE name LIKE '%[^a-z]';




