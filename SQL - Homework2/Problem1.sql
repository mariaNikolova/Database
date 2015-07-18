--Problem 1.Write a SQL query to find the names and salaries
--of the employees that take the minimal salary in the company.
--Use a nested SELECT statement.

SELECT e.FirstName, e.LastName, e.Salary 
FROM Employees e
WHERE e.Salary = 
		(SELECT min(Salary)
		FROM Employees)