create  table "user"(
	id serial,
	username varchar(50),
	password text,
	last_login timestamp 

);


create extension pgcrypto;

insert into "user" ( username, password )
values ( 'fernando', crypt('123456', gen_salt('bf')));


delete  from "user" where id = 1;

select * from "user"  
	where username = 'fernando' and 
	password =  crypt( '123456', password); 
	

--crear una proceso de almacenamiento que verifique el login
create or replace procedure  user_login( user_name varchar, user_password varchar)

as $$
	
	declare
		was_found boolean;
	begin 
		select count(*) into was_found from "user"  
			where username = user_name  and 
			password =  crypt( user_password, password); 
		
		if ( was_found = false ) then
		
			insert into session_failed ( username, whenSession ) values ( user_name, now());
			commit;
			raise exception 'Usuario y contrasena no son correctos';
		
		end if;
		
		update "user" set last_login = now() where username = user_name;
		commit;
		raise notice 'Usuario encontrado % ', was_found;
	end
$$ language plpgsql;


--llamar el proceso
call user_login('fernando', '123456');


--crear nueva tabla para cuando falla el login
create table session_failed(
	id serial,
	username varchar(50),
	whenSession timestamp
);

create table session (
	id serial,
	user_id int,
	last_login timestamp
)




call user_login('fernando', '123456')

-- trigger
create or replace trigger  create_session_trigger after update on "user"
for each row 
--se pone un when
when (old.last_login is distinct from new.last_login)
execute procedure create_session_log();


-- functiooon
create or replace function create_session_log()
returns trigger as 
$$
	
begin
	insert into "session" (user_id, last_login) values ( new.id, now());
	return new;
end

	
$$
language plpgsql;