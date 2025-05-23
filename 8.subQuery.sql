create database ab;
use ab
create table learners(name varchar(10),marks int,age int);
  insert into learners values ('hamza',20,15);
  insert into learners values ('zain',25,16);
  insert into learners values ('shahzaib',20,20);
  insert into learners values ('hashim',30,30);
  SELECT * from learners
-----------------------------------------------Subqueries with the SELECT Statement----------------------------------------------------------------
SELECT name, marks FROM learners
WHERE  marks in
   (SELECT marks FROM learners WHERE name='hamza');
-------------------Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
-----------------by all
SELECT name, marks FROM learners
WHERE  marks > all
   (SELECT marks  FROM learners WHERE name='hamza');
-----------------by any
   SELECT name, marks FROM learners
WHERE  marks > any
   (SELECT marks  FROM learners WHERE name='hamza');
-----------------with 'in' clause
   SELECT * FROM learners WHERE name IN (SELECT name  FROM learners WHERE name='hamza');

------------------------------------------------Subqueries with the INSERT Statement--------------------------------------------------------

INSERT INTO learners
   SELECT * FROM learners
   WHERE name IN (SELECT name FROM learners where name='hamza') ;

----------------------------------or
create table learners_2(name varchar(10),marks int,age int)--creating table
--
INSERT INTO learners_2
   SELECT * FROM learners
   WHERE name IN (SELECT name FROM learners);
   select * from learners_2
   ------------------------------or
INSERT INTO learners_2(name)
   SELECT name FROM learners
   WHERE name IN (SELECT name FROM learners where name='hamza') ;

------------------------------------------------------------Subqueries with the UPDATE Statement-------------------------------------------------------------
 UPDATE learners
   SET marks=100
   WHERE AGE IN (SELECT AGE FROM learners_2 WHERE AGE < 18 );
      SELECT * FROM learners

----------------------Subqueries with the DELETE Statement
DELETE FROM learners
   WHERE AGE IN (SELECT AGE FROM learners_2 WHERE AGE < 18 );

   -------------------------------------------few more examples---------------------------------------------------------
   create database NM
   USE NM;
drop table product
drop table ordr
create table product
(
p_id int primary key,
p_name varchar(50),
price int,
exp_date datetime
)
insert into product values
(1,'shampoo','250','09-23-2014')

insert into product (p_id, p_name, price) values
(2,'lotion','100')

insert into product (p_id, p_name, price) values
(3,'soap','30')

insert into product values
(4,'cream','200','03-05-2015')
select * from product

create table ordr
(
o_id int,
p_id int references product(p_id),
order_date datetime,
quantity int
)

insert into ordr values(3,2,'09-10-2013',60)

insert into ordr (o_id,quantity) 
values(4,90)
select * from ordr
select * from product

select * from ordr where p_id =
( select p_id from product where p_name ='lotion')

select * from ordr where p_id in
( select p_id from product where p_name in ('lotion' , 'shampoo'))

select * from ordr where exists
( select p_id from product where p_name ='lotion')

select * from ordr where exists
( select p_id from product where p_id =ordr.p_id and p_name='lotion')

select * from ordr
where not exists
( select p_id from product where p_id =ordr.p_id and p_name='lotion')