--Problem 12.	Ads by Town and Status
--Display the count of ads for each town and each status. 
--Sort the results by town, then by status. 
--Display only non-zero counts.

SELECT t.Name AS [Town Name], as1.Status, COUNT(a.Id) AS Count
from Ads a JOIN Towns t
ON a.TownId = t.Id
JOIN AdStatuses as1
ON a.StatusId = as1.Id
GROUP BY t.Name, as1.Status
ORDER BY t.Name, as1.Status