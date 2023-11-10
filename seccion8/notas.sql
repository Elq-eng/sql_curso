
SELECT now(), CURRENT_DATE, CURRENT_TIME, date_part('minutes', now());

SELECT * from employees WHERE hire_date > '1998-02-05' order by hire_date desc;

SELECT max(hire_date) as mas_nuevo, min(hire_date) as primer_empleado from employees WHERE hire_date > '1998-02-05' ;


SELECT * from employees WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01' ORDER BY hire_date DESC ;


SELECT max( hire_date ), max( hire_date ) + INTERVAL '1 days' as days, max( hire_date ) + INTERVAL '1 month' as month, max( hire_date ) + INTERVAL '1 year' as year from employees;


SELECT max( hire_date ), max( hire_date ) + INTERVAL '1 years' + INTERVAL '1 day' as years, date_part('year', now()), MAKE_INTERVAL( YEARS := date_part('year', now())::integer ), max( hire_date ) + MAKE_INTERVAL( YEARS:= 23 ) FROM employees;


SELECT
  hire_date,
  MAKE_INTERVAL( YEARS := 2023 - EXTRACT( YEARS from hire_date )::integer ),
  MAKE_INTERVAL( YEARS := date_part('years', CURRENT_DATE)::integer - EXTRACT( YEARS from hire_date )::integer )
  FROM  employees
  ORDER BY hire_date desc



UPDATE "employees" SET "hire_date" = hire_date + INTERVAL '23 years'


SELECT 
  first_name, 
  last_name, 
  hire_date,
  CASE
    when hire_date > now() - INTERVAL '1 year' then 'Rango A'
    when hire_date > now() - INTERVAL '3 year' then 'Rango B'
    else 'Rango D'
  END as rango_antiguedad 
  FROM employees
  ORDER BY hire_date DESC;
  




