select 
	json_agg( json_build_object(
	  'user', comments.user_id,
	  'comment', comments.content
	))
from comments where comment_parent_id = 1;



create or replace function sayHello( user_name varchar)
returns varchar
AS
$$
begin
	return 'Hola ' || user_name;
end;
$$
language plpgsql;

select sayHello( users.name ), users.name  from users


-- hacer todo con una funcion ADD


create or REPLACE function comment_replies ( id integer )
RETURNS json
AS
$$
DECLARE result json;


BEGIN

	select 
		json_agg( json_build_object(
			'user', comments.user_id,
			'comment', comments.content
		)) into result
	from comments where comment_parent_id = id;

	return result
END
$$
LANGUAGE plpgsql;


select comment_replies(1)