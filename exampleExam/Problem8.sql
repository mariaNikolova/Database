--Problem 8.	Earliest and Latest Ads
--Find the dates of the earliest and the latest ads.

SELECT MIN(a.Date) AS [MinDate], MAX(a.Date) AS [MaxDate]
FROM Ads a