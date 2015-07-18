SELECT e.FirstName, e.MiddleName, e.LastName, m.FirstName + ' ' + m.LastName AS [Manager Name],
a.AddressText, t.Name AS [Town name]
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID
INNER JOIN Addresses a
ON e.AddressID = a.AddressID
INNER JOIN Towns t
ON t.TownID = a.TownID