-- 1. ��� ���������� ���������� � �������� �� ������ �����, ������� ����� 1982, � ����� � �����
--���� ���� ������ (�������), ����� ��� �� ������� ���� ������� 'k', ���� 'b'. ����� �� �� �������
--���-������� �����.--Mimiselect distinct TITLE, YEAR from movie m join STARSIN son m.TITLE = s.MOVIETITLEwhere YEAR < 1982 and (starname not like '%k%' and STARNAME not like '%b')order by year--StaniSELECT DISTINCT st.MOVIETITLE, st.MOVIEYEAR
FROM STARSIN st JOIN MOVIESTAR mo
ON st.STARNAME = mo.NAME
WHERE st.MOVIEYEAR < 1982 AND (mo.NAME NOT LIKE '%k%' OR mo.NAME NOT LIKE '%b%')
ORDER BY st.MOVIEYEAR ASC-- 2. ���������� � ��������� � ������ (length � � ������) �� ������ �����, ����� �� �� ������
--������, �� ����� � � ������ Terms of Endearment, �� ��������� �� � ��-����� ��� ����������.select * from movieSELECT m.TITLE, m.LENGTH/60
FROM MOVIE m
WHERE M.YEAR < (SELECT YEAR FROM MOVIE WHERE TITLE = 'Terms of Endearment')
AND (m.LENGTH <= ALL(SELECT LENGTH FROM MOVIE WHERE TITLE = 'Terms of Endearment' ) 
OR m.LENGTH IS NULL)-- 3. ������� �� ������ ����������, ����� �� � ������� ������ � �� ������ � ���� ���� ����
--����� 1980 �. � ���� ���� ���� 1985 �.
select * from movie
select * from MOVIEEXEC

select me.NAME, m.YEAR
from movieexec me join movie m
on me.cert# = m.PRODUCERC#
join STARSIN s
on s.movietitle = m.title
where YEAR <= 1980 and YEAR >= 1985
SELECT mo.NAME
FROM MOVIEEXEC mo JOIN MOVIE m
on mo.CERT# = m.PRODUCERC#
JOIN STARSIN st 
on st.MOVIETITLE = m.TITLE AND st.MOVIEYEAR = m.YEAR
WHERE mo.NAME = st.STARNAME AND m.YEAR < ANY(SELECT YEAR FROM MOVIE WHERE YEAR < 1980) 
AND m.YEAR < ANY(SELECT YEAR FROM MOVIE WHERE YEAR > 1985)  select NAME from MOVIEEXEC
   intersect 
   (select  starname from STARSIN join movie on movietitle=title
   where  YEAR<1980
   intersect
   select  starname from STARSIN join movie on movietitle=title
   where  YEAR>1985)--������ �����-���� �����, �������� ����� ���-������ ������ ���� (InColor='y'/'n') �� ������
--������.select * from movie order by yearselect *from moviewhere YEAR < (select max(YEAR) from movie where INCOLOR = 'Y') AND INCOLOR = 'N'	AND STUDIONAME = (SELECT STUDIONAME FROM MOVIE WHERE YEAR >= ALL(SELECT YEAR FROM MOVIE))--5. ������� � �������� �� ��������, ����� �� �������� � ��-����� �� 5 �������� ������� ������1.
--������, �� ����� ���� �������� ����� ��� ���, �� �� �� ���� ��� ������� �� ������ � ���, ����
--�� ����� ��������. ����� �� �� ������� ��������, �������� � ���-����� ������.
--1����. ��� �������� ��� ��� �����, ���� � ������ �� ������ A, B � C, � ��� ������ - C, D � �, ��
--�������� � �������� � 5 ������ ����select * from movieselect * from STUDIOselect s.name,s.ADDRESSfrom studio s join movie mon s.NAME = m.STUDIONAMEjoin STARSIN sion si.MOVIETITLE=m.TITLEgroup by s.name, s.ADDRESShaving COUNT(si.starname) < 5--6. �� ����� �����, ����� � �� ���� � ���, ����������� ������� i � k, �� �� ������ �����
--�� ������ � ���� ��� ������ � ������ �� ���� (launched). ���������� �� ���� ��������
--����, �� ����� �� �� �������� ���-����� ��������� ������.select * from shipsselect name, launchedfrom SHIPSwhere class not like '%i%' and class not like '%k%'order by LAUNCHED desc-- 7. �� �� ������� ������� �� ������ �����, � ����� � �������� (damaged) ���� ����
--������� �����.select *FROM BATTLES b join OUTCOMES oon b.NAME = o.BATTLEjoin ships son s.NAME = o.SHIPjoin classes con c.CLASS = s.CLASSwhere result = 'damaged' and country ='Japan'select *from OUTCOMES o join SHIPS son o.SHIP = s.NAMEjoin CLASSES con c.CLASS = s.classwhere RESULT = 'sunk' and COUNTRY ='Japan'--8. �� �� ������� ������� � ��������� �� ������ ������, ������� �� ���� ���� ������ ����
--������ 'Rodney' � ����� �� �������� �� � ��-����� �� ������� ���� ������ ��
--���������, ������������ �� ������� ������.select s.class, NUMGUNSfrom SHIPS s join classes con s.class = c.CLASSwhere launched = (select LAUNCHED from ships where name = 'Rodney') + 1group by s.class, numgunshaving NUMGUNS <= all(select avg(numguns) from classes group by country)--9. �� �� ������� ������������� �������, �� ����� ������ ����� ������ �� ������� �� ����
--� ������� �� ���� 10 ������ (�������� ������ �� ���� North Carolina �� ������� �
--������� �� 1911 �� 1941, ����� � ������ �� 10 ������, ������ ������ �� ���� Tennessee
--�� ������� ���� ���� 1920 � 1921 �.).

select C.CLASS
from CLASSES c join SHIPS s
on c.CLASS = s.CLASS
where COUNTRY = 'USA'
GROUP BY C.CLASS
HAVING (MAX(LAUNCHED) - MIN(LAUNCHED)) >= 10

--10. �� ����� ����� �� �� ������ �������� ���� ������ �� ���� � ���� ������� (�������� �
--������� ��� Guadalcanal �� ��������� 3 ����������� � ���� ������� �����, �.�.
--�������� ���� � 2).

SELECT BATTLE,count(s.name)/2
FROM OUTCOMES o join SHIPS s
on o.SHIP = s.NAME
join classes c 
on c.class = s.class
group by BATTLE

--11. �� ����� ������� �� �� ������: ����� �� �������� �� ���� �������; ���� �� �������, �
--����� � ���������; ���� �� �������, � ����� ���� ����� � ������� ('sunk') (��� ����� ��
--�������� � 0 � �� �� ������� 0).select country,count( s.name),count(distinct battle)from CLASSES c join SHIPS son c.CLASS = s.CLASSleft join outcomes oon o.ship = s.name and result = 'damaged'group by countryselect   country, count(ship) as Cships , count( distinct battle)as Cbattles
from classes join ships
 on classes.CLASS=ships.CLASS
left join outcomes 
on ships.NAME=outcomes.SHIP and  result='damaged'
group by country

--12. �� ����� ������/������� �������� ���� �� ���������� ������, � ����� �� ��������� �����

select starname,count(distinct m.STUDIONAME)
from starsin si join movie m
on si.movietitle = m.title
join studio s
on s.NAME = m.STUDIONAME
group by  STARNAME

--13. �� ����� ������/������� �������� ���� �� ���������� ������, � ����� �� ��������� �����,
--����������� � �� ����, �� ����� ������ ���������� � ����� ����� �� ������.

select starname,count(distinct m.STUDIONAME)
from starsin si right join movie m
on si.movietitle = m.title
right join studio s
on s.NAME = m.STUDIONAME
group by  STARNAME

--14. �������� ������� �� ���������, ��������� � ���� 3 ����� ���� 1990 �

select STARNAME, count(title)
from movie m join starsin si
on m.title = si.movietitle
group by starname
having count(title)>=2

--15. �� �� ������� ���������� ������ ��������, ��������� �� ���� �� ���-������ ���������
--�������� �� ����� �����.

select model
from pc
group by model
order by max(price)

--16. �������� ���� �� ���������� ����������� ������ �� ����� ��������� ����� � ���� ����
--������� ����������� �����.select battle, count(o.battle)from OUTCOMES o join SHIPS son o.SHIP = s.NAMEjoin CLASSES con c.CLASS = s.CLASSwhere country = 'USA' AND RESULT = 'sunk'group by BATTLE--17. �������, � ����� �� ��������� ���� 3 ������ �� ���� � ���� ������.select BATTLE, count(o.SHIP)from OUTCOMES o join SHIPS son o.SHIP = s.NAMEjoin CLASSES con c.CLASS = s.CLASSgroup by  BATTLE, COUNTRYhaving count(s.name) > 3--18. ������� �� ���������, �� ����� ���� �����, ������ �� ���� ���� 1921 �., �� ���� ������ ����
--���� �����.select *from CLASSES c join SHIPS son c.CLASS = s.CLASS
