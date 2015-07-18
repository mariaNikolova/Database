USE Bank
GO
CREATE PROC usp_InterestOverAccounts 
@accountId INT, @interestRate FLOAT
AS
	SELECT a.Balance,
			dbo.ufn_CalcSum(a.Balance, @interestRate, 1) AS [Interest]
	FROM Accounts a
	WHERE a.AccountsId = @accountId
GO

EXEC dbo.usp_InterestOverAccounts	@accountId = 1,
									@interestRate = 0.3

