--Problem 2.	Create a stored procedure
--Your task is to create a stored procedure that accepts 
--a number as a parameter and returns all persons who have more money 
--in their accounts than the supplied number.

USE Bank
GO
CREATE PROC usp_SelectPersonWhoHaveMoreMoney(@currentMoney money = 300)
AS
	SELECT FirstName,LastName, a.Balance
	FROM Person p
	INNER JOIN Accounts a
	ON p.PersonId = a.PersonID
	WHERE a.Balance >= @currentMoney

GO

EXEC usp_SelectPersonWhoHaveMoreMoney 400

EXEC usp_SelectPersonWhoHaveMoreMoney
