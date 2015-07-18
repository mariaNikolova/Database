--Problem 3.	Create a function with parameters
--Your task is to create a function that accepts as parameters – sum, 
--yearly interest rate and number of months. It should calculate and return the new sum. 
--Write a SELECT to test whether the function works as expected.

USE Bank
GO
CREATE FUNCTION ufn_CalcSum(@sum money, @yearlyInterest FLOAT, @numberOfMonths INT) RETURNS FLOAT
AS
BEGIN
	 RETURN (@sum * (@yearlyInterest/ 100)) * (@numberOfMonths / 12)
END
GO

SELECT dbo.ufn_CalcSum(145.6, 5, 12) AS [Money]