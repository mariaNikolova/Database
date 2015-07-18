-- Напишете заявка, която извежда имената на актрисите, които са също и продуценти с нетна стойност 
-- по-голяма от 10 милиона

select name, GENDER
from moviestar
where name in (select name from MOVIEEXEC
				where NETWORTH > 10) and GENDER = 'M'

-- Напишете заявка, която извежда имената на тези актьори (мъже и жени), които не са продуценти.

select name
from MOVIESTAR
where name not in (select name from MOVIEEXEC)

-- Напишете заявка, която извежда имената на всички филми с дължина по-голяма от дължината 
-- на филма 'Gone With the Wind' 

select * from movie

select title, LENGTH
from movie 
where LENGTH < (select LENGTH from MOVIE where title='Gone With the Wind')

--Напишете заявка, която извежда имената на продуцентите и продукциите на стойност по-голяма
-- от продукциите на продуценти 'Merv Griffin'
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


-- Зад 2. За базата от данни PC

-- Напишете заявка, която извежда производителите на персонални компютри с честота поне 500.

select * from pc
select * from product

select maker
from product
where model in (select model from pc
				where speed > 500)

-- Напишете заявка, която извежда принтерите с най-висока цена.
select * from printer

select *
from printer 
where price >= all (select price from printer)

select top 1 *
from printer
order by price desc
				
-- Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от честотата 
-- на който и да е персонален компютър.

select * from laptop order by speed
select * from pc order by speed

select speed
from laptop
where speed < all (select speed from pc)

-- Напишете заявка, която извежда модела на продукта (PC, лап топ или принтер) с най-висока цена.

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



-- Напишете заявка, която извежда производителя на цветния принтер с най-ниска цена.
select * from printer
select * from product

select *
from product
where model in (select model from printer
				 where color='y' and price <= all (select price from printer where color = 'y'))


-- Напишете заявка, която извежда производителите на тези персонални компютри 
-- с най-малко RAM памет, които имат най-бързи процесори.
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
									

-- Зад 3. За базата от данни SHIPS 

set schema ships;

-- Напишете заявка, която извежда страните, чиито кораби са с най-голям брой оръжия.
select * from classes
select * from SHIPS

select distinct COUNTRY
from CLASSES
where class in (select class from ships 
				where NUMGUNS >= all (select NUMGUNS from CLASSES))


select distinct country
from classes
where numguns >= all(select numguns from classes);

-- Напишете заявка, която извежда класовете, за които поне един от корабите им е потънал в битка.
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


-- Напишете заявка, която извежда имената на корабите с 16 инчови оръдия (bore).

select NAME, CLASS
from SHIPS
WHERE CLASS IN (select class from classes where BORE = 16)

-- Напишете заявка, която извежда имената на битките, в които са участвали кораби от клас 'Kongo'.

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


-- Напишете заявка, която извежда иманата на корабите, чийто брой 
-- оръдия е най-голям в сравнение с корабите със същия калибър оръдия (bore).

select c1. class, name
from classes c1, ships s
where s.class = c1.class
	and numguns >= all (select numguns from classes where bore=c1.bore)
order by c1.class;