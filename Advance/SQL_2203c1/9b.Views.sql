Create table Workers(
id int primary key identity,
w_name varchar(20) not null,
salary int ,
)

--View with not null null column
create view one as
select Workers.w_name from Workers;
select * from one
insert into one values('Sara');
select * from Workers


--View without not null null column
create view two as
select Workers.salary from Workers;

select * from two
insert into two values(1000);
select * from Workers

--View with not null and other column
create view three as
select Workers.w_name,Workers.salary from Workers;
select * from three
insert into three values('hira',1000);
select * from Workers

--droping original table
drop table Workers;

--recreating original table
Create table Workers(
id int primary key identity,
w_name varchar(20) not null,
salary int ,
phone int
)
insert into Workers(w_name,salary,phone) values('sana',1340,3476);

--querying in view
select * from three where w_name like 'S%';
delete from three where w_name='zara'
update three set salary=1000 where w_name='Sana'
update three set salary=1000 where w_name='Sana'


--schema binded view
create view five 
With SCHEMABINDING 
as
select Workers.w_name,Workers.phone from dbo.Workers
drop table Workers

---------------------------encryptd view
Sp_helptext six
select definition from sys.sql_modules 
		where object_id=object_id('six');
select object_definition(object_id('six'));

create view seven 
With ENCRYPTION 
as
select Workers.w_name,Workers.phone from dbo.Workers

---------------------------encryptd view and schema binded both
create view eight 
With ENCRYPTION,SCHEMABINDING 
as
select Workers.w_name,Workers.phone from dbo.Workers

------------------Local partioned View
select * from practical.dbo.employee p join viewws.dbo.category c on p.id=c.id



------------------global partioned View
sp_addlinkedserver '10.0.0.179'
select * from [10.0.0.179].abdullah.dbo.city;
insert into [10.0.0.179].abdullah.dbo.city(cityname) values('Islamabad');

create view  nine as 
select * from [10.0.0.179].abdullah.dbo.city c join viewws.dbo.category t on c.cityid=t.id
