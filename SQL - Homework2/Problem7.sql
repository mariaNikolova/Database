--Problem 7.Write a SQL query to find the number 
--of all employees that have manager.

SELECT COUNT(*) AS [Employees with manager]
FROM Employees e
WHERE e.ManagerID IS NOT NULL