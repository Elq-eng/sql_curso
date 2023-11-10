

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa


SELECT count(*) as Total, b.name from country a INNER JOIN continent b on a.continent = b.code WHERE b.name not like '%America%' GROUP BY b.name union SELECT count(*) as Total, 'America' from country a INNER JOIN continent b on a.continent= b.code WHERE b.name like '%America%' ORDER BY Total  asc ;


-- el pais con mas ciudades
-- campos total de ciudades y el nombre del pais
-- usar innert joun

SELECT COUNT(*) as Total, b.name from city a 
INNER JOIN country b ON a.countrycode = b.code
GROUP BY b.name
ORDER BY Total DESC LIMIT 1
