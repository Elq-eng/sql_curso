
-- clausula name
SELECT * FROM continent where name like '%America%'
UNION
SELECT * FROM continent where code in ( 3, 5)  ORDER BY name ASC;



SELECT a.name, a.continent from country a, continent b where a.continent = b.name order by b.name ASC

SELECT a.name as country  from country a inner JOIN continent b on a.continent = b.code


INSERT INTO continent ("name") VALUES ('Oceania')

alter SEQUENCE continent_code_seq RESTART WITH 10;


-- full outer join 
SELECT a.name as country, a.continent as continentCode, b.name as continentName FROM country a FULL OUTER JOIN continent b on a.continent = b.code;


-- right join exclusividad 
SELECT a.name as country, a.continent as continentCode, b.name as continentName FROM country a RIGHT OUTER JOIN continent b on a.continent = b.code WHERE a.continent IS NULL;

-- AGREGATION CON JOIN


SELECT COUNT(*), b.name from country a INNER JOIN continent b on a.continent = b.code GROUP BY b.name ORDER BY COUNT(*)  ASC;



SELECT COUNT(*) as count, b.name from country a INNER JOIN continent b on a.continent = b.code GROUP BY b.name ORDER BY COUNT(*)  ASC

UNION

SELECT 0 as count, b.name from country a RIGHT JOIN continent b on a.continent = b.code WHERE a.continent is NULL;

-- multiples querys 

SELECT * FROM countrylanguage where isofficial = true;


SELECT * FROM country;

SELECT * FROM continent;

-- mostrar los lenguajes por continentes
SELECT d.name, c.name as continent FROM countrylanguage a 
INNER JOIN country b ON a.countrycode = b.code
INNER JOIN continent c on b.continent = c.code 
INNER JOIN language d on a.languagecode = d.code
where isofficial = true


-- cuantos lenguajes por continentes 

SELECT COUNT(*), continent from (SELECT a.language, c.name as continent FROM countrylanguage a 
INNER JOIN country b ON a.countrycode = b.code
INNER JOIN continent c on b.continent = c.code 
where isofficial = true) as totales 
GROUP BY continent;