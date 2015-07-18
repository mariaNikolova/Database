-- Problem 29.	Write a SQL to create table WorkHours to store work reports
-- for each employee.
--Each employee should have id, date, task, hours and comments. 
--Don't forget to define identity, primary key and appropriate foreign key.

CREATE TABLE WorkHours
(
Id int PRIMARY KEY IDENTITY NOT NULL,
EmployeeId int FOREIGN KEY REFERENCES Employees(EmployeeId) NOT NULL,
Date datetime NULL,
Task nvarchar(150) NOT NULL,
Hours int NOT NULL,
Comments ntext NULL
)