

-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- bk de la base de datos
CREATE TABLE public.countrylanguage_bk (
	countrycode bpchar(3) NOT NULL,
	"language" text NOT NULL,
	isofficial bool NOT NULL,
	percentage float4 NOT NULL,
	languagecode varchar(3) NULL,
	CONSTRAINT countrylanguage_bk_percentage_check CHECK (((percentage >= (0)::double precision) AND (percentage <= (100)::double precision))),
	CONSTRAINT countrylanguage_bk_pkey PRIMARY KEY (countrycode, language),
	CONSTRAINT countrylanguage_bk_countrycode_fkey FOREIGN KEY (countrycode) REFERENCES public.country(code) ON DELETE CASCADE
);

INSERT INTO countrylanguage_bk	SELECT * from countrylanguage;


-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar
SELECT DISTINCT language FROM countrylanguaje;


-- Actualizar todos los registros en la tabla language y en la tabla countrylanguage
insert into "language" ( "name" ) SELECT DISTINCT language FROM countrylanguage;

UPDATE countrylanguage a set languagecode = (SELECT b.code FROM language b WHERE b.name = a.language);

-- Cambiar tipo de dato en countrylanguage - languagecode por int4
ALTER TABLE countrylanguage ALTER COLUMN languagecode type int4
ALTER TABLE countrylanguage ALTER COLUMN languagecode type int4 using  languagecode::integer;


-- Crear el forening key y constraints de no nulo el language_code

ALTER TABLE public.countrylanguage ALTER COLUMN languagecode SET NOT NULL;

ALTER TABLE countrylanguage ADD CONSTRAINT fk_languagecode_code FOREIGN KEY ( languagecode ) REFERENCES language ( code );

-- Revisar lo creado