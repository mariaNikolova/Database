SELECT e.FirstName, e.MiddleName, e.LastName, e.HireDate, e.Salary, a.AddressText, t.Name
FROM Employees e
INNER JOIN Addresses a ON e.AddressID = a.AddressID
INNER JOIN Towns t ON a.TownID = t.TownID