--Problem 13.Write a SQL query to find the names of all employees 
--whose last name is exactly 5 characters long. 

SELECT e.FirstName, e.LastName 
FROM Employees e
WHERE LEN(e.LastName) = 5


