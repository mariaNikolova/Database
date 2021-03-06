use Forum

---------------------------------------------------------
-- Problem 1

SELECT Title 
from Questions
ORDER BY Title

---------------------------------------------------------
-- Problem 2

SELECT Content, CreatedOn
FROM Answers
WHERE CreatedOn between '15-Jun-2012' AND '21-Mar-2013'
ORDER BY CreatedOn, Id

---------------------------------------------------------
-- Problem 3

SELECT 
	Username,
	LastName,
	CASE 
		WHEN PhoneNumber IS NOT NULL THEN 1
		WHEN PhoneNumber IS NULL THEN 0
	END
	AS [Has Phone] 
FROM Users
ORDER BY LastName, Id

---------------------------------------------------------
-- Problem 4

SELECT q.Title as [Question Title], u.Username as [Author]
FROM Questions q
JOIN Users u
	ON q.UserId = u.Id
ORDER BY q.Id

---------------------------------------------------------
-- Problem 5

SELECT a.Content as [Answer Content], a.CreatedOn, u.Username as [Answer Author], q.Title as [Question Title], c.Name as [Category Name]
FROM Answers a
  JOIN Questions q on q.Id = a.QuestionId
  JOIN Categories c on q.CategoryId = c.Id
  JOIN Users u on a.UserId = u.Id
ORDER BY c.Name -- TODO: Fix order by! The result is not unique! 

---------------------------------------------------------
-- Problem 6

SELECT c.Name, q.Title, q.CreatedOn
FROM Questions q
RIGHT OUTER JOIN Categories c
	ON q.CategoryId = c.Id
ORDER BY c.Name

---------------------------------------------------------
-- Problem 7

SELECT u.Id, u.Username, u.FirstName, u.PhoneNumber, u.RegistrationDate, u.Email
FROM Users u
LEFT OUTER JOIN Questions q
	ON q.UserId = u.Id
WHERE PhoneNumber IS NULL AND q.Id is NULL
ORDER BY RegistrationDate

---------------------------------------------------------
-- Problem 8

SELECT 
	MIN(CreatedOn) as MinDate, 
	MAX(CreatedOn) as MaxDate
FROM Answers 
WHERE CreatedOn between '2012-01-01' and '2014-12-31'

---------------------------------------------------------
-- Problem 9

SELECT TOP 10 a.Content, CreatedOn, u.Username
FROM Answers a 
JOIN Users u ON a.UserId = u.Id
ORDER BY CreatedOn

---------------------------------------------------------
-- Problem 10

SELECT a.Content [Answer Content], q.Title [Question], c.Name [Category]
FROM Answers a
JOIN Questions q 
	ON q.Id = a.QuestionId
JOIN Categories c
	ON q.CategoryId = c.Id
WHERE 
	(MONTH(a.CreatedOn) = (SELECT MONTH(MIN(CreatedOn)) FROM Answers) OR MONTH(a.CreatedOn) = (SELECT MONTH(MAX(CreatedOn)) FROM Answers))
	AND YEAR(a.CreatedOn) = (SELECT YEAR(MAX(CreatedOn)) FROM Answers)
	AND	IsHidden = 1
ORDER BY c.Name

---------------------------------------------------------
-- Problem 11

SELECT 
	c.Name Category, COUNT(a.Id) [Answers Count]
FROM Categories c
LEFT OUTER JOIN Questions q ON q.CategoryId = c.Id
LEFT OUTER JOIN Answers a ON a.QuestionId = q.Id
GROUP BY c.Name
ORDER BY [Answers Count] DESC

---------------------------------------------------------
-- Problem 12

SELECT 
	c.Name Category, 
	u.Username,
	u.PhoneNumber,
	COUNT(a.Id) [Answers Count]
FROM Categories c
LEFT OUTER JOIN Questions q ON q.CategoryId = c.Id
LEFT OUTER JOIN Answers a ON a.QuestionId = q.Id
LEFT OUTER JOIN Users u ON a.UserId = u.Id
GROUP BY c.Name, u.Username, u.phonenumber
HAVING u.PhoneNumber is not NULL
ORDER BY [Answers Count] DESC

---------------------------------------------------------
-- Problem 13

---- Task 1

CREATE TABLE Towns(
	Id int NOT NULL IDENTITY PRIMARY KEY,
	Name nvarchar(50) NOT NULL
)
GO

ALTER TABLE Users ADD TownId int
GO

ALTER TABLE Users ADD CONSTRAINT FK_Users_Towns
FOREIGN KEY(TownId) REFERENCES Towns(Id)
GO

---- Task 2

INSERT INTO Towns(Name) VALUES ('Sofia'), ('Berlin'), ('Lyon')

UPDATE Users SET TownId = (SELECT Id FROM Towns WHERE Name='Sofia')

INSERT INTO Towns VALUES
('Munich'), ('Frankfurt'), ('Varna'), ('Hamburg'), ('Paris'), ('Lom'), ('Nantes')

---- Task 3

UPDATE Users
SET TownId = (SELECT Id FROM Towns WHERE Name='Paris')
WHERE DATEPART(weekday, RegistrationDate) = 6

---- Task 4

UPDATE Answers
SET QuestionId = (SELECT Id FROM Questions WHERE Title = 'Java += operator')
WHERE 
	(DATEPART(weekday, CreatedOn) = 1 or DATEPART(weekday, CreatedOn) = 2)
	and 
	MONTH(CreatedOn) = 2
	
---- Task 5
BEGIN TRAN

CREATE Table [#AnswerIds] (
	AnswerId int not null
)

INSERT INTO [#AnswerIds]
SELECT a.Id FROM Answers a
WHERE (SELECT SUM(Value)
FROM Answers aa
JOIN Votes v ON v.AnswerId = a.Id) < 0

DELETE FROM Votes
FROM Votes v
WHERE v.AnswerId in 
	(
		SELECT a.Id FROM Answers a
		WHERE (SELECT SUM(Value)
		FROM Answers aa
		JOIN Votes v ON v.AnswerId = a.Id) < 0)

DELETE FROM Answers
FROM Answers a
WHERE a.Id in (SELECT * FROM [#AnswerIds])

DROP TABLE [#AnswerIds]

ROLLBACK TRAN
---- Task 6

INSERT INTO Questions(Title, Content, CategoryId, UserId, CreatedOn)
VALUES (
	'Fetch NULL values in PDO query', 
	'When I run the snippet, NULL values are converted to empty strings. How can fetch NULL values?', 
	(SELECT Id FROM Categories WHERE Name='Databases'),
	(SELECT Id FROM Users WHERE UserName='darkcat'), 
	GETDATE())
	
---- Task 7

SELECT t.Name as Town, u.Username as Username, COUNT(a.Id) as AnswersCount
FROM
  Answers a
  FULL OUTER JOIN Users u ON u.Id = a.UserId
  FULL OUTER JOIN Towns t ON u.TownId = t.Id
GROUP BY t.Name, u.Username
ORDER BY AnswersCount DESC, u.Username

---------------------------------------------------------
-- Problem 14

---- Task 1

CREATE VIEW AllQuestions
AS
SELECT
	u.Id as UId,
	u.Username,
	u.FirstName,
	u.LastName,
	u.Email,
	u.PhoneNumber,
	u.RegistrationDate,
	q.Id as QId,
	q.Title,
	q.Content,
	q.CategoryId,
	q.UserId,
	q.CreatedOn
FROM
  Questions q
  RIGHT OUTER JOIN Users u on q.UserId = u.Id
  
SELECT * FROM AllQuestions

---- Task 2

IF (object_id(N'fn_ListUsersQuestions') IS NOT NULL)
DROP FUNCTION fn_ListUsersQuestions
GO

CREATE FUNCTION fn_ListUsersQuestions()
	RETURNS @tbl_UsersQuestions TABLE(
		UserName NVARCHAR(MAX),
		Questions NVARCHAR(MAX)
	)
AS
BEGIN
	DECLARE UsersCursor CURSOR FOR
		SELECT Username FROM Users
		ORDER BY Username;
	OPEN UsersCursor;
	DECLARE @username NVARCHAR(MAX);
	FETCH NEXT FROM UsersCursor INTO @username;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @questions NVARCHAR(MAX) = NULL;
		SELECT
			@questions = CASE
				WHEN @questions IS NULL THEN CONVERT(NVARCHAR(MAX), Title, 112)
				ELSE @questions + ', ' + CONVERT(NVARCHAR(MAX), Title, 112)
			END
		FROM AllQuestions
		WHERE Username = @username
		ORDER BY Title DESC;

		INSERT INTO @tbl_UsersQuestions
		VALUES(@username, @questions)
		
		FETCH NEXT FROM UsersCursor INTO @username;
	END;
	CLOSE UsersCursor;
	DEALLOCATE UsersCursor;
	RETURN;
END
GO

SELECT * FROM fn_ListUsersQuestions()
-------------------------------------------------------
