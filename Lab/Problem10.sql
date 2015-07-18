-- Problem 10.	Not Published Answers from the First and Last Month
--Find the answers which is hidden from the first and last month 
--where there are any published answer, from the last year
-- where there are any published answers. 
--Display for each ad its answer content, question title and category name. 

SELECT a.Content [Answer Content], q.Title [Question], c.Name [Category]
FROM Answers a
JOIN Questions q 
	ON q.Id = a.QuestionId
JOIN Categories c
	ON q.CategoryId = c.Id
WHERE 
	(MONTH(a.CreatedOn) = (SELECT MONTH(MIN(CreatedOn)) FROM Answers)
	 OR MONTH(a.CreatedOn) = (SELECT MONTH(MAX(CreatedOn)) FROM Answers))

	AND YEAR(a.CreatedOn) = (SELECT YEAR(MAX(CreatedOn)) FROM Answers)
	AND	IsHidden = 1
ORDER BY c.Name