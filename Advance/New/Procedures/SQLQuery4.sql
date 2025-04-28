create procedure kuchbhi223
@name varchar(20) = null,
@users varchar(20) = null,
@price int = null,
@id varchar(20) = null
as
begin

if @name is null and @users is null and @price is null and @id is null
begin
select * from abc
end

else if @users is null and @price is null and @id is null
begin
delete from abc where product=@name
end

else if @users is not null and @price is not null and @name is not null and @id is null
begin
insert into abc(product,users,price) values(@name,@users,@price)
end

else if @id is not null
begin
if @name is not null and @users is null and @price is null
begin
update abc set product=@name where id=@id
end
end

end


exec kuchbhi223 'chips',null,null,4