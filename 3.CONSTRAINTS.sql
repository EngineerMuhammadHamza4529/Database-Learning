
create database record

INSERT INTO students VALUES ('hamza', '2014',null,'1600');
SELECT * FROM students WHERE marks IS not NULL
SELECT * FROM students WHERE marks IS NULL and dated is not null
select * from students

--checking NOT NULL contraints
CREATE TABLE learner (ID int NOT NULL, name varchar(255) NOT NULL, Age int);
INSERT INTO learner VALUES ('123','aatika', '72');
INSERT INTO learner VALUES (123,'liaquat', '72');
select * from learner
drop table learner

--checking UNIQUE contraints
CREATE TABLE learner(ID int NOT NULL UNIQUE, name varchar(255) NOT NULL ,Age int);
INSERT INTO learner VALUES ('125','aatika', '72');
INSERT INTO learner VALUES ('125','aatika', '72');
drop table learner

--checking PRIMARY key contraints
CREATE TABLE learner1(ID int,name varchar(255) NOT NULL,Age int,PRIMARY KEY (ID));
INSERT INTO learner1 VALUES (null,'aatika', '72');
INSERT INTO learner1 VALUES ('125','aatika', '72');
INSERT INTO learner1 VALUES ('124','aatika', '72');
drop table learner1

--checking FOREIGN KEY contraints
CREATE TABLE learner
(CollegeId int,
name varchar(255) NOT NULL,
NIC int, 
PRIMARY KEY (CollegeId), 
FOREIGN KEY (NIC) REFERENCES learner1(id));


INSERT INTO learnerVALUES ('14',null, '124');

select * from learner
select * from learner1



--checking Check constraint
CREATE TABLE learner (id int NOT NULL,name varchar(255) NOT NULL, Age int, CHECK (Age>=18));
INSERT INTO learner VALUES ('126','aatika', '22');

--checking DEFAULT Constraint
CREATE TABLE learner(ID int NOT NULL,name varchar(255) NOT NULL, Age int,location varchar(255) DEFAULT 'nazimabad');
INSERT INTO learner(id,name,age)VALUES ('125','aatika', '2');
INSERT INTO learner VALUES ('125','aatika', '2'); --this won't work here
select * from learner


 -------identity property----------------------------------------------------------------------------------------------------------------------
 create table learner2
(
id int identity(1,1),
name varchar(50) ,
roll int 
)  
insert into learner2 values ('bilal' , 62)
select * from learner2
drop table learner2

--primary key

CREATE TABLE learner
(CollegeId int,
name varchar(255) NOT NULL,
NIC int, 
PRIMARY KEY (CollegeId), 
FOREIGN KEY (NIC) REFERENCES learner1(id));


INSERT INTO learner VALUES ('14',null, '124');

select * from learner
select * from learner1