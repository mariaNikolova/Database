--Напишете заявка, която за всеки филм, по-дълъг от 120 минути, извежда
--заглавие, година, име и адрес на студио.select title, YEAR, s.name, s.addressfrom movie m join STUDIO son m.STUDIONAME = s.NAMEwhere m.LENGTH > 120--Напишете заявка, която извежда името на студиото и имената на актьорите,
--участвали във филми, произведени от това студио, подредени по име на студиоselect distinct m.STUDIONAME, s.STARNAMEfrom movie m join STARSIN son m.TITLE = s.MOVIETITLEorder by m.STUDIONAME
select distinct m.studioname, si.starname
from movie m join starsin si on m.title=si.movietitle and m.year=si.movieyear
order by m.studioname;--Напишете заявка, която извежда имената на продуцентите на филмите, в които е
--играл Harrison Ford.select distinct me.namefrom movie m join STARSIN son m.TITLE = s.MOVIETITLE join MOVIEEXEC meon me.CERT# = m.PRODUCERC#where s.starname = 'Harrison Ford'select distinct me.name
from movie m join starsin s on m.title=s.movietitle and m.year=s.movieyear
			 join movieexec me on m.producerc#=me.cert#
where starname='Harrison Ford';
--Напишете заявка, която извежда имената на актрисите, играли във филми на
--MGM

select ms.name
from MOVIE m join STARSIN s
on m.TITLE = s.MOVIETITLE
JOIN MOVIESTAR ms 
on s.STARNAME = ms.NAME
where m.STUDIONAME = 'MGM' and ms.GENDER = 'F'

--Напишете заявка, която извежда името на продуцента и имената на филмите,
--продуцирани от продуцента на ‘Star Wars’.

select title, name
from movie m join MOVIEEXEC me
on m.PRODUCERC# = me.CERT#
where CERT# in (select PRODUCERC# from MOVIE where TITLE = 'Star Wars')


select title, t.name
from movie m join
(select name, cert#
from movieexec
where cert# in (select producerc#
               from movie
               where title='Star Wars')) t
on m.producerc#=t.cert#;


--Напишете заявка, която извежда имената на актьорите не участвали в нито един филм.select  ms.namefrom moviestar ms left join STARSIN son ms.NAME = s.STARNAMEleft join MOVIE mon m.TITLE = s.MOVIETITLEwhere s.MOVIETITLE is null--. За базата от данни PC--Напишете заявка, която извежда производител, модел и тип на продукт за тези
--производители, за които съответния продукт не се продава (няма го в таблиците
--PC, лаптоп или принтер).select p.maker, p.model, p.typefrom product p left join pc pcon p.model = pc.modelleft join laptop lon l.model = p.modelleft join printer pron pr.model = p.modelwhere (pc.model is null) and (l.model is null) and (pr.model is null)select p.maker,p.model,p.type
from product p left join pc on p.model=pc.model
			   left join printer pr on p.model=pr.model
			   left join laptop l on p.model=l.model
where pc.code is null and pr.code is null and l.code is null;

--За базата от данни SHIPS--Напишете заявка, която за всеки кораб извежда името му, държавата, броя
--оръдия и годината на пускане (launched).select sh.NAME, c.COUNTRY, c.NUMGUNS, sh.LAUNCHEDfrom ships sh join classes con sh.class = c.CLASS--Напишете заявка, която извежда имената на корабите, участвали в битка от 1942г.select SHIPfrom OUTCOMES o join BATTLES bon o.BATTLE = b.NAMEwhere b.DATE = '1942-11-15 00:00:00.000'--За всяка страна изведете имената на корабите, които никога не са участвали в биткаselect s.NAME, c.COUNTRYfrom classes c join SHIPS son c.CLASS = s.CLASSleft join outcomes oon o.SHIP = s.NAMEwhere o.SHIP is nullorder by c.country;select c.country, s.name
from classes c join ships s on c.class=s.class
			   left join outcomes o on s.name=o.ship
where o.ship is NULL
order by c.country;