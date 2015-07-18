--Problem 11.	Ads by Status
--Display the count of ads in each status.
-- Sort the results by status. 

SELECT as1.Status, COUNT(a.Id) AS Count
from Ads a JOIN AdStatuses as1
ON a.StatusId = as1.Id
GROUP BY as1.Status
ORDER BY as1.Status