--Problem 14. Write a SQL query to display the current date and time 
--in the following format "day.month.year hour:minutes:seconds:milliseconds".
 
SELECT CONVERT(NVARCHAR(24),GETDATE(),113) AS CurrentDateTime
