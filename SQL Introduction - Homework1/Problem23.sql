 -- Use right outer join
SELECT e.FirstName, e.MiddleName, e.LastName, m.FirstName + ' ' + m.LastName AS [ManagerName]
FROM Employees e
RIGHT OUTER JOIN Employees m
ON e.ManagerID = m.EmployeeID

 -- Use left outer join
SELECT e.FirstName, e.MiddleName, e.LastName, m.FirstName + ' ' + m.LastName AS [ManagerName]
FROM Employees e
LEFT OUTER JOIN Employees m
ON e.ManagerID = m.EmployeeID