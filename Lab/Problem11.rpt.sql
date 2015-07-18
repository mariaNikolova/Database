--Problem 11.	Answers count for Category
--Display the count of answers in each category. 
--Sort the results by answers count in descending order. 

SELECT c.Name, COUNT(c.Name) AS [Answers Count]
from Categories c JOIN Questions q
ON c.Id = q.CategoryId
JOIN Answers a
ON q.Id = a.QuestionId
GROUP BY c.Name