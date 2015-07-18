USE Bank
GO
ALTER PROC usp_WithdrawMoney 
@accountId INT, @money MONEY
AS
	DECLARE @currentMoney MONEY = (
	SELECT a.Balance
	FROM Accounts a
	WHERE a.AccountsId = @AccountId)
	IF (@currentMoney > @money)
	BEGIN
		UPDATE Accounts 
		SET Balance = @currentMoney - @money
		WHERE AccountsID = @accountId
		
	END


EXEC dbo.usp_WithdrawMoney	@accountId = 1,
							@money = 30
SELECT 	a.AccountsId,
		a.PersonID,
		a.Balance
FROM Accounts a
WHERE a.AccountsId = @accountId
GO