--Problem 3.Write a SQL query to find the full name, 
--salary and department of the employees that take the minimal salary 
--in their department.
--Use a nested SELECT statement.

SELECT e.FirstName, e.LastName, e.Salary, d.Name
FROM Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (SELECT MIN(Salary) FROM Employees 
				WHERE DepartmentID = d.DepartmentID )