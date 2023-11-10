-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XXX

-- orden de las secuencias
select DISTINCT
WHERE
GROUP BY
HAVING
ORDER BY


SELECT first_name,last_name, last_connection FROM users WHERE last_connection LIKE '221%';

-- Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas

SELECT first_name, last_name, followers FROM users WHERE follower > 4600;


SELECT first_name, last_name, followers  FROM users WHERE followers > 4600 AND followers < 4700 ORDER BY id asc;

SELECT first_name, last_name, followers  FROM users WHERE followers between 4600 AND 4700 ORDER BY id asc;


SELECT COUNT(*) FROm users;

SELECT COUNT(*) as total_user, MIN( followers ) as min_followers FROM users;

SELECT COUNT(*) as total_user, MIN( followers ) as min_followers, MAX( followers ) as max_followers FROM users;

SELECT COUNT(*) as total_user, MIN( followers ) as min_followers, MAX( followers ) as max_followers, ROUND(AVG( followers )) as avg_followers, SUM( followers ) / COUNT(*) as total_users  FROM users;


SELECT first_name, last_name, followers from users WHERE followers  = 4 or followers = 4999;

SELECT count(*), followers from users WHERE followers  = 4 or followers = 4999 GROUP BY followers


-- having

select * from users

select COUNT(*), country from users GROUP BY country HAVING COUNT(*) >  ORDER BY COUNT(*) desc;


-- distinct

select * from users

SELECT DISTINCT country from users;


-- group by con otras funciones
select email, trim(SUBSTRING(email, POSITION('@' in email)+1)) as domain from users



select count(*), trim(SUBSTRING(email, POSITION('@' in email)+1)) as domain from users GROUP BY SUBSTRING(email, POSITION('@' in email)+1) having COUNT(*) > 1


-- subquerys

-- se pueden poner en cualquier lugar



SELECT * from 
( select count(*), trim(SUBSTRING(email, POSITION('@' in email)+1)) as domain, 'Fernando' as name, 37 as age from users GROUP BY SUBSTRING(email, POSITION('@' in email)+1) having COUNT(*) > 1) as email_domain











