--Problem 19.Write SQL statements to insert several records in the Users
--and Groups tables.

INSERT INTO Users(UsersId,Username,Password,FullName,LastLoginTime,GroupID)
VALUES (9,'kiro', '1245678', 'Kire', '2015-02-14', 1)
INSERT INTO Users(UsersId,Username,Password,FullName,LastLoginTime,GroupID)
VALUES (10, 'gosho', '12345678', 'Goshkata', '2015-02-13', 2)
