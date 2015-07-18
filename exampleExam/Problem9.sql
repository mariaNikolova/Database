--Problem 9.	Latest 10 Ads
--Find the latest 10 ads sorted by date in descending order.
-- Display for each ad its title, date and status. 

SELECT TOP 10 * FROM (SELECT a.Title, a.Date, as1.Status
from Ads a JOIN AdStatuses as1
ON a.StatusId = as1.Id
) d
ORDER BY d.Date DESC
