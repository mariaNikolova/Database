--Problem 12.Write a SQL query to find all employees along with their managers.

SELECT e.FirstName + ' ' + e.LastName AS Emplouees, 
ISNULL(m.FirstName + ' ' + m.LastName, 'no manager') AS Manager
FROM Employees e
LEFT OUTER JOIN Employees m
ON e.ManagerID = m.EmployeeID
