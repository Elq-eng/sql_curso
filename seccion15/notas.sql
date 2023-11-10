create or replace function country_region()
returns table ( id character(2), name varchar(40), region varchar(25) )
as $$
begin 
	return query
	select country_id, country_name, region_name from countries 
	inner join regions on countries.region_id = regions.region_id;
end;
$$
language plpgsql;






create or replace procedure  insert_region_proc ( int, varchar)
as $$
begin 
	
	insert into regions( region_id, region_name)
	values( $1,$2 );
	
	raise notice 'Variable 1: %, ', $1;
	--revertir la accion
	--	rollback;
	-- aceptar que funcione	
	commit;
end

$$ language plpgsql;

call insert_region_proc( 5, 'Central America' );

select * from regions;





select * from country_region()





create or replace procedure controlled_raise ( percentage numeric )
as $$
	declare
		real_percentage numeric(8,2);
		total_employees int;
		
	begin 
		real_percentage = percentage / 100;
--		mantener el historico
		insert into raise_history ( date, employee_id, base_salary, amount, percentage)
		select 
			current_date as "date",
			employee_id,
			salary,
			max_raise( employee_id ) * real_percentage as amount ,
			percentage
		from employees;
		--	IMPACTAR LA TABLE
		update employees 
			set salary = (max_raise( employee_id ) * real_percentage) + salary;
			
		commit;
		
		select count(*) into total_employees from employees;
		
		raise notice 'Afectados % empleados ', total_employees;
	end;
	
$$ language plpgsql;


call controlled_raise(1);  

select * from employees;
select * from raise_history;