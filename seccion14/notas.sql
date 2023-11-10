CREATE OR REPLACE FUNCTION public.greet_employee(employee_name character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
--	declare
begin
	return 'Hola mundo ' || employee_name;
end
$function$
;



select 
	employee_id,
	first_name,
	salary,
	max_salary, 
	max_salary - salary as possible_raise,
	max_raise( employee_id ),
	max_raise2( employee_id )
from employees
inner join jobs on jobs.job_id  = employees.job_id  


-- crear funciones 
create or replace function max_raise( empl_id int) 
returns  numeric(8,2)
as $$
	declare 
		possible_raise numeric(8,2);
	begin
		select 
			max_salary - salary into possible_raise
		from employees
		inner join jobs on jobs.job_id  = employees.job_id  
		where employee_id = empl_id;

		return possible_raise;
	end;
$$ language plpgsql


create or replace function max_raise2( empl_id int) 
returns  numeric(8,2)
as $$
	declare 
		employee_job_id int;
		current_salary numeric(8,2);
	
		job_max_salary numeric(8,2);
		possible_raise numeric(8,2);
	begin
		-- Tomar el puesto de trabajo y el slario		
		select job_id, salary into employee_job_id, current_salary
		from employees where employee_id = empl_id ;
	
		-- Tomar el max salary, acorde a su job
		select max_salary into job_max_salary from jobs where  job_id = employee_job_id;
		
		-- calculos 
		possible_raise = job_max_salary - current_salary;
	
		if ( possible_raise < 0 ) then
			raise exception 'Persona con salario mayor max_salari: %', empl_id;
			--possible_raise = 0;
		end if;
		
		return possible_raise;	
	end;
$$ language plpgsql





create or replace function max_raise3( empl_id int) 
returns  numeric(8,2)
as $$
	declare 
		select_employee employees%rowtype;
		select_job jobs%rowtype;	
	
		possible_raise numeric(8,2);
	begin
		-- Tomar el puesto de trabajo y el slario		
		select * from employees into selected_employee  where employee_id = empl_id ;
	
		-- Tomar el max salary, acorde a su job
		select * from jobs into selected_job where  job_id = selected_employee.job_id;
		
		-- calculos 
		possible_raise = selected_job.max_salary - selected_employee.salary ;
	
		if ( possible_raise < 0 ) then
			raise exception 'Persona con salario mayor max_salari: %', selected_employee.first_name;
			--possible_raise = 0;
		end if;
		
		return possible_raise;	
	end;
$$ language plpgsql






select max_raise(206)