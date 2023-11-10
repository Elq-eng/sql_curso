

-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

Select * from "language";



select count(*) as Total,lan.code lan."name"  from countrylanguage conlan 
inner join "language" lan on conlan.languagecode = lan.code
inner join country con on conlan.countrycode = con.code
inner join continent cont on cont.code = con.continent 
where isofficial = true and cont.name  like '%Europe%'
group by lan.code, lan."name"
order by Total desc
limit 1;






-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)

SELECT * FROM country a
INNER JOIN countrylanguage b on a.code = b.countrycode
WHERE a.continent = 5 and b.isofficial = true and b.languagecode = 135






