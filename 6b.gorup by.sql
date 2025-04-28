select * from Products

--group by
select p_origin,count(*) from Products group by p_origin

--group by with where
select p_origin,count(*) from Products group by p_origin
select p_origin,count(*) from Products where p_origin='Karachi' or p_origin='Lahore' group by p_origin
select p_origin,count(*) from Products where p_pice>100 group by p_origin

--group by all
select p_origin,count(*) from Products group by p_origin
select p_origin,count(*) from Products where p_origin='Karachi' or p_origin='Lahore' group by p_origin
select p_origin,count(*) from Products where p_origin='Karachi' or p_origin='Lahore' group by all p_origin

--group by having
select p_origin,sum(p_pice) from Products group by p_origin having sum(p_pice)>100
select p_origin,count(*) from Products group by p_origin having sum(p_pice)>100

--group by with null
select coalesce(p_origin,'Un Defined'),count(*) from Products group by p_origin

--roll up and cube

select p_origin,count(*) from Products group by p_origin
select p_name,p_origin,count(*) from Products group by p_origin, p_name with rollup
select p_name,p_origin,count(*) from Products group by p_origin, p_name with cube