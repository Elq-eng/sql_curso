
-- 1. Cuantos usuarios tenemos con cuentas @google.com
-- Tip: count, like
select COUNT(*) from users WHERE email like '%@google.com'

-- 2. De qué países son los usuarios con cuentas de @google.com
-- Tip: distinct

SELECT DISTINCT country from users WHERE email like '%@google.com'


-- 3. Cuantos usuarios hay por país (country)
-- Tip: Group by
SELECT COUNT(*), country from users GROUP BY country

-- 4. Listado de direcciones IP de todos los usuarios de Iceland
-- Campos requeridos first_name, last_name, country, last_connection
SELECT first_name, last_name, country, last_connection FROM users WHERE country LIKE 'Iceland'

-- 5. Cuantos de esos usuarios (query anterior) tiene dirección IP
-- que incia en 112.XXX.XXX.XXX
SELECT first_name, last_name, country, last_connection FROM users WHERE country LIKE 'Iceland' AND last_connection like '112.%'



-- 6. Listado de usuarios de Iceland, tienen dirección IP
-- que inicia en 112 ó 28 ó 188
-- Tip: Agrupar condiciones entre paréntesis 


SELECT first_name, last_name, country, last_connection FROM users WHERE country LIKE 'Iceland' AND ( last_connection like '112.%' or last_connection like '28.%' or  last_connection like '188.%') 


-- 7. Ordene el resultado anterior, por apellido (last_name) ascendente
-- y luego el first_name ascendentemente también

SELECT first_name, last_name, country, last_connection FROM users WHERE country LIKE 'Iceland' AND ( last_connection like '112.%' or last_connection like '28.%' or  last_connection like '188.%')  ORDER BY last_name asc, first_name asc;


-- 8. Listado de personas cuyo país está en este listado
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Ordenar los resultados de por País asc, Primer nombre asc, apellido asc
-- Tip: Investigar IN
-- Tip2: Ver Operadores de Comparación en la hoja de atajos (primera página)


select first_name, country, last_name from users WHERE country IN ( 'Mexico','Honduras','Costa Rica')ORDER BY country asc, first_name asc, last_name asc



-- 9. Del query anterior, cuente cuántas personas hay por país
-- Ordene los resultados por País asc

select count(*) as total, country from users WHERE country IN ( 'Mexico','Honduras','Costa Rica') GROUP BY country