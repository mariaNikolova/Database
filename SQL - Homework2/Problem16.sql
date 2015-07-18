--Problem 16.Write a SQL statement to create a view that displays the users
--from the Users table that have been in the system today.

CREATE VIEW UsersThatHaveBeenInTheSystemToday as
SELECT u.Username
FROM Users u
WHERE CAST(u.LastLoginTime AS DATE) = CAST(GETDATE() AS DATE)
GO
SELECT * 
FROM UsersThatHaveBeenInTheSystemToday
GO