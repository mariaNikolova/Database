--Problem 2.	Answers in Date Range
--Find all answers created between 15-June-2012 (00:00:00) 
--and 21-Mart-2013 (23:59:59) sorted by date, then by id.
-- Name the columns exactly like in the table below.

SELECT a.Content, a.CreatedOn
from Answers a
WHERE a.CreatedOn BETWEEN CAST('2012-06-15 00:00:00' AS DATETIME) 
						and CAST('2013-03-21 23:59:59' AS DATETIME)
ORDER BY a.CreatedOn, a.Id