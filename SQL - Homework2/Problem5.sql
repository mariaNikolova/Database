--Problem 5.Write a SQL query to find the average 
--salary in the "Sales" department.

SELECT AVG(Salary) AS AverageSalary
FROM Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales'
