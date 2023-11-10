SELECT date_trunc('week', created_at) as weeks, count(*)  
from posts
GROUP BY weeks
ORDER BY weeks desc




select * from posts where post_id = 1;



SELECT date_trunc('week', posts.created_at) as weeks, count(distinct posts.post_id) as number_of_posts, 
sum( claps.counter ) as total_clap
from posts
inner join claps on claps.post_id= posts.post_id
GROUP BY weeks
ORDER BY weeks desc 


-- #creando vista

create or replace view comments_per_week as 
SELECT date_trunc('week', posts.created_at) as weeks, count(distinct posts.post_id) as number_of_posts, 
sum( claps.counter ) as total_clap
from posts
inner join claps on claps.post_id= posts.post_id
GROUP BY weeks
ORDER BY weeks desc 



drop view comments_per_week



-- vista

create MATERIALIZED view comments_per_week_mat
SELECT date_trunc('week', posts.created_at) as weeks, 
sum(claps.counter) as total_claps,
count(distinct posts.post_id) as number_of_posts, 
count(*) as number_of_claps
from posts
  inner join claps on claps.post_id= posts.post_id
GROUP BY weeks
ORDER BY weeks desc 


REFRESH MATERIALIZED VIEW comments_per_week_mat


select * from comments_per_week

-- cambiar nombre de vista
alter view comments_per_week rename to post_per_week


-- como cambiar las vistas MATERIALIZED
alter MATERIALIZED view comments_per_week_mat rename to post_per_week_mat


-- common table expression - CTE
-- Uso  
-- es para simplificar un query 

with post_week_2024 as ( SELECT date_trunc('week'::text, posts.created_at) AS weeks,
    sum(claps.counter) AS total_claps,
    count(DISTINCT posts.post_id) AS number_of_posts,
    count(*) AS number_of_claps
   FROM posts
     JOIN claps ON claps.post_id = posts.post_id
  GROUP BY (date_trunc('week'::text, posts.created_at))
  ORDER BY (date_trunc('week'::text, posts.created_at)) DESC)
  
select * from post_week_2024 
where weeks BETWEEN '2024-01-01' and '2024-12-31' and total_claps >= 600;



-- multiples Cte
with claps_per_post as (
select post_id, sum(counter) from claps
GROUP BY post_id), post_from_2023 as ( select * from posts where create_at BETWEEN '2023-01-01' and '2023-12-31')


select * from claps_per_post
  where claps_per_post.post_id in ( select post_id from posts_from_2023)

-- cte recursivos ADD

-- siempre esta con la palabra with

with RECURSIVE  countDown( val ) as (
  -- initializacion => primer nivel, o valores iniciales
    select 5 as val
  UNION
  -- QUERYS RECURSIVO
  select val - 1 from countdown where val > 1 
)
-- ELECT DE LOS CAMPOS 
select * from countdown


with RECURSIVE  countDown( val ) as (
  -- initializacion => primer nivel, o valores iniciales
    select 1 as val
  UNION
  -- QUERYS RECURSIVO
  select val + 1 from countdown where val < 9 
)
-- ELECT DE LOS CAMPOS 
select * from countdown


with RECURSIVE multiplication_table(base, val) as (
  select 5 as base, 1 as val, 5 as result
  UNION
  select 5 as base, val + 1, (val+1)* base from multiplication_table
    where val < 10 
)

SELECT * from multiplication_table



create table employees (
  id serial NOT NULL,
  name varchar(50) NULL,
  report_to int4 NULL
)



with RECURSIVE bosses as (
  -- init
    select id,name,report_to from employees where id = 1
    UNION
      select employees.id, employees.name, employees.reports_to from employees
        inner join bosses on  bosses.id = employees.report_to
)

select * from bosses




with RECURSIVE bosses as (
  -- init
      select id,name,report_to, 1 as depth from employees where id = 1
    UNION
      select employees.id, employees.name, employees.report_to, depth + 1 from employees
        inner join bosses on  bosses.id = employees.report_to
      where DEPTH < 10
)

select bosses.*, employees.name from bosses
  LEFT JOIN employees on employees.id = bosses.report_to
  order by depth;





-- ejercicio final

select followers.*, leader.name as leader, follower.name as follower from followers
inner join "user" leader on leader.id = followers.leader_id 
inner join "user" follower on follower.id = followers.follower_id  ;

select follower_id from followers where leader_id = 1;

select * from followers
	where leader_id  in ( select follower_id from followers where leader_id = 1  )
