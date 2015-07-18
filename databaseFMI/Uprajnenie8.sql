-- �� �� ������ ���������� �� ��������� Nicole Kidman. �� ��� ����� ����, �� � ������ �� 20-� ��� 1967.
use movies
insert into moviestar(name,birthdate) values('Nicole Kidman', '1967-06-20 00:00:00.000')

-- �� �� ������� ������ ���������� � ������� (networth) ��� 10 �������.
delete from movieexec
where networth > 10000000

-- �� �� ������ ������������ �� ������ ������� ������, �� ����� �� �� ���� ������.
delete from moviestar
where address is null

-- ����������� ��� INSERT ������, ��������� � ������ ����� �����,
-- �� ���������� �������� ����� 1100 � �������� �� ������������� C, 
--��� �������� 2400 MHz, RAM 2048 MB, ����� ���� 500 GB, 52x DVD ���������� � ������ $299. 
--���� ������ �������� ��� ��� 12. ���������: ������� � CD �� �� ��� ���.
-- ��������: ������ �������� �� ����� � �������� ��� �� �����, ��������� � ����� ��� � ��-������� �� �� ����� ������.

use pc
insert into product(model,maker,type) values('1100','C', 'pc');
insert into pc(code,model,speed,ram, hd, price,cd) values(12,'1100',2400,2048,500,299,'52x');

-- �� �� ������ �������� ������� ���������� �� �������� ����� 1100

delete from product
where model='1100'

delete from pc
where model='1100'

---- �� ����� ���������� �������� �� ������� � 15-����� ������ ��� ������ ���������, �� � $500 ��-����. 
--����� �� ����� ������ � ��� 100 ��-����� �� ���� �� ���������� ��������. �������� ���� ���������� � ������.

insert into laptop(code,model,speed,ram,hd,price,screen) 
select code+100,model,speed, ram,hd, price+500, 3 from pc

-- �� �� ������� ������ �������, ��������� �� ������������, ����� �� ���������� ��������.
-- ��������: ������� ��, �� �������� ������ �� ������ ��� - "�� �� ������� ������ �������, ...". 
--������ �� � ����� ������ ����� �������. ��� ��������� �������� �� ������, 
--����� � �������� ��� ����� ������ ���� �� �������� ������ ������� � �� ������ ����� �� �������������� ��������� ��� �� �������� �� �����.
delete from laptop
where model in (select p.model
				from laptop l join product p
				on l.model = p.model
					where maker not in (select maker from printer p join product pr
										on p.model = pr.model))


-- ������������ � ������ ������������ B. �� ������ �������� �� � ��������� ������������� �� ���� �.

update product
set maker = 'A'
WHERE maker = 'B'

-- �� �� ������ ��� ���� ������ �� ����� �������� � �� �� ������� �� 20 GB ��� ����� ����� ����. 
--��������: ���� ����� �� ��� ������� ������.

UPDATE PC
SET price = price/2 , HD = HD+20

-- �� ����� ������ �� ������������ B �������� �� ���� ��� ��� ��������� �� ������.

UPDATE LAPTOP 
SET screen = screen+1
WHERE MODEL = 'B'

-- ��� ��������� ����� ������ �� ����� Nelson - Nelson � Rodney - �� ���� ������� �� ���� ������������ ���� 1927 �. 
--����� �� ����� 16-������ ������ (bore) � ��������������� �� 34 000 ���� (displacement). 
--�������� ���� ����� ��� ������ �� �����.

USE SHIPS
INSERT INTO SHIPS(NAME, CLASS, LAUNCHED) VALUES ('Nelson', 'Nelson', 1927)
INSERT INTO SHIPS(NAME, CLASS, LAUNCHED) VALUES ('Rodney', 'Nelson', 1927)

insert into CLASSES(CLASS,TYPE,COUNTRY,NUMGUNS,BORE,DISPLACEMENT) VALUES ('Nelson','bb','Gt.Britain',9,16,34000)

-- �������� �� Ships ������ ������, ����� �� �������� � �����.
delete from ships
where name in (select ship
from ships s join outcomes o
on s.name = o.SHIP
where RESULT = 'sunk')

-- ��������� ������� � ��������� Classes ����, �� ��������� (bore) �� �� ������� � ����������
-- (� ������� � � ������, 1 ��� ~ 2.5 ��) � ����������������� �� �� ������� � �������� ������ (1 �.�. = 1.1 �.)
update CLASSES
set bore = bore*2.5, DISPLACEMENT = DISPLACEMENT*1.1


-- �������� ������ �������, �� ����� ��� ��-����� �� ��� ������.
delete from CLASSES
where CLASS in
(select c.CLASS
from classes c join SHIPS s
on c.CLASS = s.CLASS
group by c.class
having count(s.name) < 3)

-- ��������� �������� �� �������� � ����������������� �� ����� Iowa, ���� �� �� �� ������ ���� ���� �� ����� Bismarck.
update classes
set bore = (select bore from CLASSES where CLASS = 'Bismarck'), 
	DISPLACEMENT = (select DISPLACEMENT from classes where class = 'Bismarck')
where CLASS = 'Iowa'