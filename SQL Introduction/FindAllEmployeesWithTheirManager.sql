SELECT e.FirstName, e.MiddleName, e.LastName, m.FirstName + ' ' + m.LastName AS [Manager Name]
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID