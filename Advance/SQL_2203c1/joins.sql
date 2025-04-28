select * from depart
select * from proj
select * from emp

SELECT  p.*,d.dep_name from proj p join depart d on d.dep_id=p.dep_id_FK
SELECT  p.proj_name,d.dep_name from proj p join depart d on d.dep_id=p.dep_id_FK
SELECT  p.*,d.dep_name from proj p join depart d on d.dep_id=p.dep_id_FK where p.pro_start>'2023-2-1'

SELECT  proj_name from proj where pro_start>'2023-2-1'
SELECT  p.proj_name from proj p join depart d on d.dep_id=p.dep_id_FK where d.dep_name='A';
SELECT proj_name from proj where proj_name like '%a%';


select * from emp e join proj p on p.proj_id=e.proj_id_FK join depart d on d.dep_id=p.dep_id_FK
select * from emp e join proj p on p.proj_id=e.proj_id_FK join depart d on d.dep_id=p.dep_id_FK
select e.emp_name from emp e join proj p on p.proj_id = e.proj_id_FK where p.proj_name='china'

select proj_name ,pro_duration from proj where  pro_duration='2 months'

select e.emp_name from emp e join proj p on p.proj_id=e.proj_id_FK where p.pro_duration='2 months'

select e.emp_name, d.dep_name from emp e join proj p on p.proj_id=e.proj_id_FK join depart d on d.dep_id =p.dep_id_FK where emp_name='sara'

select p.proj_name from emp e join proj p on p.proj_id = e.proj_id_FK where e.emp_name = 'ali'

select count(*) from emp e join proj p on p.proj_id=e.proj_id_FK join depart d on d.dep_id =p.dep_id_FK where dep_name='A'

select count(*) from emp e join proj p on p.proj_id=e.proj_id_FK join depart d on d.dep_id =p.dep_id_FK where dep_name='A'

select d.dep_name from emp e join proj p on p.proj_id=e.proj_id_FK join depart d on d.dep_id =p.dep_id_FK group by d.dep_name having count(*)>2


SELECT  p.*,d.dep_name from depart d left join proj p on d.dep_id=p.dep_id_FK

select * from emp e full outer join proj p on p.proj_id=e.proj_id_FK



