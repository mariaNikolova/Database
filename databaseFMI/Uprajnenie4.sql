--�������� ������, ����� �� ����� ����, ��-����� �� 120 ������, �������
--��������, ������, ��� � ����� �� ������.select title, YEAR, s.name, s.addressfrom movie m join STUDIO son m.STUDIONAME = s.NAMEwhere m.LENGTH > 120--�������� ������, ����� ������� ����� �� �������� � ������� �� ���������,
--��������� ��� �����, ����������� �� ���� ������, ��������� �� ��� �� ������select distinct m.STUDIONAME, s.STARNAMEfrom movie m join STARSIN son m.TITLE = s.MOVIETITLEorder by m.STUDIONAME
select distinct m.studioname, si.starname
from movie m join starsin si on m.title=si.movietitle and m.year=si.movieyear
order by m.studioname;--�������� ������, ����� ������� ������� �� ������������ �� �������, � ����� �
--����� Harrison Ford.select distinct me.namefrom movie m join STARSIN son m.TITLE = s.MOVIETITLE join MOVIEEXEC meon me.CERT# = m.PRODUCERC#where s.starname = 'Harrison Ford'select distinct me.name
from movie m join starsin s on m.title=s.movietitle and m.year=s.movieyear
			 join movieexec me on m.producerc#=me.cert#
where starname='Harrison Ford';
--�������� ������, ����� ������� ������� �� ���������, ������ ��� ����� ��
--MGM

select ms.name
from MOVIE m join STARSIN s
on m.TITLE = s.MOVIETITLE
JOIN MOVIESTAR ms 
on s.STARNAME = ms.NAME
where m.STUDIONAME = 'MGM' and ms.GENDER = 'F'

--�������� ������, ����� ������� ����� �� ���������� � ������� �� �������,
--����������� �� ���������� �� �Star Wars�.

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


--�������� ������, ����� ������� ������� �� ��������� �� ��������� � ���� ���� ����.select  ms.namefrom moviestar ms left join STARSIN son ms.NAME = s.STARNAMEleft join MOVIE mon m.TITLE = s.MOVIETITLEwhere s.MOVIETITLE is null--. �� ������ �� ����� PC--�������� ������, ����� ������� ������������, ����� � ��� �� ������� �� ����
--�������������, �� ����� ���������� ������� �� �� ������� (���� �� � ���������
--PC, ������ ��� �������).select p.maker, p.model, p.typefrom product p left join pc pcon p.model = pc.modelleft join laptop lon l.model = p.modelleft join printer pron pr.model = p.modelwhere (pc.model is null) and (l.model is null) and (pr.model is null)select p.maker,p.model,p.type
from product p left join pc on p.model=pc.model
			   left join printer pr on p.model=pr.model
			   left join laptop l on p.model=l.model
where pc.code is null and pr.code is null and l.code is null;

--�� ������ �� ����� SHIPS--�������� ������, ����� �� ����� ����� ������� ����� ��, ���������, ����
--������ � �������� �� ������� (launched).select sh.NAME, c.COUNTRY, c.NUMGUNS, sh.LAUNCHEDfrom ships sh join classes con sh.class = c.CLASS--�������� ������, ����� ������� ������� �� ��������, ��������� � ����� �� 1942�.select SHIPfrom OUTCOMES o join BATTLES bon o.BATTLE = b.NAMEwhere b.DATE = '1942-11-15 00:00:00.000'--�� ����� ������ �������� ������� �� ��������, ����� ������ �� �� ��������� � �����select s.NAME, c.COUNTRYfrom classes c join SHIPS son c.CLASS = s.CLASSleft join outcomes oon o.SHIP = s.NAMEwhere o.SHIP is nullorder by c.country;select c.country, s.name
from classes c join ships s on c.class=s.class
			   left join outcomes o on s.name=o.ship
where o.ship is NULL
order by c.country;