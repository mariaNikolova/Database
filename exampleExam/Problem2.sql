--Problem 2.	Ads in Date Range
--Find all ads created between 26-December-2014 (00:00:00) 
--and 1-January-2015 (23:59:59) sorted by date. 

SELECT a.Title, a.Date
from Ads a
WHERE a.Date BETWEEN '2014-12-26' AND '2015-1-2'
ORDER BY a.Date