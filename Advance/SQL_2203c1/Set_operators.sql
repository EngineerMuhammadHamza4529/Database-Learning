select * from proj
select * from emp
select proj.proj_id from proj intersect select emp.proj_id_FK from emp
select proj.proj_id from proj union select emp.proj_id_FK from emp
select proj.proj_id from proj union all select emp.proj_id_FK from emp
select proj.proj_id from proj union all select emp.proj_id_FK from emp