--Problem 6.Write a SQL query to find the number of 
--employees in the "Sales" department.

SELECT COUNT(*) AS [Sales Employees Count]
FROM Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales'