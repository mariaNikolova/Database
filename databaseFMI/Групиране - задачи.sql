-- За всеки актьор/актриса изведете броя на различните студиа, 
-- с които са записвали филми. Включете и тези, за които няма информация в кои филми са играли.

select  si.STARNAME, count(distinct s.name)
from STARSIN si join MOVIE m
on m.TITLE = si.MOVIETITLE
join STUDIO s
on m.studioname = s.name
group by si.STARNAME

-- Изведете имената на актьорите, участвали в поне 3 филма 
-- след 1990 г.

select  starname
from starsin
where movieyear > 1990
group by  STARNAME
having count(STARNAME)<=3


-- Да се изведат различните модели компютри, подредени по цена 
-- на най-скъпия конкретен компютър от даден модел.


select model
from pc
group by model
order by MAX(price)

-- Броя на потъналите американски кораби за всяка проведена 
-- битка с поне един потънал американски кораб.

select BATTLE, COUNT(s.NAME), count(o.SHIP)
from outcomes o join ships s
on o.ship = s.NAME
join CLASSES c
on c.class = s.class
where RESULT = 'sunk' and COUNTRY = 'USA'
GROUP BY BATTLE


-- Битките, в които са участвали поне 3 кораба на една и съща 
-- страна

select COUNTRY, BATTLE, count(o.SHIP)
from outcomes o join ships s
on o.ship = s.NAME
join CLASSES c
on c.class = s.class
group by COUNTRY,BATTLE
having count(o.SHIP) >= 3


select distinct battle -- ако са участвали 3 американски кораба и 3 японски кораба в Guadalcanal,
						-- тя ще се появи два пъти, затова трябва distinct
from outcomes
join ships on ship = name
join classes on ships.class = classes.class
group by battle, country
having count(*) >= 3;

-- Имената на класовете, за които няма кораб, пуснат на вода 
-- след 1921 г., но имат пуснат поне един кораб. 

select * 
from ships s right join  classes c
on c.CLASS = s.CLASS
where LAUNCHED > 1921

-- (*) За всеки кораб броя на битките, в които е бил увреден. 
-- Ако корабът не е участвал в битки или пък никога не е бил 
-- увреждан, в резултата да се вписва 0.

select s.name, count(BATTLE)
from OUTCOMES o right join SHIPS s
on s.name = o.SHIP
and result = 'damaged'
group by s.name

select name, count(battle) as battlesCount
from ships
left join outcomes on name = ship and result = 'damaged'
group by name;

-- (*) Намерете за всеки клас с поне 3 кораба броя на корабите от този клас, които са победили в битка (result = 'ok')

select CLASS, name
from SHIPS s join outcomes o
on s.name = o.ship
--where RESULT = 'ok'
group by CLASS, name, result
having count(name)<3 and result='ok'

-- За всяка битка да се изведе името на битката, годината на  
-- битката и броят на потъналите кораби, броят на повредените 
-- кораби и броят на корабите без промяна.

select name, DATE, result, count(result)
from battles b join outcomes o
on b.name = o.BATTLE
group by name, date, result


-- (*) Намерете имената на битките, в които са участвали поне 3 кораба с под 9 оръдия и от тях поне два са с резултат ‘ok’ 

select o.BATTLE, SHIP, count(ship), count(c.NUMGUNS), count(result), RESULT
from SHIPS s join outcomes o
on s.NAME = o.ship
join classes c
on c.CLASS = s.CLASS
group by o.BATTLE, SHIP, result
having count(ship) < 3 and count(c.NUMGUNS) < 9 and ( COUNT(result) <= 2 and result = 'ok' )


