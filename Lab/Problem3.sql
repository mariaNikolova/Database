--Problem 3.	Users with "1/0" Phones
--Display usernames and last names along with a column named "Has Phone" 
--holding "1" or "0" for all users sorted by their last name, then by id. 
--Name the columns exactly like in the table below.

SELECT u.Username, u.LastName,
CASE 
		WHEN PhoneNumber IS NOT NULL THEN 1
		WHEN PhoneNumber IS NULL THEN 0
	END
	AS [Has Phone]
FROM Users u
ORDER BY u.LastName