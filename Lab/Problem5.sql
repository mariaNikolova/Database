--Problem 5.Answers with their Question with their Category and User 
--Find all answers along with their questions, along with question category, 
--along with question author sorted by Category Name, then by Answer Author, 
--then by CreatedOn. 

SELECT 
	a.Content AS [Answer Content],
	a.CreatedOn AS CreatedOn,
	u.Username AS [Answer Author], 
	q.Title AS [Question Title],
	c.Name AS [Category Name]
FROM Answers a JOIN Questions q
ON a.QuestionId = q.Id
JOIN Categories c 
ON q.CategoryId = c.Id
JOIN Users u
ON a.UserId = u.Id
ORDER BY c.Name, u.Username, a.CreatedOn
