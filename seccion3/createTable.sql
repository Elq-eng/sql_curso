
CREATE TABLE users(
  name VARCHAR(10) UNIQUE
);

INSERT INTO "users" ("name") VALUES ('mauricio')

UPDATE "users" SET "name" = 'Papajhons' WHERE "name" = 'mauricio';

SELECT * FROM users limit 2 OFFSET 2;

SELECT * FROM users WHERE name LIKE 'Pa%'

DELETE  FROM users WHERE name LIKE '%ns'


-- eliminar TABLESPACE

DROP TABLE users;

-- limpia la tabla
TRUNCATE TABLE users

-- STRINGS

SELECT id, UPPER(name) as upper_name from users  ;
SELECT id, UPPER(name) as upper_name, LOWER(name) as lower_case  from users;

SELECT id, UPPER(name) as upper_name, LOWER(name) as lower_case, LENGTH(name)  from users;

SELECT id, UPPER(name) as upper_name, LOWER(name) as lower_case, LENGTH(name), CONCAT('*',id, ' ', name) from users

SELECT id, UPPER(name) as upper_name, LOWER(name) as lower_case, LENGTH(name), CONCAT('*',id, ' ', name) from users

-- eliminar espacios de una columnaselect * from users;

SELECT name, SUBSTRING( name, 0, 5), position  from users;

SELECT name, SUBSTRING( name, 0, 5), POSITION( ' ' in name) from users;
SELECT name, SUBSTRING( name, 0, (POSITION( ' ' in name ))) as firts_name from users;

SELECT name, SUBSTRING( name, 0, (POSITION( ' ' in name ))) as firts_name, trim(SUBSTRING( name,  (POSITION( ' ' in name )) )) as last_name from users;

UPDATE users SET first_name= SUBSTRING( name, 0, (POSITION( ' ' in name ))), last_name=trim(SUBSTRING( name,  (POSITION( ' ' in name )) ))