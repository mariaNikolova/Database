-- 1. Без повторение заглавията и годините на всички филми, заснети преди 1982, в които е играл
--поне един актьор (актриса), чието име не съдържа нито буквата 'k', нито 'b'. Първо да се изведат
--най-старите филми.--Mimiselect distinct TITLE, YEAR from movie m join STARSIN son m.TITLE = s.MOVIETITLEwhere YEAR < 1982 and (starname not like '%k%' and STARNAME not like '%b')order by year--StaniSELECT DISTINCT st.MOVIETITLE, st.MOVIEYEAR
FROM STARSIN st JOIN MOVIESTAR mo
ON st.STARNAME = mo.NAME
WHERE st.MOVIEYEAR < 1982 AND (mo.NAME NOT LIKE '%k%' OR mo.NAME NOT LIKE '%b%')
ORDER BY st.MOVIEYEAR ASC-- 2. Заглавията и дължините в часове (length е в минути) на всички филми, които са от същата
--година, от която е и филмът Terms of Endearment, но дължината им е по-малка или неизвестна.select * from movieSELECT m.TITLE, m.LENGTH/60
FROM MOVIE m
WHERE M.YEAR < (SELECT YEAR FROM MOVIE WHERE TITLE = 'Terms of Endearment')
AND (m.LENGTH <= ALL(SELECT LENGTH FROM MOVIE WHERE TITLE = 'Terms of Endearment' ) 
OR m.LENGTH IS NULL)-- 3. Имената на всички продуценти, които са и филмови звезди и са играли в поне един филм
--преди 1980 г. и поне един след 1985 г.
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
   where  YEAR>1985)--Всички черно-бели филми, записани преди най-стария цветен филм (InColor='y'/'n') на същото
--студио.select * from movie order by yearselect *from moviewhere YEAR < (select max(YEAR) from movie where INCOLOR = 'Y') AND INCOLOR = 'N'	AND STUDIONAME = (SELECT STUDIONAME FROM MOVIE WHERE YEAR >= ALL(SELECT YEAR FROM MOVIE))--5. Имената и адресите на студиата, които са работили с по-малко от 5 различни филмови звезди1.
--Студиа, за които няма посочени филми или има, но не се знае кои актьори са играли в тях, също
--да бъдат изведени. Първо да се изведат студиата, работили с най-много звезди.
--1напр. ако студиото има два филма, като в първия са играли A, B и C, а във втория - C, D и Е, то
--студиото е работило с 5 звезди общоselect * from movieselect * from STUDIOselect s.name,s.ADDRESSfrom studio s join movie mon s.NAME = m.STUDIONAMEjoin STARSIN sion si.MOVIETITLE=m.TITLEgroup by s.name, s.ADDRESShaving COUNT(si.starname) < 5--6. За всеки кораб, който е от клас с име, несъдържащо буквите i и k, да се изведе името
--на кораба и през коя година е пуснат на вода (launched). Резултатът да бъде сортиран
--така, че първо да се извеждат най-скоро пуснатите кораби.select * from shipsselect name, launchedfrom SHIPSwhere class not like '%i%' and class not like '%k%'order by LAUNCHED desc-- 7. Да се изведат имената на всички битки, в които е повреден (damaged) поне един
--японски кораб.select *FROM BATTLES b join OUTCOMES oon b.NAME = o.BATTLEjoin ships son s.NAME = o.SHIPjoin classes con c.CLASS = s.CLASSwhere result = 'damaged' and country ='Japan'select *from OUTCOMES o join SHIPS son o.SHIP = s.NAMEjoin CLASSES con c.CLASS = s.classwhere RESULT = 'sunk' and COUNTRY ='Japan'--8. Да се изведат имената и класовете на всички кораби, пуснати на вода една година след
--кораба 'Rodney' и броят на оръдията им е по-голям от средния брой оръдия на
--класовете, произвеждани от тяхната страна.select s.class, NUMGUNSfrom SHIPS s join classes con s.class = c.CLASSwhere launched = (select LAUNCHED from ships where name = 'Rodney') + 1group by s.class, numgunshaving NUMGUNS <= all(select avg(numguns) from classes group by country)--9. Да се изведат американските класове, за които всички техни кораби са пуснати на вода
--в рамките на поне 10 години (например кораби от клас North Carolina са пускани в
--периода от 1911 до 1941, което е повече от 10 години, докато кораби от клас Tennessee
--са пуснати само през 1920 и 1921 г.).

select C.CLASS
from CLASSES c join SHIPS s
on c.CLASS = s.CLASS
where COUNTRY = 'USA'
GROUP BY C.CLASS
HAVING (MAX(LAUNCHED) - MIN(LAUNCHED)) >= 10

--10. За всяка битка да се изведе средният брой кораби от една и съща държава (например в
--битката при Guadalcanal са участвали 3 американски и един японски кораб, т.е.
--средният брой е 2).

SELECT BATTLE,count(s.name)/2
FROM OUTCOMES o join SHIPS s
on o.SHIP = s.NAME
join classes c 
on c.class = s.class
group by BATTLE

--11. За всяка държава да се изведе: броят на корабите от тази държава; броя на битките, в
--които е участвала; броя на битките, в които неин кораб е потънал ('sunk') (ако някоя от
--бройките е 0 – да се извежда 0).select country,count( s.name),count(distinct battle)from CLASSES c join SHIPS son c.CLASS = s.CLASSleft join outcomes oon o.ship = s.name and result = 'damaged'group by countryselect   country, count(ship) as Cships , count( distinct battle)as Cbattles
from classes join ships
 on classes.CLASS=ships.CLASS
left join outcomes 
on ships.NAME=outcomes.SHIP and  result='damaged'
group by country

--12. За всеки актьор/актриса изведете броя на различните студиа, с които са записвали филми

select starname,count(distinct m.STUDIONAME)
from starsin si join movie m
on si.movietitle = m.title
join studio s
on s.NAME = m.STUDIONAME
group by  STARNAME

--13. За всеки актьор/актриса изведете броя на различните студиа, с които са записвали филми,
--включително и за тези, за които нямаме информация в какви филми са играли.

select starname,count(distinct m.STUDIONAME)
from starsin si right join movie m
on si.movietitle = m.title
right join studio s
on s.NAME = m.STUDIONAME
group by  STARNAME

--14. Изведете имената на актьорите, участвали в поне 3 филма след 1990 г

select STARNAME, count(title)
from movie m join starsin si
on m.title = si.movietitle
group by starname
having count(title)>=2

--15. Да се изведат различните модели компютри, подредени по цена на най-скъпия конкретен
--компютър от даден модел.

select model
from pc
group by model
order by max(price)

--16. Изведете броя на потъналите американски кораби за всяка проведена битка с поне един
--потънал американски кораб.select battle, count(o.battle)from OUTCOMES o join SHIPS son o.SHIP = s.NAMEjoin CLASSES con c.CLASS = s.CLASSwhere country = 'USA' AND RESULT = 'sunk'group by BATTLE--17. Битките, в които са участвали поне 3 кораба на една и съща страна.select BATTLE, count(o.SHIP)from OUTCOMES o join SHIPS son o.SHIP = s.NAMEjoin CLASSES con c.CLASS = s.CLASSgroup by  BATTLE, COUNTRYhaving count(s.name) > 3--18. Имената на класовете, за които няма кораб, пуснат на вода след 1921 г., но имат пуснат поне
--един кораб.select *from CLASSES c join SHIPS son c.CLASS = s.CLASS
