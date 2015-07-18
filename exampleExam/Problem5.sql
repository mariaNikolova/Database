--Problem 5.	Ads with Their Town
--Find all ads along with their towns sorted by Id. 
--Display the ad title and town (even when there is no town). 
--Name the columns exactly like in the table below.

SELECT a.Title, t.Name AS Town
from Ads a LEFT JOIN Towns t
ON a.TownId = t.Id
ORDER BY a.Id