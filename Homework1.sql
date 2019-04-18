use [labor_sql];
/*TASK 1.1 */
SELECT maker, type
FROM product
ORDER BY maker ASC;

/*TASK 1.2*/

SELECT model, ram, screen, price
FROM laptop
WHERE price>1000
ORDER BY ram ASC, price DESC;

/*TASK 1.3*/

SELECT *
FROM printer
WHERE color = 'y'
ORDER BY price DESC;

/*TASK 1.4 */

SELECT model, speed, hd, cd, price
FROM PC
WHERE (cd= '12x' OR cd= '24x') AND price<600
ORDER BY speed DESC;

/*TASK 1.5*/

SELECT name, class
FROM ships
ORDER BY name ASC;

/*TASK 1.6 */

SELECT *
FROM pc
WHERE speed>=500 AND price<800
ORDER BY price DESC;

/*TASK 1.7 */

SELECT *
FROM printer
WHERE type <>'Matrix' AND price<300
ORDER BY type DESC;

/*TASK 1.8 */

SELECT model, speed
FROM pc
WHERE price BETWEEN 400 AND 600
ORDER BY hd ASC;

/*TASK 1.9 */

SELECT model, speed, hd, price
FROM laptop
WHERE screen >= 12
ORDER BY price DESC;

/*TASK 1.10 */

SELECT model, type, price
FROM printer
WHERE price<300
ORDER BY type DESC;

/*TASK 1.11 */

SELECT model, ram, price
FROM laptop
WHERE ram=64
ORDER BY screen ASC;

/*TASK 1.12 */

SELECT model, ram, price
FROM pc
WHERE ram>64
ORDER BY hd ASC;

/*TASK 1.13 */

SELECT model, speed, price
FROM pc
WHERE speed BETWEEN 500 AND 700
ORDER BY hd DESC;

/*TASK 1.14 */

SELECT *
FROM outcome_o
WHERE out>2000
ORDER BY date DESC;

/*TASK 1.15 */

SELECT *
FROM income_o
WHERE inc BETWEEN 5000 AND 10000
ORDER BY inc ASC;

/*TASK 1.16 */

SELECT *
FROM income
WHERE point=1
ORDER BY inc ASC;

/*TASK 1.17 */

SELECT *
FROM outcome
WHERE point=2
ORDER BY out ASC;

/*TASK 1.18 */

SELECT *
FROM classes
WHERE country='Japan'
ORDER BY type DESC;

/*TASK 1.19 */

SELECT name, launched
FROM ships
WHERE launched BETWEEN 1920 AND 1942
ORDER BY launched DESC;

/*TASK 1.20 */

SELECT ship, battle, result
FROM outcomes
WHERE battle= 'Guadalcanal' AND (result='OK' OR result = 'damaged')
ORDER BY ship DESC;

/*TASK 1.21 */

SELECT ship, battle, result
FROM outcomes
WHERE result='sunk'
ORDER BY ship DESC;

/*TASK 1.22 I believe in labor DB displasement is in kg instead of tones*/

SELECT class, displacement
FROM classes
WHERE displacement>=40000
ORDER BY type ASC;

/*TASK 1.23*/

SELECT trip_no, town_from, town_to
FROM trip
WHERE town_from='London' OR town_to='London'
ORDER BY time_out ASC;

/*TASK 1.24*/

SELECT trip_no, plane, town_from, town_to
FROM trip
WHERE plane='TU-134'
ORDER BY time_out DESC;

/*TASK 1.25*/

SELECT trip_no, plane, town_from, town_to
FROM trip
WHERE plane!='IL-86'
ORDER BY plane ASC;

/*TASK 1.26*/

SELECT trip_no, town_from, town_to
FROM trip
WHERE town_from!='Rostov' AND town_to!='Rostov'
ORDER BY plane ASC;

/*TASK 1.27*/

SELECT model
FROM pc
WHERE model LIKE '%1%1%';

/*TASK 1.28*/
SELECT *
FROM outcome 
WHERE MONTH(date) = 03;

/*TASK 1.29*/

SELECT *
FROM outcome_o
WHERE DAY(date) = 14;

/*TASK 1.30*/

SELECT name
FROM ships
WHERE name LIKE 'W%n';

/*TASK 1.31 exactly 2??????*/

SELECT name
FROM ships
WHERE name LIKE '%e%e%';

/*TASK 1.32*/

SELECT name, launched
FROM ships
WHERE  name NOT LIKE '%a';

/*TASK 1.33*/

SELECT battle
FROM outcomes
WHERE battle LIKE '% %' AND battle NOT LIKE '% %c';

/*TASK 1.34 */

SELECT *
FROM trip
WHERE DATEPART(HOUR, time_out) BETWEEN 12 AND 17;

/*TASK 1.35*/

SELECT *
FROM trip
WHERE DATEPART(HOUR, time_in) BETWEEN 17 AND 23;

/*TASK 1.36 ? */

SELECT *
FROM trip
WHERE (DATEPART(HOUR, time_in) BETWEEN 21 AND 23)
OR 
(DATEPART(HOUR, time_in) BETWEEN 00 AND 10);

/*TASK 1.37*/

SELECT date
FROM pass_in_trip
WHERE place LIKE '1_';

/*TASK 1.38*/

SELECT date,place
FROM pass_in_trip
WHERE place LIKE '_c';

/*TASK 1.39 */

SELECT SUBSTRING(name,CHARINDEX(' ', name) + 1,LEN(name) - CHARINDEX(' ', name)) AS Lastname
FROM passenger
WHERE SUBSTRING(name,CHARINDEX(' ', name) + 1,LEN(name) - CHARINDEX(' ', name)) LIKE 'C%';

/*TASK 1.40*/

SELECT SUBSTRING(name,CHARINDEX(' ', name) + 1,LEN(name) - CHARINDEX(' ', name)) AS Lastname
FROM passenger
WHERE SUBSTRING(name,CHARINDEX(' ', name) + 1,LEN(name) - CHARINDEX(' ', name)) NOT LIKE 'J%';

/*TASK 1.41*/
SELECT * FROM sys.syslanguages
SET LANGUAGE Ukrainian
SELECT AVG(price) as 'average price:'
FROM laptop;

/*TASK 1.42 !!!!!!!*/

SELECT CONCAT('code:', code),
CONCAT('model:', model),
CONCAT('speed:', speed),
CONCAT('ram:', ram),
CONCAT('hd:', hd),
CONCAT('cd:', cd),
CONCAT('price:', price)
FROM pc;

/*TASK 1.43 !!!!!!*/

SELECT CONVERT(varchar, date, 102)
FROM income;

/*TASK 1.44*/



/*TASK 1.45*/

SELECT CONCAT('row:',SUBSTRING(place,1,1) ),
CONCAT('place:',SUBSTRING(place,2,1) )
FROM pass_in_trip;

/*TASK 1.46*/

SELECT CONCAT('from: ',town_from,'to:', town_to)
FROM trip;

/*TASK 1.47 */

SELECT CONCAT (LEFT(trip_no,1), RIGHT(trip_no,1),
LEFT(id_comp,1), RIGHT(id_comp,1),
LEFT(plane,1), RIGHT(RTRIM(plane),1),
LEFT(town_from,1), RIGHT(RTRIM(town_from),1),
LEFT(town_to,1), RIGHT(RTRIM(town_to),1),
LEFT(CONVERT(nvarchar(MAX), time_out,25),1), RIGHT(CONVERT(nvarchar(MAX), time_out,25),1),
LEFT(CONVERT(nvarchar(MAX), time_in,25),1), RIGHT(CONVERT(nvarchar(MAX), time_in,25),1))
FROM trip;

/*TASK 1.48!!!!!!*/

SELECT maker, COUNT(DISTINCT model)
FROM product
GROUP by maker
HAVING COUNT(DISTINCT model)>=2;

/*TASK 1.49*/
SELECT town_from as town, COUNT(trip_no) * 2
from trip
group by town_from;



/*TASK 1.50*/

/*TASK 1.51*/

SELECT COUNT(DISTINCT cd) AS 'amount of distinct cd'
FROM pc;
SELECT cd, COUNT(DISTINCT model) AS 'amount of models '
FROM pc
GROUP BY cd;

/*TASK 1.52 
There are cases in which plane flies either back in time, 
throgh different timezones or not within one day,
which should be a mistake according DB explanation */

SELECT (DATEPART(HOUR, time_in))-(DATEPART(HOUR, time_out))
FROM trip;

/*TASK 1.53*/

SELECT point,date,SUM(out) as sumOfOut,MIN(out) as minOfOut,MAX(out) as maxOfOut
FROM outcome
GROUP BY point,date;

SELECT point,SUM(out) as sumOfOut,MIN(out) as minOfOut,MAX(out) as maxOfOut
FROM outcome
GROUP BY point;

/*TASK 1.54*/

SELECT trip_no,LEFT(place,1) as row,COUNT(RIGHT(place,1)) as numberOfplaces
FROM pass_in_trip
GROUP BY trip_no,LEFT(place,1);

/*TASK 1.55*/

SELECT COUNT(RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name)))
FROM passenger
WHERE LEFT(RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name)),1)='B' OR
LEFT(RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name)),1)='S' OR
LEFT(RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name)),1)='A';

/* 55 to avoid middle names */
--SELECT REVERSE (LEFT(REVERSE(RTRIM(name)),(LEN(name)-CHARINDEX(' ',name))))
--FROM passenger;

--SELECT name, LEN(name) - LEN(REPLACE(name, ' ', '')),
--RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name))
--FROM passenger
--WHERE ((name) - LEN(REPLACE(name, ' ', ''))=1 )AND
--(LEFT(RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name)),1)='B' OR
--LEFT(RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name)),1)='S' OR
--LEFT(RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name)),1)='A');


--SELECT RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name))
--FROM passenger
--WHERE LEFT(RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name)),1)='B' OR
--LEFT(RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name)),1)='S' OR
--LEFT(RIGHT(RTRIM(name),LEN(name) - CHARINDEX(' ', name)),1)='A';




