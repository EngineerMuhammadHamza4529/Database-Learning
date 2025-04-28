create procedure withdraw
@acc_id int,  
@amount int  
as  
begin  
begin tran t1  
declare @check int  
select @check=count(*) from BankAcc where Acc_ID=@acc_id  
declare @balance int  
select @balance=Amount from BankAcc where Acc_ID=@acc_id  
IF(@check = 0)  
begin  
print 'The user of does not exist'  
rollback tran t1  
end  
else  
begin  
if @balance<@amount  
begin  
print 'Bhai paisay hongay tou nikalo gay na!!'  
rollback tran t1  
end  
else  
begin  
update BankAcc set Amount=Amount-@amount where Acc_ID=@acc_id  
PRINT 'Your Transaction has been commited'  
commit tran t1  
end  
end  
end


exec withdraw  4230,2003333333
