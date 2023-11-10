
-- poner llave primaria
SELECT * from country;
SELECT * from country where code = 'CRI';

DELETE FROM country  WHERE code2 = 'NA';

ALTER TABLE country ADD PRIMARY KEY ( code );

ALTER TABLE country ADD CHECK( 
  surfacearea >= 0
)

ALTER TABLE country ADD CHECK(
  (continent = 'Asia') or
  (continent = 'South America') or
  (continent = 'North America') or
  (continent = 'Oceania') or
  (continent = 'Africa') or
  (continent = 'Europe') or
  (continent = 'Antarctica') or 
  (continent = 'Center America') or 
)




ALTER TABLE country drop  CONSTRAINT "country_continent_check"


-- indices

-- crear indicies ADD

create UNIQUE INDEX "unique_country_name" on country(
  name
);


CREATE index "country_continent" on country(
  continent
)


CREATE unique INDEX "unique_name_countrycode_district" on city (
  name, countrycode, district
)
CREATE  INDEX "index_district" on city (
  district
)


-- llaves foraneas

ALTER TABLE city ADD CONSTRAINT fk_country_code FOREIGN KEY ( countrycode ) REFERENCES country( code ); -- on delete cascade


ALTER TABLE countrylanguage ADD CONSTRAINT fk_country_code FOREIGN KEY ( countrycode ) REFERENCES country( code ); -- on delete cascade


-- eliminacion en cascada ADD

SELECT * from country where code = 'AFG';
SELECT * FROM city where countrycode ='AFG';
SELECT * from countrylanguage where countrycode = 'AFG';