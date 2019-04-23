use [labor_sql]
go
 
 /*TASK 3.3*/

WITH regions_of_level1 (region_id,id,name,PlaceLevel)
 as
(SELECT region_id,id ,name, PlaceLevel=1
FROM  geography
WHERE region_id=1
) 

SELECT * FROM regions_of_level1;

 /*TASK 3.4*/
 
 WITH region_tree (region_id, place_id, name, PlaceLevel)
 AS
 (SELECT region_id, id, name, PlaceLevel=-1
 FROM geography
 WHERE name='Ivano-Frankivsk'
 UNION ALL
 SELECT geography.region_id, geography.id, geography.name, region_tree.PlaceLevel+1
 FROM geography INNER JOIN region_tree
 ON geography.region_id=region_tree.place_id
 )
 SELECT region_id, place_id, name, PlaceLevel
 FROM region_tree
 WHERE PlaceLevel>=0;

 /*TASK 3.5*/

 WITH numbers(a) AS
(
 SELECT 1
 UNION ALL
 SELECT a+1 FROM numbers WHERE a < 10000
)
SELECT * FROM numbers
option(maxrecursion 10000);

 /*TASK 3.6*/

 WITH numbers(a) AS
(
 SELECT 1
 UNION ALL
 SELECT a+1 FROM numbers WHERE a < 100000
)
SELECT * FROM numbers
option( MAXRECURSION 0);

 /*TASK 3.7*/

 WITH ShowDays (D, name)
 AS
 ( 
 SELECT cast ('20190101' as date) as D, datename(WEEKDAY, '20190101')
 UNION ALL 
 SELECT dateadd (day, 1, D), datename (WEEKDAY, dateadd (day,1, D))
 FROM ShowDays
 WHERE D<'20191231'),


 ShowWeekends AS
  (
  SELECT D, name
  FROM ShowDays
  WHERE name in ('Saturday', 'Sunday')
  )

  SELECT COUNT(*) 
  FROM ShowWeekends
  option( MAXRECURSION 365);

/*TASK 3.8 */

SELECT maker
FROM product
WHERE type in('pc','laptop')
EXCEPT
SELECT maker
FROM product
WHERE type ='laptop';

/*TASK 3.9 */

SELECT DISTINCT maker
FROM product
WHERE type='pc' and maker <> ALL
(SELECT maker
FROM product
WHERE type='laptop' );


/*TASK 3.11 */

SELECT DISTINCT maker
FROM product 
WHERE type IN ('laptop', 'pc');

/*TASK 3.12 */  

SELECT DISTINCT maker
FROM product
WHERE type = 'pc' and not(maker <> ALL
(SELECT maker
FROM product
WHERE type='laptop' ));

/*TASK 3.13 */
  
SELECT DISTINCT maker
FROM product
WHERE type = 'pc' and maker = ANY
(SELECT maker
FROM product
WHERE type='laptop' );

/*TASK 3.14 */


 
/*TASK 3.15 */

SELECT country, class
FROM classes
WHERE country <> ALL
(SELECT country
FROM classes
WHERE country = 'Ukraine' );

--OR

IF  EXISTS 
 (SELECT country, class FROM classes WHERE country = 'Ukraine')
   BEGIN 
     SELECT country, class
     FROM classes
      WHERE country = 'Ukraine'
    END
ELSE
   BEGIN
     SELECT country, class
     FROM classes
   END


/*TASK 3.16 */


/*TASK 3.17 */

SELECT distinct maker
FROM Product 
Where Type='PC' AND maker not in 
(SELECT maker FROM Product WHERE NOT EXISTS 
(Select*FROM PC WHERE PC.model=Product.model) AND type= 'PC');

/*TASK 3.18 */

SELECT DISTINCT maker
FROM Product p1
WHERE type = 'Printer' AND EXISTS
(SELECT * FROM PC WHERE speed  = (SELECT MAX(speed) FROM PC WHERE model IN (SELECT model FROM  Product WHERE maker = p1.maker)));

/*TASK 3.19*/



/* TASK 3.20 */

SELECT model, price
from printer
where price = (select max(price) from printer);

/* TASK 3.21 */

select 'laptop' as type, model, speed
from laptop
where speed < (select min(speed) from pc);

/* TASK 3.22 */

select maker
from product
inner join printer on printer.model = product.model
where price = (select min(price) from printer where color = 'y') AND color = 'y';

/* TASK 3.29 */

select maker, product.model, type, price
from product
inner join (select model, price from pc
			union select model, price from laptop
			union select model, price from printer) as devices
on product.model = devices.model
where maker = 'B';