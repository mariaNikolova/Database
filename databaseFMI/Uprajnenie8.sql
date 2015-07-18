-- Да се добави информация за актрисата Nicole Kidman. За нея знаем само, че е родена на 20-и юни 1967.
use movies
insert into moviestar(name,birthdate) values('Nicole Kidman', '1967-06-20 00:00:00.000')

-- Да се изтрият всички продуценти с печалба (networth) под 10 милиона.
delete from movieexec
where networth > 10000000

-- Да се изтрие информацията за всички филмови звезди, за които не се знае адреса.
delete from moviestar
where address is null

-- Използвайки две INSERT заявки, съхранете в базата данни факта,
-- че персонален компютър модел 1100 е направен от производителя C, 
--има процесор 2400 MHz, RAM 2048 MB, твърд диск 500 GB, 52x DVD устройство и струва $299. 
--Нека новият компютър има код 12. Забележка: моделът и CD са от тип низ.
-- Упътване: самото вмъкване на данни е очевидно как ще стане, помислете в какъв ред е по-логично да са двете заявки.

use pc
insert into product(model,maker,type) values('1100','C', 'pc');
insert into pc(code,model,speed,ram, hd, price,cd) values(12,'1100',2400,2048,500,299,'52x');

-- Да се изтрие всичката налична информация за компютри модел 1100

delete from product
where model='1100'

delete from pc
where model='1100'

---- За всеки персонален компютър се продава и 15-инчов лаптоп със същите параметри, но с $500 по-скъп. 
--Кодът на такъв лаптоп е със 100 по-голям от кода на съответния компютър. Добавете тази информация в базата.

insert into laptop(code,model,speed,ram,hd,price,screen) 
select code+100,model,speed, ram,hd, price+500, 3 from pc

-- Да се изтрият всички лаптопи, направени от производител, който не произвежда принтери.
-- Упътване: Мислете си, че решавате задача от познат тип - "Да се изведат всички лаптопи, ...". 
--Накрая ще е нужна съвсем малка промяна. Ако започнете директно да триете, 
--много е вероятно при някой грешен опит да изтриете всички лаптопи и ще трябва често да възстановявате таблицата или да работите на сляпо.
delete from laptop
where model in (select p.model
				from laptop l join product p
				on l.model = p.model
					where maker not in (select maker from printer p join product pr
										on p.model = pr.model))


-- Производител А купува производител B. На всички продукти на В променете производителя да бъде А.

update product
set maker = 'A'
WHERE maker = 'B'

-- Да се намали два пъти цената на всеки компютър и да се добавят по 20 GB към всеки твърд диск. 
--Упътване: няма нужда от две отделни заявки.

UPDATE PC
SET price = price/2 , HD = HD+20

-- За всеки лаптоп от производител B добавете по един инч към диагонала на екрана.

UPDATE LAPTOP 
SET screen = screen+1
WHERE MODEL = 'B'

-- Два британски бойни кораба от класа Nelson - Nelson и Rodney - са били пуснати на вода едновременно през 1927 г. 
--Имали са девет 16-инчови оръдия (bore) и водоизместимост от 34 000 тона (displacement). 
--Добавете тези факти към базата от данни.

USE SHIPS
INSERT INTO SHIPS(NAME, CLASS, LAUNCHED) VALUES ('Nelson', 'Nelson', 1927)
INSERT INTO SHIPS(NAME, CLASS, LAUNCHED) VALUES ('Rodney', 'Nelson', 1927)

insert into CLASSES(CLASS,TYPE,COUNTRY,NUMGUNS,BORE,DISPLACEMENT) VALUES ('Nelson','bb','Gt.Britain',9,16,34000)

-- Изтрийте от Ships всички кораби, които са потънали в битка.
delete from ships
where name in (select ship
from ships s join outcomes o
on s.name = o.SHIP
where RESULT = 'sunk')

-- Променете данните в релацията Classes така, че калибърът (bore) да се измерва в сантиметри
-- (в момента е в инчове, 1 инч ~ 2.5 см) и водоизместимостта да се измерва в метрични тонове (1 м.т. = 1.1 т.)
update CLASSES
set bore = bore*2.5, DISPLACEMENT = DISPLACEMENT*1.1


-- Изтрийте всички класове, от които има по-малко от три кораба.
delete from CLASSES
where CLASS in
(select c.CLASS
from classes c join SHIPS s
on c.CLASS = s.CLASS
group by c.class
having count(s.name) < 3)

-- Променете калибъра на оръдията и водоизместимостта на класа Iowa, така че да са същите като тези на класа Bismarck.
update classes
set bore = (select bore from CLASSES where CLASS = 'Bismarck'), 
	DISPLACEMENT = (select DISPLACEMENT from classes where class = 'Bismarck')
where CLASS = 'Iowa'