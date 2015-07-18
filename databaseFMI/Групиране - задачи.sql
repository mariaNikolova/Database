-- �� ����� ������/������� �������� ���� �� ���������� ������, 
-- � ����� �� ��������� �����. �������� � ����, �� ����� ���� ���������� � ��� ����� �� ������.

select  si.STARNAME, count(distinct s.name)
from STARSIN si join MOVIE m
on m.TITLE = si.MOVIETITLE
join STUDIO s
on m.studioname = s.name
group by si.STARNAME

-- �������� ������� �� ���������, ��������� � ���� 3 ����� 
-- ���� 1990 �.

select  starname
from starsin
where movieyear > 1990
group by  STARNAME
having count(STARNAME)<=3


-- �� �� ������� ���������� ������ ��������, ��������� �� ���� 
-- �� ���-������ ��������� �������� �� ����� �����.


select model
from pc
group by model
order by MAX(price)

-- ���� �� ���������� ����������� ������ �� ����� ��������� 
-- ����� � ���� ���� ������� ����������� �����.

select BATTLE, COUNT(s.NAME), count(o.SHIP)
from outcomes o join ships s
on o.ship = s.NAME
join CLASSES c
on c.class = s.class
where RESULT = 'sunk' and COUNTRY = 'USA'
GROUP BY BATTLE


-- �������, � ����� �� ��������� ���� 3 ������ �� ���� � ���� 
-- ������

select COUNTRY, BATTLE, count(o.SHIP)
from outcomes o join ships s
on o.ship = s.NAME
join CLASSES c
on c.class = s.class
group by COUNTRY,BATTLE
having count(o.SHIP) >= 3


select distinct battle -- ��� �� ��������� 3 ����������� ������ � 3 ������� ������ � Guadalcanal,
						-- �� �� �� ����� ��� ����, ������ ������ distinct
from outcomes
join ships on ship = name
join classes on ships.class = classes.class
group by battle, country
having count(*) >= 3;

-- ������� �� ���������, �� ����� ���� �����, ������ �� ���� 
-- ���� 1921 �., �� ���� ������ ���� ���� �����. 

select * 
from ships s right join  classes c
on c.CLASS = s.CLASS
where LAUNCHED > 1921

-- (*) �� ����� ����� ���� �� �������, � ����� � ��� �������. 
-- ��� ������� �� � �������� � ����� ��� ��� ������ �� � ��� 
-- ��������, � ��������� �� �� ������ 0.

select s.name, count(BATTLE)
from OUTCOMES o right join SHIPS s
on s.name = o.SHIP
and result = 'damaged'
group by s.name

select name, count(battle) as battlesCount
from ships
left join outcomes on name = ship and result = 'damaged'
group by name;

-- (*) �������� �� ����� ���� � ���� 3 ������ ���� �� �������� �� ���� ����, ����� �� �������� � ����� (result = 'ok')

select CLASS, name
from SHIPS s join outcomes o
on s.name = o.ship
--where RESULT = 'ok'
group by CLASS, name, result
having count(name)<3 and result='ok'

-- �� ����� ����� �� �� ������ ����� �� �������, �������� ��  
-- ������� � ����� �� ���������� ������, ����� �� ����������� 
-- ������ � ����� �� �������� ��� �������.

select name, DATE, result, count(result)
from battles b join outcomes o
on b.name = o.BATTLE
group by name, date, result


-- (*) �������� ������� �� �������, � ����� �� ��������� ���� 3 ������ � ��� 9 ������ � �� ��� ���� ��� �� � �������� �ok� 

select o.BATTLE, SHIP, count(ship), count(c.NUMGUNS), count(result), RESULT
from SHIPS s join outcomes o
on s.NAME = o.ship
join classes c
on c.CLASS = s.CLASS
group by o.BATTLE, SHIP, result
having count(ship) < 3 and count(c.NUMGUNS) < 9 and ( COUNT(result) <= 2 and result = 'ok' )


