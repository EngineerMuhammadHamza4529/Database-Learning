create procedure deposit
@acc_id int,  
@amount int  
as  
begin  
begin tran t1  
declare @check int  
select @check=count(*) from BankAcc where Acc_ID=@acc_id  
IF(@check = 0)  
begin  
print 'The user of account '+cast(@acc_id as varchar)+' does not exist'  
rollback tran t1  
end  
else  
begin  
update BankAcc set Amount=Amount+@amount where Acc_ID=@acc_id  
PRINT 'Your Transaction has been commited'  
commit tran t1  
end  
end



exec deposit 420,30000