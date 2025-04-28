create database new
---------------------------creating table--------------
create table BankAcc
(
Acc_ID int primary key,
Acc_Holder varchar(20),
Amount int
)

insert into BankAcc values (101, 'zardari', 1000000)
insert into BankAcc values (420, 'Nawaz', 200000)

select * from BankAcc
-----------------------------------------------------------------------------------------depositing money
BEGIN TRAN T1
	declare @num int
	select @num = count(*) from BankAcc where Acc_ID = 420
	IF (@num = 0)
	BEGIN
		print 'Record does not exist...'
		ROLLBACK TRAN T1
	END
	ELSE
	BEGIN
		update BankAcc set Amount = Amount + 1000 where Acc_ID = 420
				print 'Amount Deposited Successfully...'
		COMMIT TRAN T1
	END

--------------------------------------------------------------------------making stored procedure of depositing money 
create procedure DepositProcTran
(
@id int,
@amount int
)
as
BEGIN

END
DepositProcTran 2 , 20000
--------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------money Withdrawal

BEGIN TRAN T2
	declare @num int
	select @num = count(*) from BankAcc where Acc_ID =420
	IF (@num = 0)
	BEGIN
		print 'Record does not exist...'
		ROLLBACK TRAN T1
	END
	ELSE 
	BEGIN
	declare @currenctBalance int
	select @currenctBalance = Amount from BankAcc where Acc_ID = 420
	IF (@currenctBalance < 200)
	BEGIN
		print 'Your Current Balance is less than your desired Withdrawal Amount...'
		ROLLBACK TRAN T1
	END
	END
	IF ( @currenctBalance > 200)
	BEGIN
		update BankAcc set Amount = Amount - 200 where Acc_ID = 420
		print 'Amount Withdrawal Successfully...'
		
		COMMIT TRAN T1
	END


--------------------------------------------------------------------------making stored procedure of money withdrawal
create procedure WithdrawalProcTran
(
@id int,
@amount int
)
as
BEGIN

END
--------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------balance inquiery

create procedure InquiryProcTran
(
@id int
)
as
BEGIN
	BEGIN TRAN T1
	declare @num int
	select @num = count(*) from BankAcc where Acc_ID = @id
	IF (@num = 0)
	BEGIN
		print 'Record does not exist...'
		ROLLBACK TRAN T1
	END
	ELSE 
	BEGIN
		declare @balance int
		select @balance = Amount from BankAcc where Acc_ID = @id
		PRINT 'Your Current Balance is ' + cast(@balance as varchar)
		COMMIT TRAN T1
	END
END
InquiryProcTran 420
----------------------------------------------------Assignment
-----------------------------------------------------------------------
------------------------------------------------------------------------------------------ AMOUNT TRANSFER TRANSACTION WITH STORED PROCEDURE

create procedure TransferProcTran
(
@Sourceid int,
@SourceAmount int,
@Destid int
)
as
BEGIN
	BEGIN TRAN T1
	declare @num int , @num2 int
	select @num = count(*) from BankAcc where Acc_ID = @Sourceid
	select @num2 = count(*) from BankAcc where Acc_ID = @Destid
	IF (@num = 0)
	BEGIN
		print 'Amount can not be transfered because Sender does not exist...'
		ROLLBACK TRAN T1
	END
	ELSE IF (@num2 = 0)
	BEGIN
		print 'Amount can not be transfered because Receiver does not exist...'
		ROLLBACK TRAN T1
	END
	ELSE 
	BEGIN
	declare @currenctBalance int
	select @currenctBalance = Amount from BankAcc where Acc_ID = @Sourceid
	IF (@currenctBalance < @SourceAmount)
	BEGIN
		print 'Transfer Amount EXCEEDS the Current Balance in your Account...'
		ROLLBACK TRAN T1
	END
	END
	IF (@SourceAmount < @currenctBalance)
	BEGIN
		update BankAcc set Amount = Amount - @SourceAmount where Acc_ID = @Sourceid
		update BankAcc set Amount = Amount + @SourceAmount where Acc_ID = @Destid
		print 'Amount Transferred Successfully...'
		declare @newBalanceS int , @newBalanceD int
		select @newBalanceS = Amount from BankAcc where Acc_ID = @Sourceid
		select @newBalanceD = Amount from BankAcc where Acc_ID = @Destid
		print 'Dear Sender, Your Current Balance is now ' + cast(@newBalanceS as varchar)
		print 'Dear Receiver, Your Current Balance is now ' + cast(@newBalanceD as varchar)
		COMMIT TRAN T1
	END
END