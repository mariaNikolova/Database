-- �������� ������, ����� ������� ������� �� ���������, ����� �� ���� � ���������� � ����� �������� 
-- ��-������ �� 10 �������

select name, GENDER
from moviestar
where name in (select name from MOVIEEXEC
				where NETWORTH > 10) and GENDER = 'M'

-- �������� ������, ����� ������� ������� �� ���� ������� (���� � ����), ����� �� �� ����������.

select name
from MOVIESTAR
where name not in (select name from MOVIEEXEC)

-- �������� ������, ����� ������� ������� �� ������ ����� � ������� ��-������ �� ��������� 
-- �� ����� 'Gone With the Wind' 

select * from movie

select title, LENGTH
from movie 
where LENGTH < (select LENGTH from MOVIE where title='Gone With the Wind')

--�������� ������, ����� ������� ������� �� ������������ � ����������� �� �������� ��-������
-- �� ����������� �� ���������� 'Merv Griffin'
select * from MOVIEEXEC
select * from studio
select * from movie

select title
from MOVIE
where PRODUCERC# in (select cert# from MOVIEEXEC 
					where NETWORTH > (select NETWORTH from MOVIEEXEC
										where NAME='Merv Griffin'))

-- 2 na4in 

select title,t.name
from movie m,
(select cert#, name
 from movieexec
 where networth > ( select networth
				   from movieexec
				   where name='Merv Griffin')) t
where m.producerc#=t.cert#;


-- ��� 2. �� ������ �� ����� PC

-- �������� ������, ����� ������� ��������������� �� ���������� �������� � ������� ���� 500.

select * from pc
select * from product

select maker
from product
where model in (select model from pc
				where speed > 500)

-- �������� ������, ����� ������� ���������� � ���-������ ����.
select * from printer

select *
from printer 
where price >= all (select price from printer)

select top 1 *
from printer
order by price desc
				
-- �������� ������, ����� ������� ���������, ����� ������� � ��-����� �� ��������� 
-- �� ����� � �� � ���������� ��������.

select * from laptop order by speed
select * from pc order by speed

select speed
from laptop
where speed < all (select speed from pc)

-- �������� ������, ����� ������� ������ �� �������� (PC, ��� ��� ��� �������) � ���-������ ����.

select * from pc order by price

select model, price
from pc
where price >= all (select price from pc)

select * from laptop order by price
select model, price
from laptop
where price >= all (select price from laptop)


--select *
--from pc, product, laptop , printer, ( select pc.price or laptop.price or printer.price
--														from pc, product, laptop , printer
--														where pc.model = product.model or 
--														laptop.model = product.model or )
--														printer.model = product.model)

select top 1  m.model, m.price
from  (select price from pc,product
		where pc.model = product.model) t,
		(select price, laptop.model from laptop, product
		where laptop.model = product.model) m,
		(select price from printer, product
		where printer.model = product.model) h
		where (t.price >=  m.price and t.price >= h.price) or 
				(m.price >= t.price and m.price >= h.price) or 
				(h.price >= t.price and h.price >= m.price) order by t.price desc , m.price desc, h.price desc


select model, price
from (
	select model, price from printer
	union
	select  model, price from pc
	union	
	select model, price from laptop
	) t
where t.price >= ALL (select price 
					  from (
					  		select model, price from printer
							union
							select  model, price from pc
							union
							select model, price from laptop
							) t
						);



-- �������� ������, ����� ������� ������������� �� ������� ������� � ���-����� ����.
select * from printer
select * from product

select *
from product
where model in (select model from printer
				 where color='y' and price <= all (select price from printer where color = 'y'))


-- �������� ������, ����� ������� ��������������� �� ���� ���������� �������� 
-- � ���-����� RAM �����, ����� ���� ���-����� ���������.
select * from product 
select ram, speed from pc order by ram

select *
from product
where model in (select model from pc
				where ram <= all(select ram from pc
				 where speed >= all(select speed from pc)))



select maker
from product
where model in 
		(select model
		 from pc p
		 where ram <= ALL(select ram from pc) and speed >= ALL(select speed from pc where ram=p.ram));
									

-- ��� 3. �� ������ �� ����� SHIPS 

set schema ships;

-- �������� ������, ����� ������� ��������, ����� ������ �� � ���-����� ���� ������.
select * from classes
select * from SHIPS

select distinct COUNTRY
from CLASSES
where class in (select class from ships 
				where NUMGUNS >= all (select NUMGUNS from CLASSES))


select distinct country
from classes
where numguns >= all(select numguns from classes);

-- �������� ������, ����� ������� ���������, �� ����� ���� ���� �� �������� �� � ������� � �����.
select * from classes
select * from SHIPS
select * from battles
select * from OUTCOMES

select class
from classes
where class in (select class from SHIPS 
				where name in (select ship from OUTCOMES
								where RESULT = 'sunk'))

select distinct class
from ships
where name in
		(select ship 
		from outcomes
		where result='sunk');


-- �������� ������, ����� ������� ������� �� �������� � 16 ������ ������ (bore).

select NAME, CLASS
from SHIPS
WHERE CLASS IN (select class from classes where BORE = 16)

-- �������� ������, ����� ������� ������� �� �������, � ����� �� ��������� ������ �� ���� 'Kongo'.

select name
from battles
where name in (select battle from outcomes
				where ship in (select name from ships where class = 'Kongo'))



select battle
from outcomes
where ship in
		(select name
 		 from ships
 		 where class = 'Kongo');


-- �������� ������, ����� ������� ������� �� ��������, ����� ���� 
-- ������ � ���-����� � ��������� � �������� ��� ����� ������� ������ (bore).

select c1. class, name
from classes c1, ships s
where s.class = c1.class
	and numguns >= all (select numguns from classes where bore=c1.bore)
order by c1.class;