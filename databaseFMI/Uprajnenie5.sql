--�������� ������, ����� ������� �������� ������� �� ����������

select avg(speed) as avgSpeed
from pc

--�������� ������, ����� ������� ������� ������ �� �������� �� ��������� ��
--����� ������������

select AVG(screen) as avgScreen, p.maker
from laptop l join product p
on l.model = p.model
group by p.maker

--�������� ������, ����� ������� �������� ������� �� ��������� � ���� ��� 1000
select AVG(speed) as avgSpeed
from laptop
where price > 1000

--�������� ������, ����� ������� �������� ���� �� ���������� ����������� ��
--������������ �A�

select AVG(price) AS avgPrice
from pc pc join product p
on pc.model = p.model
where p.maker = 'A'

--�������� ������, ����� ������� �������� ���� �� ���������� � ��������� ��
--������������ �B�
select  avg(price) as AvgPrice
from (select  maker, price from pc, product 
		where pc.model = product.model and maker= 'B'
		union all
		select   maker, price from laptop l, product p
		where l.model = p.model AND maker = 'B')T


--�������� ������, ����� ������� �������� ���� �� ���������� ������
--���������� �� �������

select avg(price) avgPrice, speed
from pc
group by speed

--�������� ������, ����� ������� ���������������, ����� �� ��������� ���� �� 3
--�������� ������ ���������

SELECT p.maker
FROM pc pc join product p
on pc.model = p.model
group by p.maker
having count(p.model)>=3

select p.maker, count(distinct p.model) as CNT
from pc join product p on p.model=pc.model
group by p.maker
having count(distinct p.model)>=3;

--�������� ������, ����� ������� ��������������� �� ���������� � ���-������
--����

select p.maker
from pc join product p
on pc.model=p.model
where price = (select max(price) from pc)

--�������� ������, ����� ������� �������� ���� �� ���������� �� ����� �������
--��-������ �� 800

select avg(price)
from pc
group by speed
having speed > 800

select speed,avg(price) as AvgPrice
from pc
where speed>800
group by speed;

--�������� ������, ����� ������� ������� ������ �� ����� �� ���� ��������
--����������� �� �������������, ����� ����������� � ��������select avg(hd) as avgRamfrom pc pc join product pon pc.model = p.modelwhere maker in (select maker from product p join printer pr				on p.model = pr.model)select avg(hd) as AvgHDD
from pc join product p on p.model=pc.model
where maker in
		(select distinct maker
		from product
		where type='Printer');--�������� ������, ����� �� ����� ������ �� ������ ������ ��������� � ������ ��
--���-������ � ���-������� ������ ��� ����� ������select( max(l.price ) - min(l.price)), screenfrom laptop lgroup by screen--�� ������ �� ����� SHIPS--�������� ������, ����� ������� ���� �� ��������� ������SELECT COUNT(CLASS)FROM CLASSES--�������� ������, ����� ������� ������� ���� �� ������ �� ������ ������,
--������� �� ����SELECT AVG(NUMGUNS)FROM SHIPS s JOIN OUTCOMES oon s.NAME = o.SHIPjoin classes con c.CLASS = s.CLASSwhere o.RESULT = 'ok'select avg(numGuns) as avgGuns
from classes c join ships s on c.class=s.class;--�������� ������, ����� ������� ���� �� �������� �������� � ����� ������ �����select count(ship), s.classfrom OUTCOMES  o join SHIPS son o.SHIP = s.NAMEwhere o.result = 'sunk'group by s.CLASS--�������� ������, ����� ������� ���� �� �������� �������� � ����� ������
--�����, �� ���� ������� � ������ �� 4 ������� �� ���� ������select c.class
from classes c join ships s on c.class=s.class
group by c.class
having count(name)>4
intersect
select class
from ships s join outcomes o on s.name=o.ship
where o.result='sunk';--�������� ������, ����� ������� �������� ����� �� ��������, �� ����� ������. select avg(DISPLACEMENT), countryfrom classes group by COUNTRYselect country,avg(displacement) as avg_displacement
from classes c join ships s on c.class=s.class
group by country;