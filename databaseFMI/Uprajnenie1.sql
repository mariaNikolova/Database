--Напишете заявка, коятоизвеждаадресътнастудио ‘MGM’ 

SELECT ADDRESS
FROM STUDIO
WHERE NAME = 'MGM'

--Напишетезаявка, коятои звежда рождената дата на актрисата Sandra Bull
SELECT BIRTHDATE
FROM MOVIESTAR
WHERE NAME = 'Sandra Bullock'

--Напишете заявка, която извежда имената на всички актьори, които са участвали
--във филм през 1980 в заглавието на които има думата ‘Love’ 

SELECT STARNAME
FROM STARSIN
WHERE MOVIEYEAR = 1980 AND MOVIETITLE LIKE'%Love%'

--Напишете заявка, която извежда имената всички изпълнители на филми на
--стойност над 10 000 000 долара

SELECT NAME
FROM MOVIEEXEC
where NETWORTH > 10000000 

--Напишете заявка, която извежда имената на всички актьори, които са мъже или
--живеят в Malibu 
SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'M' OR ADDRESS LIKE '%Malibu%'

--Напишете заявка, която извежда номер на модел, честота и размер на диска за
--всички компютри с цена по-малка от 1200 долара. Задайте псевдоними за
--атрибутите честота и размер на диска, съответно MHz и GB 
SELECT model as 'Model', speed as 'Speed- MHz', hd as 'HD-GB'
FROM PC
where price < 1200

--Напишете заявка, която извежда всички производители на принтери без повторения
SELECT DISTINCT maker
FROM product
where type = 'Printer'

--Напишете заявка, която извежда номер на модел, размер на паметта, размер на
--екран за лаптопите, чиято цена е по-голяма от 1000 долара

select model, hd, screen
from laptop
where price>1000

--Напишете заявка, която извежда всички цветни принтери
select *
from printer
where color = 'y'

--Напишете заявка, която извежда номер на модел, честота и размер на диска за
--тези компютри с DVD 12x или 16x и цена по-малка от 2000 долара. 
select model, speed, hd
from pc
where (cd='12x' or cd='16x') and price<2000

--Напишете заявка, която извежда името на класа и страната за всички класове с
--брой на оръдията по-малък от 10 
SELECT CLASS, COUNTRY
FROM CLASSES
WHERE NUMGUNS<10

--Напишете заявка, която извежда имената на всички кораби, пуснати на вода
--преди 1918. Задайте псевдоним на колоната shipName 
SELECT NAME AS ShipName
FROM SHIPS
WHERE LAUNCHED<1918

--Напишете заявка, която извежда имената на корабите потънали в битка и
--имената на битките в които са потънали
SELECT SHIP,BATTLE
FROM OUTCOMES
where RESULT = 'sunk'

--Напишете заявка, която извежда имената на корабите с име съвпадащо с името
--на техния клас
SELECT NAME, CLASS
FROM SHIPS
WHERE NAME = CLASS

--Напишете заявка, която извежда имената на всички кораби започващи с буквата R
SELECT NAME
FROM SHIPS
WHERE NAME LIKE 'R%'

--Напишете заявка, която извежда имената на всички кораби, чието име е
--съставено от точно две думи. 
SELECT NAME
FROM SHIPS
WHERE NAME LIKE '% %' AND NAME NOT LIKE '% % %'
