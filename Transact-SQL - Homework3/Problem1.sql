-- Problem 1.	Create a database with two tables
--Persons (id (PK), first name, last name, SSN) and Accounts (id (PK), 
--person id (FK), balance). Insert few records for testing. 
--Write a stored procedure that selects the full names of all persons.

USE Bank
GO
CREATE TABLE Person (
PersonId INT IDENTITY PRIMARY KEY NOT NULL,
FirstName NVARCHAR(20) NOT NULL,
LastName NVARCHAR(20) NOT NULL,
SSN NVARCHAR(20) NOT NULL)

GO

CREATE TABLE Accounts (
AccountsId INT IDENTITY PRIMARY KEY NOT NULL,
PersonID INT FOREIGN KEY REFERENCES Person(PersonID) NOT NULL,
Balance MONEY NOT NULL
)

GO

INSERT INTO Person (FirstName,LastName,SSN)
	Values ('Mariq', 'Petrova', '99888222111')
INSERT INTO Person (FirstName,LastName,SSN)
	Values ('Georgi', 'Ivanov', '99333222111')
INSERT INTO Person (FirstName,LastName,SSN)
	Values ('Ivan', 'Ivanov', '22288222111')

INSERT INTO Accounts (PersonID,Balance)
	Values (1, 33.5)
INSERT INTO Accounts (PersonID,Balance)
	Values (2, 334.5)
INSERT INTO Accounts (PersonID,Balance)
	Values (2, 634.5)
INSERT INTO Accounts (PersonID,Balance)
	Values (3, 454.5)
INSERT INTO Accounts (PersonID,Balance)
	Values (3, 87.9)
GO

SELECT FirstName + ' ' + LastName AS [FullName]
FROM Person