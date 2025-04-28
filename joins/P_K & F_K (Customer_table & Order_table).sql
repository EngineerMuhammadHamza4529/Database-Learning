create database Hshop;
use Hshop;

create table customer
(
customer_id int not null auto_increment primary key,
customer_name varchar(50) not null , 
customer_age int not null,
customer_city varchar(50) not null , 
customer_country varchar(50) not null 
);

create table order_tbl
(
order_id int not null auto_increment primary key,
order_item varchar(50) not null ,
order_quantity int not null , 
price_of_one int not null , 
customer_id int ,
constraint FK_CustomerOrder 
foreign key (customer_id) references customer(customer_id)
);

INSERT INTO customer (customer_id, customer_name, customer_age, customer_city, customer_country)
VALUES
(1, 'Mohammad Khan', 35, 'Lahore', 'Pakistan'),
(2, 'Aisha Ali', 28, 'Islamabad', 'Pakistan'),
(3, 'Fatima Ahmed', 42, 'Karachi', 'Pakistan'),
(4, 'Usman Mahmood', 31, 'Rawalpindi', 'Pakistan'),
(5, 'Sana Iqbal', 25, 'Faisalabad', 'Pakistan'),
(6, 'Hassan Malik', 37, 'Multan', 'Pakistan'),
(7, 'Zainab Khan', 29, 'Quetta', 'Pakistan'),
(8, 'Amirah Shah', 33, 'Peshawar', 'Pakistan');


INSERT INTO order_tbl (order_id, order_item, order_quantity, price_of_one, customer_id)
VALUES
(1, 'Laptop', 1, 800, 1),
(2, 'Mobile Phone', 2, 500, 2),
(3, 'Headphones', 1, 50, 3),
(4, 'Tablet', 1, 300, 4),
(5, 'Smartwatch', 1, 150, 5);

INSERT INTO order_tbl (order_id, order_item, order_quantity, price_of_one, customer_id)
VALUES
(6, 'Laptop', 1, 800, 1);



select * from customer;

select * from order_tbl;

SELECT *
FROM customer
INNER JOIN order_tbl ON customer.customer_id = order_tbl.customer_id;

SELECT *
FROM customer
LEFT JOIN order_tbl ON customer.customer_id = order_tbl.customer_id;

SELECT *
FROM customer
RIGHT JOIN order_tbl ON customer.customer_id = order_tbl.customer_id;


SELECT customer.customer_id, order_tbl.order_id
FROM customer
INNER JOIN order_tbl ON customer.customer_id = order_tbl.customer_id;








