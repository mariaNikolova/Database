--Problem 6.	Create table Logs.
--Create another table – Logs (LogID, AccountID, OldSum, NewSum). 
--Add a trigger to the Accounts table 
--that enters a new entry into the Logs table every time 
--the sum on an account changes.
USE Bank

GO
CREATE TABLE Logs(
LogId INT PRIMARY KEY IDENTITY NOT NULL,
AccountId INT FOREIGN KEY REFERENCES Account(AccountID) NOT NULL,
OldSum MONEY NOT NULL,
NewSum MONEY NOT NULL
)

GO
CREATE TRIGGER tg_ChangeBalance ON Account FOR UPDATE
AS
	INSERT INTO Logs(AccountId, OldSum, NewSum)
	SELECT d.AccountID, d.Balance, i.Balance
	FROM INSERTED i
		INNER JOIN DELETED d
		ON d.AccountID = i.AccountID
GO