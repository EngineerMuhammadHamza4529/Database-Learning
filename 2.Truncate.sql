use hello
create table abcd(name varchar(10),name2 varchar(10),name3 varchar(10))
insert into abcd values ('aa','aa','aa');
select * from abcd
TRUNCATE TABLE abcd
insert into abcd values ('aa','aa','aa');
sp_rename 'abcd', 'xyz';
select * from xyz
drop table xyz