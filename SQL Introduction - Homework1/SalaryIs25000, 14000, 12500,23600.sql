SELECT e.FirstName,e.MiddleName, e.LastName, e.Salary
FROM Employees e
WHERE e.Salary IN (25000, 14000, 12500, 23600)