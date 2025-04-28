

select * from products;
--------------------------------------WHERE----------------------------
--equal
select * from products where name='soap';
--greater
select * from products where price>40
--not equal
select * from products where price !=  40
select * from products where price <>  40
--between
select * from products where price <= 40 or price>=140
select * from products where price between 40 and 140
--and
select * from products where city='lahore' and price='40'