select * from abc

create procedure crud
@pro varchar(10)=null,
@us varchar(10)=null,
@pr varchar(10)=null,
@id int=null
as
begin

if @pro is null and @us is null and @pr is null and @id is null
begin
select * from abc
end

if @pro is not null and @us is null and @pr is null and @id is null
begin
delete from abc where product=@pro
end

if @pro is not null and @us is not null and @pr is not null and @id is null
begin
insert into abc(product,users,price) values(@pro,@us,@pr)
end

if @id is not null
begin
if @pro is not null
begin
update abc set product=@pro where id=@id
end
if @us is not null
begin
update abc set users=@us where id=@id
end
if @pr is not null
begin
update abc set price=@pr where id=@id
end
end

end



exec crud 'chips',null,null,2