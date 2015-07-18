--Problem 18.Write a SQL statement to add a column GroupID to the table Users.
--Fill some data in this new column and as well in the Groups table.
--Write a SQL statement to add a foreign key constraint between tables Users 
--and Groups tables.

ALTER TABLE Users
ADD GroupID INT
CONSTRAINT PK_GroupID FOREIGN KEY(GroupID)
REFERENCES Groups(Id)