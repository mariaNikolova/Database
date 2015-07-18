-- Problem 12.	Answers Count by Category and Username
--Display the count of answers for category and each username. 
---Sort the results by Answers count. Display only non-zero counts. 
--Display only users with phone number

SELECT c.Name, u.Username, u.PhoneNumber, COUNT(a.Id) AS [Answers Count]
from Categories c
LEFT OUTER JOIN Questions q
ON c.Id = q.CategoryId
LEFT OUTER JOIN Answers a
ON q.Id = a.QuestionId
LEFT OUTER JOIN Users u
ON a.UserId = u.Id
GROUP BY c.Name, u.Username, u.PhoneNumber
HAVING u.PhoneNumber IS NOT NULL
ORDER BY [Answers Count] DESC