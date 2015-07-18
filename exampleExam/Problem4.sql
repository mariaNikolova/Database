--Problem 4.	Ads without Town, Category or Image
--Find all ads that have no town or no category or no image sorted by Id. 
--Show all their data.

SELECT *
FROM Ads a
WHERE a.TownId IS NULL OR
	  a.CategoryId IS NULL OR
	  a.ImageDataURL IS NULL
ORDER BY a.Id