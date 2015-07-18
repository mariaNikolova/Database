--Problem 8.	Earliest and Latest Answer Date
--Find the dates of the earliest answer for 2012 year and 
--the latest answer for 2014 year. 

SELECT 
	MIN(CreatedOn) as MinDate, 
	MAX(CreatedOn) as MaxDate
FROM Answers 
WHERE CreatedOn between '2012-01-01' and '2014-12-31'