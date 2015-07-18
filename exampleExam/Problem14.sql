--Problem 14.	Ads by Town
--Find the count of ads for each town.
-- Display the ads count and town name or "(no town)" 
--for the ads without a town. Display only the towns, which hold 2 or 3 ads. 
--Sort the results by town name.

SELECT * FROM (SELECT COUNT(a.Id) AS AdsCount,
CASE 
	WHEN t.Name IS NULL THEN '(no town)'
	WHEN t.Name IS NOT NULL THEN t.Name
END AS Town
from Ads a LEFT JOIN Towns t
ON a.TownId = t.Id
GROUP BY t.Name) d
WHERE d.AdsCount = 2 OR d.AdsCount = 3 

