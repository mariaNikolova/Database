--Problem 25.Write a SQL query to display the average employee
--salary by department and job title.

SELECT d.Name, e.JobTitle, AVG(e.Salary) AS [Average Salary]
FROM Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID,e.JobTitle, d.Name