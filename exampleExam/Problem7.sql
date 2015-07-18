--Problem 7.	Filtered Ads with Category, Town and Status
--Find all Published ads from Sofia, Blagoevgrad or Stara Zagora,
-- along with their category, town and status sorted by title. 
--Display the ad title, category name, town name and status. 

SELECT a.Title, 
	   c.Name AS [CategoryName],
	   t.Name AS [TownName], 
	   as1.Status
from Ads a 
JOIN Categories c
ON a.CategoryId = c.Id
JOIN Towns t
ON a.TownId = t.Id
JOIN AdStatuses as1
ON a.StatusId = as1.Id
WHERE as1.Status = 'Published' AND (t.Name = 'Sofia' OR
									t.Name = 'Blagoevgrad' OR
									t.Name = 'Stara Zagora')
ORDER BY a.Title