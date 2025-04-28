select * from abc

--hat user ny kitnya products purchase kie
select users,count(*) from abc group by users

--har product kitni dafa purchase howa
select product,count(*) from abc group by product

--har user ka total amount kitni bana
select users, sum(price) from abc group by users

--har user ka total amount kitni bana aur kis prouct py howa haio
select users, product, sum(price) from abc group by users,product with rollup

--har user ka total amount and har product ka revenuu
select users, product, sum(price) from abc group by users,product with cube

--har product ka total amount and har user ka revenuu
select users, product, sum(price) from abc group by users,product with cube