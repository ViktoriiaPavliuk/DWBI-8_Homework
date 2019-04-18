use [labor_sql];

-- TASK 2.1

SELECT maker, type, speed, hd
FROM pc
INNER JOIN 
product ON pc.model=product.model
WHERE hd<=8;

-- TASK 2.2

SELECT maker
FROM pc
INNER JOIN 
product ON pc.model=product.model
WHERE speed>=600;

-- TASK 2.3

SELECT maker
FROM product
INNER JOIN laptop ON product.model=laptop.model
WHERE speed <=500;

-- TASK 2.4 !!!!!!!!
SELECT DISTINCT  l1.model, l2.model, l1.ram, l1.hd
from laptop as l1
INNER JOIN laptop as l2
on (l1.ram = l2.ram AND l1.hd = l2.hd AND l1.code != l2.code);

-- TASK 2.5 !!!!!!
SELECT DISTINCT c1.country
from classes as c1
INNER JOIN classes as c2
on (c1.country = c2.country AND c1.type != c2.type);

-- TASK 2.6

SELECT maker,product.model
FROM pc
INNER JOIN product ON pc.model=product.model
WHERE price<600;

-- TASK 2.7

SELECT product.model, maker
FROM printer
INNER JOIN product ON printer.model=product.model
WHERE price>300;

-- TASK 2.8 

SELECT product.maker, pc.model, pc.price
from pc
INNER JOIN product on pc.model = product.model
UNION
SELECT product.maker, laptop.model, laptop.price
from laptop
INNER JOIN product on laptop.model = product.model;


-- TASK 2.9
SELECT maker, pc.model, pc.price
from product
INNER JOIN pc on pc.model = product.model;

-- TASK 2.10

SELECT maker,type,laptop.model, speed
FROM laptop
INNER JOIN product
ON laptop.model=product.model
WHERE speed>600;

-- TASK 2.11

SELECT displacement 
FROM classes
INNER JOIN ships
ON classes.class=ships.class;

-- TASK 2.12

SELECT name,date
FROM battles
INNER JOIN outcomes
ON battles.name= outcomes.battle
WHERE result='OK';

-- TASK 2.13

SELECT country, name 
FROM classes 
INNER JOIN ships
ON ships.class=classes.class;

-- TASK 2.14

SELECT name
FROM company
INNER JOIN trip
ON trip.id_comp=company.id_comp
WHERE plane='Boeing';

-- TASK 2.15 

SELECT name, date
FROM pass_in_trip
INNER JOIN passenger
ON passenger.id_psg=pass_in_trip.id_psg;

-- TASK 2.16

SELECT pc.model, speed, hd
FROM pc
INNER JOIN product
ON pc.model=product.model
WHERE (hd=10 OR hd=20) AND maker='A'
ORDER BY speed ASC; 

-- TASK 2.17

SELECT maker, 
[pc], [laptop], [printer] 
FROM Product 
PIVOT 
(COUNT(model) 
FOR type 
IN([pc], [laptop], [printer]) 
) pvt ;

-- TASK 2.18

SELECT [avg_],
[11],[12],[14],[15]
FROM 
( SELECT 'average price ' as 'avg_', screen, price 
FROM laptop
) AS sourcetable
PIVOT 
(AVG(price)
FOR screen
IN ([11],[12],[14],[15])) AS pivottable;

-- TASK 2.19

