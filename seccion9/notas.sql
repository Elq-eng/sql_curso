
-- SERRIALLLLLLL

create table "users" (
  "user_id" SERIAL PRIMARY KEY,
  "username"  VARCHAR
)

-- IDENTITY
create table "users2" (
  "user_id" INTEGER GENERATED by DEFAULT AS IDENTITY PRIMARY KEY,
  "username"  VARCHAR
)


-- OBLIGA AL USUARIO NO ENVIAR EL ID
create table "users3" (
  "user_id" INTEGER GENERATED ALWAYS IDENTITY PRIMARY KEY,
  "username"  VARCHAR
)



create table "users3" (
  "user_id" INTEGER GENERATED ALWAYS IDENTITY (START WITH 100 INCREMENT BY 2) PRIMARY KEY,
  "username"  VARCHAR
)


-- primary compuesta donde la combinacion es unica e irrepetible
create table userDual (
  id1 int,
  id2 int,
  PRIMARY key (id1, id2)
)

-- uuids para generar ids unicos ADD


SELECT gen_random_uuid()

-- si noe sta instalado entonces hacer esto
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

SELECT gen_random_uuid(), uuid_generate_v4()

DROP EXTENSION "uuid-ossp"


CREATE TABLE users5 (
  "user_id" UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  "username" VARCHAR
)

-- secuencias 

DROP SECUENCE user_secuences;


CREATE SEQUENCE user_secuences;


select nextval('user_secuences');

select currval('user_secuences'), nextval('user_secuences')


CREATE TABLE user6 (
  "user_id" INTEGER PRIMARY KEY default nextval('user_secuences'),
  "username" VARCHAR
)