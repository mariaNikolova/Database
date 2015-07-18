--Problem 28.Write a SQL query to display the number of managers from each town.

SELECT t.Name, COUNT(*) 
FROM Employees emp
INNER JOIN Addresses ads ON ads.AddressID = emp.AddressID
INNER JOIN Towns t ON t.TownID = ads.TownID
WHERE emp.ManagerID IS NULL
GROUP BY t.Name