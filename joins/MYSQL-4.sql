-- MySQL AND, OR, NOT Operators with Where clause:
-- When should multiple conditions be used:
USE STUDENT;


select * from customer 
where city = "karachi" AND country = "Pakistan"; 

select * from customer 
where city = "karachi" or country = "Pakistan";


select * from customer
Where not country = "Pakistan";



-- use parenthesis to form complex expressions:

SELECT * FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart');


-- The MySQL IN Operator:
-- The IN operator is a shorthand for multiple OR conditions:

SELECT * FROM customer
WHERE Country IN ('Pakistan', 'Turkey', 'UK');

SELECT * FROM customer
WHERE Country NOT IN ('Pakistan', 'Turkey', 'UK');


-- The MySQL BETWEEN Operator:
-- The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates:

 SELECT * FROM product
 WHERE product_price BETWEEN 1000 AND 3000;

SELECT * FROM PRODUCT;

SELECT * FROM product
WHERE product_price BETWEEN 1000 AND 2000
AND product_id NOT IN (1,2,3);



-- The MySQL LIKE Operator:
--  The LIKE operator is used in a WHERE clause to search for a specified pattern in a column:
-- The percent sign (%) represents zero, one, or multiple characters:
-- The underscore sign (_) represents one, single character:
select * from personal;

SELECT * FROM personal WHERE name LIKE 'M%';
SELECT * FROM personal WHERE name LIKE '%am%';
SELECT * FROM personal WHERE name LIKE 'h%' or name LIKE 'M%';
SELECT * FROM personal WHERE name not LIKE 'm%';
SELECT * FROM personal WHERE name not LIKE 'm%';
SELECT * FROM personal WHERE name LIKE '___r%';
SELECT * FROM personal WHERE name LIKE 'H__%';










