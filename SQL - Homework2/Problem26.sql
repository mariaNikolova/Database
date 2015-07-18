--Problem 26.Write a SQL query to display the minimal employee salary
-- by department and job title along with the name of some of the employees
-- that take it.

SELECT d.Name,e.JobTitle,e.FirstName,MIN(e.Salary) AS [Min Salary]
from Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY e.DepartmentID, e.JobTitle,d.Name,e.FirstName