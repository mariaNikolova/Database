--Problem 27.Write a SQL query to display the town where maximal number of 
--employees work.

SELECT TOP 1 * FROM (SELECT t.Name, count(*) AS EmployeesCount
from Employees e JOIN Addresses a
ON e.AddressID = a.AddressID
JOIN Towns t
ON a.TownID = t.TownID
GROUP BY t.Name) AS ec
ORDER BY ec.EmployeesCount DESC

