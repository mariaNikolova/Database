--Problem 7.	*Users without PhoneNumber and Questions
--Find all users that have no phone and no questions sorted by 
--RegistrationDate. Show all user data.

SELECT u.Id,
	   u.Username,
	   u.FirstName,
	   u.PhoneNumber,
	   u.RegistrationDate,
	   u.Email
from Users u LEFT OUTER JOIN Questions q
ON u.Id = q.UserId
WHERE u.PhoneNumber IS NULL AND q.Id IS NULL
ORDER BY RegistrationDate
