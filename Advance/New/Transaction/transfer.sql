create procedure Transfer
@sender_id int,
@reciever_id int,
@amount int
as
BEGIN
	BEGIN TRAN T1
	declare @send int , @rec int
	select @send = count(*) from BankAcc where Acc_ID = @sender_id
	select  @rec = count(*) from BankAcc where Acc_ID = @reciever_id
	IF (@send = 0)
	BEGIN
		print 'Amount can not be transfered because Sender does not exist...'
		ROLLBACK TRAN T1
	END
	ELSE IF (@rec = 0)
	BEGIN
		print 'Amount can not be transfered because Receiver does not exist...'
		ROLLBACK TRAN T1
	END
	ELSE 
	BEGIN
	declare @currenctBalance int
	select @currenctBalance = Amount from BankAcc where Acc_ID = @sender_id
	IF (@currenctBalance < @amount)
	BEGIN
		print 'Transfer Amount EXCEEDS the Current Balance in your Account...'
		ROLLBACK TRAN T1
	END
	else
	BEGIN
		update BankAcc set Amount = Amount - @amount where Acc_ID = @sender_id
		update BankAcc set Amount = Amount + @amount where Acc_ID = @reciever_id
		print 'Amount Transferred Successfully...'
		COMMIT TRAN T1
	END
	END
END

exec Transfer 420,101,22033