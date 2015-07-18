--Problem 22.Write SQL statements to insert in the Users table
--the names of all employees from the Employees table.
--Combine the first and last names as a full name.
--For username use the first letter of the first name + the last name (in lowercase).
--Use the same for the password, and NULL for last login time.

INSERT INTO Users (UsersId,Username, Password, FullName)
SELECT  
e.EmployeeID,
LOWER(SUBSTRING(e.FirstName,1,1) + e.LastName),
LOWER(SUBSTRING(e.FirstName,1,1) + e.LastName),
e.FirstName + ' ' + e.LastName
FROM Employees e