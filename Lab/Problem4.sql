--Problem 4.	Questions with their Author
--Find all questions along with their user sorted by Id.
-- Display the question title and author username. 
--Name the columns exactly like in the table below.

SELECT q.Title AS [Question Title], u.Username AS Author
FROM Questions q JOIN Users u 
	ON q.UserId = u.Id