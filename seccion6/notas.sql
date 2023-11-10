SELECT DISTINCT continent from country ORDER BY continent ASC;

CREATE table continent (
  code serial NOT NULL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO continent ( name ) SELECT DISTINCT continent from country ORDER BY continent ASC;


select * from country;


#crear respaldo 

CREATE TABLE public.country_bk(
	code bpchar(3) NOT NULL,
	"name" text NOT NULL,
	continent text NOT NULL,
	region text NOT NULL,
	surfacearea float4 NOT NULL,
	indepyear int2 NULL,
	population int4 NOT NULL,
	lifeexpectancy float4 NULL,
	gnp numeric(10, 2) NULL,
	gnpold numeric(10, 2) NULL,
	localname text NOT NULL,
	governmentform text NOT NULL,
	headofstate text NULL,
	capital int4 NULL,
	code2 bpchar(2) NOT NULL,
	CONSTRAINT country_bk_continent_check CHECK (((continent = 'Asia'::text) OR (continent = 'South America'::text) OR (continent = 'North America'::text) OR (continent = 'Oceania'::text) OR (continent = 'Antarctica'::text) OR (continent = 'Africa'::text) OR (continent = 'Europe'::text) OR (continent = 'Central America'::text))),
	CONSTRAINT country_bk_pkey PRIMARY KEY (code),
	CONSTRAINT country_bk_surfacearea_check CHECK ((surfacearea >= (0)::double precision))
);


insert into country_bk ( name,continent,region,surfacearea,indepyear,population,lifeexpectancy,gnp,gnpold,localname,governmentform,headofstate,capital,code2) SELECT * from country


ALTER TABLE country drop constraint country_continent_check;

SELECT a.name, a.continent, ( SELECT b.code, b.name from continent b where b.name=a.continent  ) from country a;




UPDATE country a SET continent = ( SELECT b.code from continent b WHERE b.name = a.continent )


-- modificar una columna

ALTER table country ALTER COLUMN continent TYPE int4 USING continent::integer;


--  crear llave forenea

ALTER TABLE country ADD CONSTRAINT fk_continent_code FOREIGN KEY ( continent ) REFERENCES continent( code )


-- solucion de la tabla
