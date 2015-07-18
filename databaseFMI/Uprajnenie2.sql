--Напишете заявка, която извежда имената на актьорите мъже, участвали в ‘Terms
--of Endearment’
SELECT NAME
FROM MOVIESTAR, STARSIN
WHERE GENDER = 'M' AND MOVIETITLE = 'Terms of Endearment'

--Напишете заявка, която извежда имената на актьорите, участвали във филми,
--продуцирани от ‘MGM’през 1995 г
SELECT STARNAME
FROM MOVIE, STARSIN
WHERE STUDIONAME = 'MGM' AND YEAR = 1995 and movietitle=title and year=movieyear;

--Напишете заявка, която извежда името на президента на ‘MGM’
select distinct name
from movie, movieexec
where producerc#=cert# and studioname='MGM';

--Напишете заявка, която извежда имената на всички филми с дължина, по-голяма
--от дължината на филма ‘Star Wars’
SELECT m1.TITLE
FROM MOVIE m1, MOVIE m2
WHERE m2.TITLE = 'Star Wars' and m1.year<>m2.year and m1.title<>m2.title and m1.length > m2.length;

--Напишете заявка, която извежда производителя и честотата на тези лаптопи с
--размер на диска поне 9 GBselect maker,speedfrom laptop,productwhere hd>9--Напишете заявка, която извежда номер на модел и цена на всички продукти,
--произведени от производител с име ‘B’

select p.model,price
from product p, pc pc
where maker='B' and p.model = pc.model

select distinct p.model, l.price as Price, p.type
from product p, laptop l
where maker='B' and p.model=l.model

--Напишете заявка, която извежда размерите на тези дискове, които се предлагат в
--повече от два компютъра

select distinct pc1.hd
from pc pc1, pc pc2
where pc1.hd = pc2.hd and pc1.code<>pc2.code

--Напишете заявка, която извежда всички двойки модели на компютри, които имат
--еднаква честота и памет. Двойките трябва да се показват само по веднъж,
--например само (i, j), но не и (j, i)

select pc1.model, pc2.model
from pc pc1, pc pc2
where pc1.speed = pc2.speed and pc1.model = pc2.model and pc1.code<>pc2.code

--Напишете заявка, която извежда производителите на поне два различни
--компютъра с честота поне 1000.select distinct p1.maker, p1.model
from product p1, product p2, pc as pc1, pc as pc2
where p1.maker=p2.maker and p1.model<>p2.model and pc1.speed>400 and pc1.model=p1.model and
pc2.speed>400 and pc2.model=p2.model;

--Напишете заявка, която извежда името на корабите, по-тежки (displacement) от 35000select s.Namefrom SHIPS s, CLASSES cWHERE S.CLASS = C.CLASS AND c.DISPLACEMENT > 35000--Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на
--всички кораби, участвали в битката при ‘Guadalcanal’select s.name, c.displacement, c.numguns
from ships s, classes c, outcomes o
where o.battle='Guadalcanal' and o.ship=s.name and c.class=s.class;

--Напишете заявка, която извежда имената на тези държави, които имат кораби от
--тип ‘bb’ и ‘bc’ едновременноSELECT C1.COUNTRY, c1.TYPE , c2.TYPEFROM CLASSES c1, CLASSES c2WHERE c1.type = 'bb' and c2.TYPE = 'bc' and c1.COUNTRY=c2.COUNTRY--Напишете заявка, която извежда имената на тези кораби, които са били
--повредени в една битка, но по-късно са участвали в друга битка.