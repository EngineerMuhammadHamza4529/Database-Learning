select * from students
select * from pupil
--inner Joins
SELECT * FROM STUDENTSINNER JOIN pupilON students.name=pupil.name
SELECT *FROM studentsLEFT JOIN pupil ON  students.name=pupil.name
SELECT * FROM studentsRIGHT JOIN pupilON students.name=pupil.name
--outer Join
SELECT *FROM studentsFULL JOIN pupilON students.marks=pupil.age

--instead of selecting * you can select multiple columns
SELECT students.name,students.ageFROM studentsFULL JOIN pupilON students.name=pupil.name
select * from pupil
SELECT * FROM STUDENTS
--self joins
SELECT * FROM STUDENTS T1, STUDENTS T2 where t1.age=t2.marks

----------------------------------------Concept of joins with primary and foreign key---------------------------------

--- table 1
use record
create table product
(
p_id int  primary key,
p_name varchar(50),
price int,
exp_date datetime,
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

 ---- table 2
create table ordr
(
o_id int,
p_id int foreign key references product(p_id),
order_date datetime,
quantity int
)

insert into ordr values(3,2,'09-10-2013',60)

insert into ordr (o_id,quantity) 
values(4,90)

select * from ordr
select * from product

----Joins--------------------------------------------


select product.p_id, product.p_name,ordr.quantity
from product inner join ordr
on product.p_id=ordr.p_id

select product.p_name,product.price,ordr.quantity 
from product left join ordr
on product.p_id=ordr.p_id

select product.p_name,product.price,
ordr.quantity from product right join ordr
on product.p_id=ordr.p_id

select product.p_name,product.price,ordr.quantity 
from product full join ordr
on product.p_id=ordr.p_id


--alias with joins
select p.p_id,p.p_name,p.price,o.o_id,o.quantity
from product as p inner join ordr as o
on p.p_id=o.p_id
