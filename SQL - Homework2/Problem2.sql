--Problem 2.Write a SQL query to find the names and salaries
-- of the employees that have a salary that is up to 10% higher than 
--the minimal salary for the company.

SELECT e.FirstName, e.LastName, e.Salary 
FROM Employees e
WHERE e.Salary BETWEEN (SELECT min(Salary) FROM Employees) AND
		(SELECT min(Salary)
		FROM Employees) * 1.01