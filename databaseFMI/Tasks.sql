-- 1. ��� ���������� ���������� � �������� �� ������ �����, ������� ����� 1982, � ����� � �����
--���� ���� ������ (�������), ����� ��� �� ������� ���� ������� 'k', ���� 'b'. ����� �� �� �������
--���-������� �����.
FROM STARSIN st JOIN MOVIESTAR mo
ON st.STARNAME = mo.NAME
WHERE st.MOVIEYEAR < 1982 AND (mo.NAME NOT LIKE '%k%' OR mo.NAME NOT LIKE '%b%')
ORDER BY st.MOVIEYEAR ASC
--������, �� ����� � � ������ Terms of Endearment, �� ��������� �� � ��-����� ��� ����������.
FROM MOVIE m
WHERE M.YEAR < (SELECT YEAR FROM MOVIE WHERE TITLE = 'Terms of Endearment')
AND (m.LENGTH <= ALL(SELECT LENGTH FROM MOVIE WHERE TITLE = 'Terms of Endearment' ) 
OR m.LENGTH IS NULL)
--����� 1980 �. � ���� ���� ���� 1985 �.
select * from movie
select * from MOVIEEXEC

select me.NAME, m.YEAR
from movieexec me join movie m
on me.cert# = m.PRODUCERC#
join STARSIN s
on s.movietitle = m.title
where YEAR <= 1980 and YEAR >= 1985

FROM MOVIEEXEC mo JOIN MOVIE m
on mo.CERT# = m.PRODUCERC#
JOIN STARSIN st 
on st.MOVIETITLE = m.TITLE AND st.MOVIEYEAR = m.YEAR
WHERE mo.NAME = st.STARNAME AND m.YEAR < ANY(SELECT YEAR FROM MOVIE WHERE YEAR < 1980) 
AND m.YEAR < ANY(SELECT YEAR FROM MOVIE WHERE YEAR > 1985)
   intersect 
   (select  starname from STARSIN join movie on movietitle=title
   where  YEAR<1980
   intersect
   select  starname from STARSIN join movie on movietitle=title
   where  YEAR>1985)
--������.
--������, �� ����� ���� �������� ����� ��� ���, �� �� �� ���� ��� ������� �� ������ � ���, ����
--�� ����� ��������. ����� �� �� ������� ��������, �������� � ���-����� ������.
--1����. ��� �������� ��� ��� �����, ���� � ������ �� ������ A, B � C, � ��� ������ - C, D � �, ��
--�������� � �������� � 5 ������ ����
--�� ������ � ���� ��� ������ � ������ �� ���� (launched). ���������� �� ���� ��������
--����, �� ����� �� �� �������� ���-����� ��������� ������.
--������� �����.
--������ 'Rodney' � ����� �� �������� �� � ��-����� �� ������� ���� ������ ��
--���������, ������������ �� ������� ������.
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
--�������� � 0 � �� �� ������� 0).
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
--������� ����������� �����.
--���� �����.