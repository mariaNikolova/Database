-- Problem 31.  Define a table WorkHoursLogs to track all changes in the WorkHours table with triggers.
 
CREATE TABLE WorkHoursLogs
(
        Id INT PRIMARY KEY IDENTITY NOT NULL,
        ChangeDate datetime NOT NULL,
        OldTaskDate datetime NULL,
        OldTask nvarchar(125) NULL,
        OldHours SMALLINT NULL,
        OldComments VARCHAR(MAX) NULL,
        NewTaskDate datetime NULL,
        NewTask nvarchar(125) NULL,
        NewHours SMALLINT NULL,
        NewComments VARCHAR(MAX) NULL,
        Command CHAR(6) NOT NULL
)
GO
 
CREATE TRIGGER workhours_change
ON WorkHours
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
        DECLARE @operation CHAR(6)
                SET @operation = CASE
                        WHEN EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
                                THEN 'Update'
                        WHEN EXISTS(SELECT * FROM inserted)
                                THEN 'Insert'
                        WHEN EXISTS(SELECT * FROM deleted)
                                THEN 'Delete'
                        ELSE NULL
                END
        IF @operation = 'Delete'
                INSERT INTO WorkHoursLogs (ChangeDate, OldTaskDate, OldTask, OldHours, OldComments, Command)
                SELECT GETDATE(), d.Date, d.Task, d.Hours, d.Comments, @operation
                FROM deleted d
        IF @operation = 'Insert'
                INSERT INTO WorkHoursLogs (ChangeDate, NewTaskDate, NewTask, NewHours, NewComments, Command)
                SELECT GETDATE(), i.Date, i.Task, i.Hours, i.Comments, @operation
                FROM inserted i
        IF @operation = 'Update'
                INSERT INTO WorkHoursLogs (ChangeDate, OldTaskDate, OldTask, OldHours, OldComments,
                        NewTaskDate, NewTask, NewHours, NewComments, Command)
                                SELECT GETDATE(), d.Date, d.Task, d.Hours, d.Comments, i.TaskDate, i.Task,
                                        i.Hours, i.Comments, @operation
                                FROM deleted d, inserted i
END
GO
               
 
UPDATE WorkHours SET Date = DATEADD(MONTH, 3, GETDATE()) WHERE Id = 2
UPDATE WorkHours SET Comments = 'I`ve changed that thing and a log is in the WorkHOursLog' WHERE Id = 1
INSERT INTO WorkHours VALUES (GETDATE() + 1, 'Reporting For Duties', 8, 'You wanna piece of me boy?!')
