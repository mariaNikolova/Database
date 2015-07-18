--Problem 10.Write a SQL query to find the count of 
--all employees in each department and for each town.

SELECT t.Name AS TownName,d.Name AS DepartmentName, COUNT(*) AS EmployeesCount
FROM Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID
JOIN Addresses a 
ON e.AddressID = a.AddressID
JOIN Towns t
ON a.TownID = t.TownID
GROUP BY d.Name, t.Name
ORDER BY d.Name