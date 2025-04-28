CREATE PROCEDURE newOnee
    @pro VARCHAR (100) = NULL
AS
if (@pro IS NULL)
BEGIN
    SELECT * FROM abc;
end
else
begin
delete from abc where product=@pro
END

exec newOnee 'soap'