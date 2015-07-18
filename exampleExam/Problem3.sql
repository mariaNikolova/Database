--Ads with "Yes/No" Images
--Display all ad titles and dates along with a column 
--named "Has Image" holding "yes" or "no" for all ads sorted by their Id.

SELECT a.Title, a.Date, 
CASE
	WHEN a.ImageDataURL IS NOT NULL THEN 'yes'
	WHEN a.ImageDataURL IS NULL THEN 'no'
	
END as [Has Image]
from Ads a
ORDER BY a.Id