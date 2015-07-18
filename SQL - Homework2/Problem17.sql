--Problem 17.Write a SQL statement to create a table Groups. 
--Groups should have unique name (use unique constraint). 
--Define primary key and identity column.

CREATE TABLE Groups(
	Id INT IDENTITY,
	Name NVARCHAR(30) NOT NULL,
	CONSTRAINT UK_Name UNIQUE(Name),
	CONSTRAINT PK_Id PRIMARY KEY(Id)
)