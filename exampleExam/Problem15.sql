--Problem 15.	Pairs of Dates within 12 Hours
--Consider the dates of the ads. 
--Find among them all pairs of different dates, 
--such that the second date is no later than 12 hours after the first date. 
--Sort the dates in increasing order by the first date, then by the second date.
 
SELECT a1.Date AS FirstDate, a2.Date AS SecondDate
FROM Ads a1, Ads a2
WHERE
  a2.Date > a1.Date AND
  DATEDIFF(hour, a1.Date, a2.Date) < 12
ORDER BY a1.Date, a2.Date