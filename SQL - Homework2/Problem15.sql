--Problem 15.	Write a SQL statement to create a table Users.
--Users should have username, password, full name and last login time. 
--Choose appropriate data types for the table fields. 
--Define a primary key column with a primary key constraint.
--Define the primary key column as identity to facilitate inserting records. 
--Define unique constraint to avoid repeating usernames. 
--Define a check constraint to ensure the password is at least 5 characters long.

CREATE TABLE Users(
	UsersId INT PRIMARY KEY NOT NULL,
	Username NVARCHAR(50) UNIQUE NOT NULL,
	Password NVARCHAR(50),
	FullName NVARCHAR(50) NOT NULL,
	LastLoginTime DATETIME NOT NULL,
)
ALTER TABLE dbo.Users
	ADD CONSTRAINT CK_Users_password 
	CHECK (LEN(Password) > 5)
GO
