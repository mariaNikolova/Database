--Problem 6.	Ads with Their Category, Town and Status
--Find all ads along with their categories, towns and statuses sorted by Id. 
--Display the ad title, category name, town name and status. 
--Include all ads without town or category or status. 

SELECT a.Title, 
	   c.Name AS [CategoryName],
	   t.Name AS [TownName], 
	   as1.Status
from Ads a LEFT JOIN Towns t
ON a.TownId = t.Id
LEFT JOIN Categories c
ON a.CategoryId = c.Id
LEFT JOIN AdStatuses as1
ON a.StatusId = as1.Id
ORDER BY a.Id