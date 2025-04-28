use batch
create login xyz with password='pakvsind'

create user aptech  for login xyz 

------------------------------------------------------------------------------------

grant select on [dbo].[students] to aptech
deny insert on [dbo].[students] to aptech 
revoke select on [dbo].[students] from aptech


