create procedure kuchbhi2
@name varchar(20) = null,
@users varchar(20) = null,
@price int = null
as
begin

if @name is null and @users is null and @price is null
begin
select * from abc
end

else if @users is null and @price is null
begin
delete from abc where product=@name
end

else if @users is not null and @price is not null and @name is not null
begin
insert into abc(product,users,price) values(@name,@users,@price)
end

end



exec kuchbhi2 'chips','sara',70