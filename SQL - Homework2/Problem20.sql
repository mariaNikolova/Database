--Problem 20.Write SQL statements to update some of the records
--in the Users and Groups tables.

UPDATE Users
SET Username = 'mimiUpdate', Password = '1111111', FullName = 'MariaUpdate'
where UsersId = 1

UPDATE Groups
SET Name='database'
where Id = 1