--Problem 9.	Find the last ten answers
--Find the last 10 answers sorted by date of creation in descending order.
-- Display for each ad its content, date and author. 

SELECT TOP 10 * 
from (SELECT a.Content, 
			 a.CreatedOn,
			 u.Username
from Answers a JOIN Users u
ON a.UserId = u.Id
) AS m
ORDER BY m.CreatedOn ASC