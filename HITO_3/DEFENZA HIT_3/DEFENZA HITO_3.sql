CREATE DATABASE HITO_3;
USE HITO_3;


CREATE FUNCTION cualquien_nombre_para_llamar_a_una_funcion



CREATE OR REPLACE FUNCTION EJEMPLO_CONCAT(cadena text, cadena2 text,cadena3 text)
returns text
begin
    return (CONCAT(cadena,cadena2,cadena3));
end;

select EJEMPLO_CONCAT('EVER','TICONA','HUALLPA') AS CONCAT ;


CREATE OR REPLACE FUNCTION EJEMPLO_SUBSTRING(cadena TEXT)
    RETURNS TEXT
    BEGIN
        RETURN (SUBSTRING(cadena,1,4));
    end;
SELECT EJEMPLO_SUBSTRING('EVER TICONA HUALLPA');

CREATE OR REPLACE FUNCTION consulta(cadena1 text,cadena2 text,cadena3 text)
    returns text
    begin
        if STRCMP(cadena1,cadena2) = 0 OR STRCMP(cadena1,cadena3) = 0
        then
            return 'cadenas iguales';
        else
            return 'cadenas diferentes';
        end if;
    end;

select consulta('DBA III','DBA I','DBA III');

CREATE OR REPLACE FUNCTION pregunta(p1 text,p2 text)
    returns text
    begin
        declare position text default '';
        declare con text default CONCAT(p1,' ',p2);
        declare car int default CHAR_LENGTH(con);
        set position = CONCAT('Posicion:',locate(p1,p2),' N de datos: ',car);
        return position;
    end;
select pregunta('II','Base de datos II');


CREATE TABLE estudiante(
	id_estudiante INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombres VARCHAR(50) NOT NULL,
	apellidos VARCHAR(50) NOT NULL,
	edad INTEGER NOT NULL,
	fono INTEGER NOT NULL,
	email VARCHAR(100) NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	genero VARCHAR(10) NOT NULL
);

CREATE TABLE materias(
    id_mate INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre_materia VARCHAR(100) NOT NULL,
    codigo_materia VARCHAR(100) NOT NULL
);

CREATE TABLE inscripcion(
    id_inscrpcion INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    semestre VARCHAR(20) NOT NULL,
    gestion INTEGER NOT NULL,
    id_mate INTEGER NOT NULL,
    id_estudiante INTEGER NOT NULL,
    FOREIGN KEY (id_mate) REFERENCES materias (id_mate),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante (id_estudiante)

);

INSERT INTO estudiante (nombres,apellidos,edad,fono,email,direccion,genero,id_estudiante)
                VALUES ('Miguel',' Gonzales Veliz',20,2831115,'miguel@gmail.com','Av. 6 de agosto','masculino',1),
                       ('Sandra','Mavir Uria',25,2832116,'sandra@gmail.com','Av. 6 de agosto','femeino',2),
                       ('joel','Adubiri Mondar',30,2832117,'joel@gmail.com','Av. 6 de agosto','masculino',3),
                       ('Andrea','Arias Bellasteros',21,2832118,'andrea@gmail.com','Av. 6 de agosto','femenino',4),
                       ('Santos','Montes Valenzuela',24,2832119,'santos@gmail.com','Av. 6 de agosto','masculino',5);

INSERT INTO materias (nombre_materia, codigo_materia)
              VALUES ('Introduccion a la arquitectura','ARQ-101'),
                     ('Urbanismo y Diseño','ARQ-102'),
                     ('Dibujo y Pintura Arquitectonico','ARQ-103'),
                     ('Matematica discreta','ARQ-104'),
                     ('Fisica Basica','ARQ-104');

INSERT INTO inscripcion (semestre, gestion, id_mate, id_estudiante)
                 VALUES ('1er semestre',2018,1,1),
                        ('2do semestre',2018,2,1),
                        ('1er semestre',2019,4,2),
                        ('2do semestre',2019,3,2),
                        ('2do semestre',2020,3,3),
                        ('3er semestre',2020,1,3),
                        ('4to semestre',2021,4,4),
                        ('5to semestre',2021,5,5);


CREATE OR REPLACE FUNCTION FIBONACCI(LIMT INT)
RETURNS text
BEGIN
    DECLARE A INT DEFAULT 0;
    DECLARE B INT DEFAULT 1;
    DECLARE i int DEFAULT 0;
    DECLARE siguiente INT DEFAULT 0;
    DECLARE respuesta TEXT DEFAULT '';
    while i <= LIMT DO
        SET i=i+1;
        if i <= 1
            then
                set siguiente = i;
            else
            set siguiente=A+B;
            set A=B;
            SET B=siguiente;
        end if;
        set respuesta= concat(respuesta,siguiente,',');
        end while ;
    return respuesta;
 END;
SELECT FIBONACCI(7);




SET @USER='Ever';

CREATE FUNCTION VARIABLE_GLOBAL()
RETURNS TEXT
BEGIN
    RETURN @USER;
end;

SELECT VARIABLE_GLOBAL() AS USER;


SET @LIMT=7;

CREATE OR REPLACE FUNCTION FIBONACCI_GOBAL()
RETURNS TEXT
BEGIN
    DECLARE A INT DEFAULT 0;
    DECLARE B INT DEFAULT 1;
    DECLARE i INT DEFAULT 0;
    DECLARE siguiente INT DEFAULT 0;
    DECLARE respuesta TEXT DEFAULT '';
    WHILE i <= @LIMT DO
        SET i=i+1;
        IF i <= 1
            THEN
                SET siguiente = i;
            ELSE
            SET siguiente=A+B;
            SET A=B;
            SET B=siguiente;
        END IF;
        SET respuesta= concat(respuesta,siguiente,' , ');

        END WHILE ;
    RETURN respuesta;
 END;

 SELECT FIBONACCI_GOBAL() AS ADMIN;

CREATE OR REPLACE  FUNCTION  MIN_EDAD()
RETURNS INT
BEGIN
    RETURN
        (
            SELECT MIN(edad)
            FROM estudiante AS ES

            );
end;
SELECT MIN_EDAD();

CREATE OR REPLACE FUNCTION SERIE_EDAD(X INT)
RETURNS TEXT
BEGIN
    DECLARE A TEXT DEFAULT '';
    REPEAT
     IF X % 2=0
         THEN
         SET A=CONCAT(' , ',X,A);
         SET X=X-2;
         ELSE IF X%2=1
         THEN
             SET A= CONCAT(A,X,' , ');
              SET X=X-2;
         end if;
        end if;
until X <=0
    end repeat;
    RETURN A;
end;

SELECT SERIE_EDAD(MIN_EDAD()) AS PAR ;

SELECT SERIE_EDAD(23) AS INPAR;


CREATE OR REPLACE FUNCTION  separandovocales(par1 text)
RETURNS TEXT
BEGIN
    DECLARE x INT DEFAULT 1;
    DECLARE response TEXT DEFAULT '';
    DECLARE letra CHAR DEFAULT '';
    DECLARE limite INT DEFAULT char_length(par1);
    DECLARE a INT DEFAULT 0;
    DECLARE e INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    DECLARE o INT DEFAULT 0;
    DECLARE u INT DEFAULT 0;
    WHILE x <= limite DO
        SET letra = substring(par1, x, 1);
        IF letra = 'a'
          THEN
          SET a = a + 1;
        ELSE IF letra = 'e'
          THEN
          SET e = e +1;
        ELSE IF letra = 'i'
          THEN
          SET i = i +1;
        ELSE IF letra = 'o'
          THEN
          SET  o = o +1;
        ELSE IF letra = 'u'
             THEN
             SET u = u + 1;
        END IF;
        END IF;
        END IF;
        END IF;
        END IF;
        SET x = x + 1;
    END WHILE;
    SET response = concat('A: ', a, ' ,E: ', e,' ,I:', i, ' ,O: ', O, ' , U: ', u);
    RETURN response;
END;

SELECT separandovocales('taller de base de datos') as SEPARA_VOCALES;

create or replace function TIPO_DE_USUARIO(parametro int)
returns text
begin
    declare credit_number int default 0;
    declare respuesta text default '';
    set credit_number = parametro;
    case
        when credit_number > 50000 then set respuesta = 'PLATINIUM';
        when credit_number >= 10000 and credit_number <=50000 then set respuesta = 'GOLD';
        when credit_number < 10000 then set respuesta = 'SILVER';
        else set respuesta = 'USUARIO NO IDENTIFICADO';
    end case;
    return respuesta;
end;

select TIPO_DE_USUARIO(5000) AS VERIFICAR_TIPO_DE_USUARIO;


CREATE OR REPLACE FUNCTION descomponer(x TEXT)
RETURNS TEXT
begin
    DECLARE str TEXT default '';
    DECLARE legth_concat int default char_length(x);
    DECLARE limite int default 1;
    DECLARE sub int default legth_concat;

    repeat
        if legth_concat >= limite
        then
            set str = concat(str, substr(x, legth_concat, sub - 1), ' , ');
            set legth_concat = legth_concat -1;
        end if;
      until legth_concat <= 0
    end repeat;
    return str;
end;

select descomponer('BBAII');