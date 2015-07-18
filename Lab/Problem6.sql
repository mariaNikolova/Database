--Problem 6.	Category with Questions
--Find all categories along with their questions sorted by 
--category name and question title. Display the category name,
-- question title and created on columns.

SELECT c.Name, q.Title, q.CreatedOn
FROM Questions q RIGHT OUTER JOIN Categories c
ON q.CategoryId = c.Id
ORDER BY c.Name,q.Title
