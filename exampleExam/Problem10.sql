--Problem 10.	Not Published Ads from the First Month
--Find all not published ads, created in the same month and year 
--like the earliest ad. Display for each ad its id, title, date and status. 
--Sort the results by Id. 

SELECT a.Id, a.Title, a.Date, as1.Status
from Ads a JOIN AdStatuses as1
ON a.StatusId = as1.Id
WHERE as1.Status <> 'Published' AND MONTH(a.Date) =	(SELECT 
													 MONTH( MIN(a.Date) )
													 from Ads a)
								AND YEAR(a.Date) = (SELECT 
													YEAR( MIN(a.Date) )
													from Ads a)
ORDER BY a.Id