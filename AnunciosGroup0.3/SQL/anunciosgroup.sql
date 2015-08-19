-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 21-07-2015 a las 16:48:35
-- Versión del servidor: 5.5.41-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `anunciosgroup`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPACTUALIZAANUNCIANTE`(IN in_id_comuna int(10), IN in_nombre_anunciante varchar(100), IN in_direccion_anunciante varchar(100), IN in_password_anunciante varchar(100), IN in_nombre_u_anunciante varchar(100), IN in_email_anunciante varchar (45))
BEGIN

update anunciante set id_comuna = in_id_comuna,
                    nombre_anunciante= in_nombre_anunciante,
                    direccion_anunciante= in_direccion_anunciante,
                    password_anunciante = in_password_anunciante,
                    email_anunciante = in_email_anunciante
                    where nombre_u_anunciante= in_nombre_u_anunciante;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPACTUALIZAANUNCIANTEGIRO`(IN in_codigo_giro int, IN in_nombre_u_anunciante varchar(100))
BEGIN
update anunciante_giro set codigo_giro = in_codigo_giro
 where nombre_u_anunciante = in_nombre_u_anunciante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPACTUALIZAANUNCIO`(IN `in_codigo_anuncio` INT, IN `in_nombre_anuncio` VARCHAR(100), IN `in_descripcion_anuncio` VARCHAR(2000), IN `in_id_categoria` INT, IN `in_id_segmento_sexo` INT, IN `in_id_segmento_edad` INT, IN `in_cantidad_cupones` INT, IN `in_porcentaje_descuento` INT)
BEGIN
update anuncio set 
nombre_anuncio = in_nombre_anuncio,
descripcion_anuncio = in_descripcion_anuncio,
id_categoria = in_id_categoria,
id_segmento_sexo = in_id_segmento_sexo,
id_segmento_edad = in_id_segmento_edad,
cantidad_cupones = in_cantidad_cupones,
porcentaje_descuento = in_porcentaje_descuento
where codigo_anuncio = in_codigo_anuncio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPACTUALIZAIMAGENANUNCIO`(IN in_archivo varchar(900), IN in_cod_anuncio int)
BEGIN
update anuncio set imagen_anuncio = in_archivo
where codigo_anuncio = in_cod_anuncio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPACTUALIZAVALORANUNCIO`(IN in_codigo_anuncio int, IN in_valor_real int)
BEGIN
update valor_anuncio set valor_real = in_valor_real 
where codigo_anuncio = in_codigo_anuncio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPAGREGAANUNCIANTE`(IN in_nombre_u_anunciante varchar(100), IN in_id_comuna int(10), IN in_nombre_anunciante varchar(100), IN in_direccion_anunciante varchar(100), IN in_password_anunciante varchar(100), IN in_email_anunciante varchar(45))
BEGIN
INSERT INTO anunciante( nombre_u_anunciante, id_comuna, nombre_anunciante, direccion_anunciante, password_anunciante, estado_anunciante, email_anunciante) values(in_nombre_u_anunciante, in_id_comuna, in_nombre_anunciante, in_direccion_anunciante, in_password_anunciante, 'F', in_email_anunciante);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPAGREGAANUNCIANTEGIRO`(IN in_cod_giro int, IN in_nombre_u_anunciante varchar(100))
BEGIN
insert into anunciante_giro (codigo_giro, nombre_u_anunciante)
values(in_cod_giro, in_nombre_u_anunciante);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPAGREGAANUNCIO`(IN `in_nombre_u_anunciante` VARCHAR(100), IN `in_nombre_anuncio` VARCHAR(100), IN `in_imagen_anuncio` VARCHAR(100), IN `in_descripcion_anuncio` VARCHAR(4000), IN `in_categoria` INT(2), IN `in_segmento_sexo` INT(2), IN `in_segmento_edad` INT(2), IN `in_cantidad_cupones` INT(3), IN `in_porcentaje_descuento` INT(2))
BEGIN
insert into anuncio (nombre_u_anunciante, nombre_anuncio, imagen_anuncio, descripcion_anuncio,
                    fecha_creacion_anuncio, estado_anuncio, id_categoria, id_segmento_sexo, id_segmento_edad,
                    cantidad_cupones, porcentaje_descuento) values (
                    in_nombre_u_anunciante,
                    in_nombre_anuncio,
                    in_imagen_anuncio,
                    in_descripcion_anuncio,
                    now(),
                    'F',
                    in_categoria,
                    in_segmento_sexo,
                    in_segmento_edad,
                    in_cantidad_cupones,
                    in_porcentaje_descuento);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPAGREGAVALORANUNCIO`(IN in_codigo_anuncio int, IN in_valor_real int)
BEGIN
insert into valor_anuncio (codigo_anuncio, valor_real) values (in_codigo_anuncio, in_valor_real);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCAANUNCIANTEGIRO`(IN in_nombre_u_anunciante varchar(100))
BEGIN
select * from anunciante_giro where nombre_u_anunciante = in_nombre_u_anunciante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCAANUNCIOPORID`(IN in_codigo_anuncio int)
BEGIN
select * from anuncio
where codigo_anuncio = in_codigo_anuncio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCACANTIDADCOMPARTIR`(IN in_codigo_anuncio int)
BEGIN
 select count(*) from coin where codigo_anuncio = in_codigo_anuncio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCACOMUNA`(IN in_id_comuna int(10))
BEGIN
select id_comuna, nombre_comuna, id_provincia from comuna where id_comuna = in_id_comuna;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCAGIRO`(IN in_codigo_giro int)
BEGIN
 select * from giro where codigo_giro = in_codigo_giro;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCAGIROCABECERA`(IN in_id_giro_cabecera int)
BEGIN
select * from giro_cabecera where id_giro_cabecera = in_id_giro_cabecera;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCAGIRODETALLE`(IN in_cod_giro_detalle int)
BEGIN
select * from giro_detalle where id_giro_detalle = in_cod_giro_detalle;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCAIDANUNCIO`(IN in_nombre_anuncio varchar(100))
BEGIN
select codigo_anuncio from anuncio where nombre_anuncio = in_nombre_anuncio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCAMENSAJESPORANUNCIANTE`(IN in_nombre_u_anunciante varchar(100))
BEGIN
select * from mensaje where para = in_nombre_u_anunciante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCAPROVINCIA`(IN in_id_provincia int(10))
BEGIN
SELECT id_provincia, nombre_provincia, region_id FROM provincia WHERE id_provincia = in_id_provincia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCARANUNCIOSPORANUNCIANTE`(IN in_nombre_u_anunciante varchar(100))
BEGIN
select * from anuncio
where nombre_u_anunciante = in_nombre_u_anunciante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCARCATEGORIAS`()
BEGIN
select * from categoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCARCCOMUNAS`(IN in_id_provincia int(10))
BEGIN
select id_comuna, nombre_comuna from comuna where id_provincia = in_id_provincia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCARPROVINCIAS`(IN in_id_region int(10))
BEGIN
    SELECT id_provincia, nombre_provincia FROM provincia WHERE region_id = in_id_region;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCARREGION`(IN in_id_region int(10))
BEGIN
    select * from region where region_id = in_id_region;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCARREGIONES`()
BEGIN
SELECT region_id, nombre_region FROM region;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCARSEGMENTOSEDADES`()
BEGIN
select * from segmento_edad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCARSEGMENTOSEXOS`()
BEGIN
select * from segmento_sexo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCASUMASHARECOINS`(IN `in_codigo_anuncio` INT)
BEGIN
SELECT (CANTIDAD_COMPARTIR + CANTIDAD_EXTRA_COMPARTIR) AS CANTIDAD_SHARECOINS
FROM share_coin 
WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
AND ESTADO = 'L';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPBUSCAVALORANUNCIO`(IN in_cod_anuncio int)
BEGIN
select * from valor_anuncio where codigo_anuncio = in_cod_anuncio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPCANTIDADCUPONESCANJEADOS`(IN in_codigo_anuncio int)
BEGIN
select count(*) from cupon where codigo_anuncio= in_codigo_anuncio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPCONSULTAINGRESOANUNCIANTE`(IN in_nombre_u_anunciante varchar(100))
BEGIN
select nombre_u_anunciante, estado_anunciante from anunciante
where nombre_u_anunciante = in_nombre_u_anunciante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPCONSULTANOMBREANUNCIANTE`(IN in_nombre_u_anunciante varchar(100))
BEGIN
SELECT COUNT(*) FROM anunciante WHERE nombre_u_anunciante = in_nombre_u_anunciante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPCREARMENSAJE`(IN `in_de` VARCHAR(100), IN `in_para` VARCHAR(100), IN `in_asunto` VARCHAR(100), IN `in_mensaje` VARCHAR(100), IN `in_nombre_u_anunciante` VARCHAR(100), IN `in_tipo_remitente` VARCHAR(2))
BEGIN
insert into mensaje(para, de, asunto, mensaje, nombre_u_anunciante, tipo_remitente, estado, fecha)
values(in_para, in_de, in_asunto, in_mensaje, in_nombre_u_anunciante, in_tipo_remitente, 'NL', now() );

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPCREASHARECOINS`(IN `in_codigo_anuncio` INT, IN `in_cantidad_compartir` INT, IN `in_cantidad_extra_compartir` INT, IN `in_id_valor_coin` INT)
BEGIN

	 INSERT INTO share_coin 
     (codigo_anuncio, 
      cantidad_compartir, 		
      cantidad_extra_compartir, 
      id_valor_coin,estado)
      VALUES 
     (in_codigo_anuncio, 
      in_cantidad_compartir, 		
      in_cantidad_extra_compartir, 
      in_id_valor_coin,
      'P');



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPGIRODETALLE`(IN in_id_giro_cabecera int)
BEGIN
select * from giro_detalle
where id_giro_cabecera = in_id_giro_cabecera;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPSGIRO`(in in_id_giro_detalle int)
BEGIN
select * from giro
where ID_GIRO_DETALLE = in_id_giro_detalle;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACEPTAR_SHARECOIN`(IN `IN_CODIGO_ANUNCIO` INT(11), IN `IN_ID_SHARE_COIN` INT(11))
BEGIN

DECLARE EXISTE_SHARECOIN INT(11);
DECLARE COMPARTIR INT(11);
DECLARE COMPARTIR_EXTRA INT(11);
DECLARE ID_SHARE_COIN_IN INT(11);

SELECT COUNT(ID_SHARE_COIN) 
INTO EXISTE_SHARECOIN
FROM share_coin
WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
AND ESTADO = 'L';

IF EXISTE_SHARECOIN > 0 THEN
    
   SELECT ID_SHARE_COIN
   INTO ID_SHARE_COIN_IN
   FROM share_coin
   WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
   AND ESTADO = 'L';

   SELECT CANTIDAD_COMPARTIR, CANTIDAD_EXTRA_COMPARTIR
   INTO COMPARTIR , COMPARTIR_EXTRA
   FROM share_coin
   WHERE ID_SHARE_COIN = IN_ID_SHARE_COIN; 

         UPDATE share_coin
         SET CANTIDAD_COMPARTIR = CANTIDAD_COMPARTIR + COMPARTIR,
         CANTIDAD_EXTRA_COMPARTIR = CANTIDAD_EXTRA_COMPARTIR + COMPARTIR_EXTRA
         WHERE ID_SHARE_COIN = ID_SHARE_COIN_IN;

   UPDATE share_coin 
   SET ESTADO ='A'
   WHERE ID_SHARE_COIN = IN_ID_SHARE_COIN;
ELSE

  UPDATE share_coin
  SET ESTADO = 'L'
  WHERE ID_SHARE_COIN = IN_ID_SHARE_COIN;

END IF;




END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_ESTADO_ANUNCIANTE`(IN in_nombre_u_anunciante VARCHAR(100), IN in_estado_anunciante VARCHAR (2))
BEGIN
update anunciante set estado_anunciante = in_estado_anunciante
where nombre_u_anunciante = in_nombre_u_anunciante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_ESTADO_ANUNCIO`(IN `in_codigo_anuncio` INT(10))
BEGIN
update anuncio set estado_anuncio = 'V'
where codigo_anuncio = in_codigo_anuncio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_PERFIL_DIFUSOR`(IN IN_NOMBRE_U_DIFUSOR VARCHAR(100),IN IN_NOMBRES VARCHAR(100),IN IN_APELLIDO_PATERNO_DIFUSOR VARCHAR(100), IN IN_APELLIDO_MATERNO_DIFUSOR VARCHAR(100), IN IN_EMAIL_DIFUSOR VARCHAR(100))
BEGIN
UPDATE  `difusor` SET 
NOMBRES = IN_NOMBRES,
APELLIDO_PATERNO_DIFUSOR = IN_APELLIDO_PATERNO_DIFUSOR,
APELLIDO_MATERNO_DIFUSOR = IN_APELLIDO_MATERNO_DIFUSOR,
EMAIL_DIFUSOR = IN_EMAIL_DIFUSOR
WHERE NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AGREGAR_ADMINISTRADOR`(
     IN IN_NOMBRE_U_ADMINISTRADOR VARCHAR(100), 
     IN IN_NOMBRE_ADMINISTRADOR VARCHAR(100), 
     IN IN_APELLIDO_PATERNO_ADMINISTRADOR VARCHAR(100), 
     IN IN_APELLIDO_MATERNO_ADMINISTRADOR VARCHAR(100), 
     IN IN_PASSWORD_ADMINISTRADOR VARCHAR(100), 
     IN IN_EMAIL_ADMINISTRADOR VARCHAR(100))
BEGIN
INSERT INTO administrador (NOMBRE_U_ADMINISTRADOR,NOMBRE_ADMINISTRADOR,APELLIDO_PATERNO_ADMINISTRADOR,APELLIDO_MATERNO_ADMINISTRADOR,PASSWORD_ADMINISTRADOR,EMAIL_ADMINISTRADOR)
VALUES (IN_NOMBRE_U_ADMINISTRADOR,IN_NOMBRE_ADMINISTRADOR,IN_APELLIDO_PATERNO_ADMINISTRADOR,IN_APELLIDO_MATERNO_ADMINISTRADOR,IN_PASSWORD_ADMINISTRADOR,IN_EMAIL_ADMINISTRADOR);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AGREGAR_DIFUSOR`(
    IN IN_NOMBRE_U_DIFUSOR VARCHAR(100), 
    IN IN_NOMBRES VARCHAR(100), 
    IN IN_APELLIDO_PATERNO_DIFUSOR VARCHAR(100), 
    IN IN_APELLIDO_MATERNO_DIFUSOR VARCHAR(100), 
    IN IN_PASSWORD_DIFUSOR VARCHAR(100), 
    IN IN_EMAIL_DIFUSOR VARCHAR(100),
    IN IN_ID_SEGMENTO_EDAD INT(1),
    IN IN_ID_SEGMENTO_SEXO INT(1),
    IN IN_ID_AVATAR INT(1))
BEGIN

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AGREGA_COIN`(IN IN_NOMBRE_U_DIFUSOR VARCHAR(100), IN IN_CODIGO_ANUNCIO INT(11))
BEGIN


INSERT INTO coin (FECHA_INICIO,ESTADO_COIN,NOMBRE_U_DIFUSOR,ID_VALOR_COIN,CODIGO_ANUNCIO)
VALUE(SYSDATE(),1,IN_NOMBRE_U_DIFUSOR,2,IN_CODIGO_ANUNCIO);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AGREGA_FAVORITO`(IN IN_CODIGO_ANUNCIO INT(11), IN IN_NOMBRE_U_DIFUSOR VARCHAR(100))
BEGIN

DECLARE IN_ESTADO_FAVORITO INT(11);
DECLARE CONTAR_FAVORITOS INT(11);

SELECT ESTADO_FAVORITO 
INTO IN_ESTADO_FAVORITO
FROM favorito 
WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR;

SELECT COUNT(ID_FAVORITO)
INTO CONTAR_FAVORITOS
FROM favorito 
WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR;


IF CONTAR_FAVORITOS = 0 THEN
    INSERT INTO favorito
      (NOMBRE_U_DIFUSOR,CODIGO_ANUNCIO,ESTADO_FAVORITO,FECHA_MOD)
      VALUES (IN_NOMBRE_U_DIFUSOR,IN_CODIGO_ANUNCIO,1, SYSDATE());
  ELSE
        IF IN_ESTADO_FAVORITO = 1 THEN
                UPDATE favorito
                SET ESTADO_FAVORITO = 0
                WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
                AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR; 
            ELSE
              UPDATE favorito
                SET ESTADO_FAVORITO = 1
                WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
                AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR; 
        END IF;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AGREGA_PUBLICACION`(IN `IN_CODIGO_ANUNCIO` INT(11), IN `IN_NOMBRE_U_DIFUSOR` VARCHAR(100))
BEGIN

DECLARE CONTAR_PUBLICAR INT(11);


SELECT COUNT(ID_PUBLICAR) 
INTO CONTAR_PUBLICAR
FROM publicar 
WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR;


IF CONTAR_PUBLICAR = 0 THEN
      INSERT INTO publicar
        (NOMBRE_U_DIFUSOR,CODIGO_ANUNCIO,FECHA,HORA,ESTADO)
        VALUES (IN_NOMBRE_U_DIFUSOR,IN_CODIGO_ANUNCIO,DATE(NOW()),TIME(NOW())+TIME('03:00:00'),'F');
  ELSE
       UPDATE publicar
          SET FECHA = DATE(NOW()),HORA = TIME(NOW())+TIME('03:00:00'),ESTADO = 'F'
          WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
          AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR;      
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AGREGA_RED_SOCIAL_DIFUSOR`(IN `IN_ID_RED_SOCIAL` INT(11), IN `IN_NOMBRE_U_DIFUSOR` VARCHAR(100), IN `IN_RED_SOCIAL_DIFUSOR` VARCHAR(100), IN `IN_NOMBRE_RED_SOCIAL_DIFUSOR` VARCHAR(100))
BEGIN

INSERT INTO difusor_redsocial_r VALUES(IN_ID_RED_SOCIAL,IN_NOMBRE_U_DIFUSOR,IN_RED_SOCIAL_DIFUSOR,IN_NOMBRE_RED_SOCIAL_DIFUSOR);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_ANUNCIANTE_ADMINISTRADOR`()
BEGIN
SELECT nombre_u_anunciante , id_comuna , nombre_anunciante , direccion_anunciante,ESTADO_ANUNCIANTE FROM anunciante WHERE ESTADO_ANUNCIANTE = 'F';

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_ANUNCIO`(IN `IN_DESDE` INT(11), IN `IN_HASTA` INT(11), IN `IN_NOMBRE_DIFUSOR` VARCHAR(100))
BEGIN
SELECT 
CODIGO_ANUNCIO, 
NOMBRE_U_ANUNCIANTE, 
NOMBRE_ANUNCIO, 
IMAGEN_ANUNCIO, 
DESCRIPCION_ANUNCIO,
IFNULL((SELECT ESTADO_FAVORITO FROM favorito WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO AND NOMBRE_U_DIFUSOR = IN_NOMBRE_DIFUSOR),0)AS ESTADO_FAVORITO,
PORCENTAJE_DESCUENTO,
(SELECT VALOR_REAL FROM valor_anuncio where CODIGO_ANUNCIO = A.CODIGO_ANUNCIO) AS VALOR_REAL,
(SELECT CANTIDAD_COMPARTIR + CANTIDAD_EXTRA_COMPARTIR FROM share_coin WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO AND ESTADO ='L') AS CANTIDAD_COMPARTIR,
CANTIDAD_CUPONES
FROM anuncio A
WHERE ESTADO_ANUNCIO = 'V' 
AND (SELECT CANTIDAD_COMPARTIR + CANTIDAD_EXTRA_COMPARTIR FROM share_coin WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO  AND ESTADO ='L') > 0
LIMIT IN_DESDE, IN_HASTA;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_ANUNCIO_ADMINISTRADOR`()
BEGIN
SELECT codigo_anuncio, 
       nombre_anuncio,  
       imagen_anuncio, 
       descripcion_anuncio,
       estado_anuncio,
       cantidad_cupones,
       porcentaje_descuento,
       (select valor_real from valor_anuncio where codigo_anuncio = a.codigo_anuncio)as valor_real,
       ifnull((select cantidad_compartir + cantidad_extra_compartir from 			share_coin where codigo_anuncio = a.codigo_anuncio and estado 			= 'L'),0) as sharecoin_listos,
        ifnull((select cantidad_compartir + cantidad_extra_compartir from 			share_coin where codigo_anuncio = a.codigo_anuncio and estado 			= 'P'),0) as sharecoin_pendientes,
		nombre_u_anunciante
  FROM anuncio  as a
       WHERE estado_anuncio = 'F';

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_ANUNCIO_ESPECIFICO`(IN `IN_CODIGO_ANUNCIO` INT(11))
BEGIN

SELECT 
CODIGO_ANUNCIO,
NOMBRE_U_ANUNCIANTE,
NOMBRE_ANUNCIO,
IMAGEN_ANUNCIO,
DESCRIPCION_ANUNCIO,
PORCENTAJE_DESCUENTO,
IFNULL((SELECT VALOR_REAL FROM valor_anuncio WHERE CODIGO_ANUNCIO= IN_CODIGO_ANUNCIO),0) AS VALOR_REAL
FROM anuncio
WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_ANUNCIO_FAVORITO`(IN `IN_NOMBRE_U_DIFUSOR` VARCHAR(100))
BEGIN
SELECT CODIGO_ANUNCIO, 
NOMBRE_U_ANUNCIANTE, 
NOMBRE_ANUNCIO, 
IMAGEN_ANUNCIO, 
DESCRIPCION_ANUNCIO,
IFNULL((SELECT ESTADO_FAVORITO FROM favorito WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR),0)AS ESTADO_FAVORITO,
PORCENTAJE_DESCUENTO,
(SELECT VALOR_REAL FROM valor_anuncio where CODIGO_ANUNCIO = A.CODIGO_ANUNCIO) AS VALOR_REAL,
CANTIDAD_CUPONES
FROM anuncio as A WHERE 
CODIGO_ANUNCIO IN (SELECT CODIGO_ANUNCIO FROM favorito WHERE NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR AND ESTADO_FAVORITO = 1)
AND ESTADO_ANUNCIO = 'V'
AND (SELECT CANTIDAD_COMPARTIR + CANTIDAD_EXTRA_COMPARTIR FROM share_coin WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO AND ESTADO ='L') > 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_ANUNCIO_SUGERIDOS`(IN `IN_ID_SEGMENTO_SEXO` INT(1), IN `IN_ID_SEGMENTO_EDAD` INT(1), IN `IN_NOMBRE_U_DIFUSOR` VARCHAR(100))
BEGIN
SELECT 
CODIGO_ANUNCIO, 
NOMBRE_U_ANUNCIANTE, 
NOMBRE_ANUNCIO, 
IMAGEN_ANUNCIO, 
DESCRIPCION_ANUNCIO,
ID_SEGMENTO_SEXO,
ID_SEGMENTO_EDAD,
IFNULL((SELECT ESTADO_FAVORITO FROM favorito WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR),0)AS ESTADO_FAVORITO,
PORCENTAJE_DESCUENTO,
(SELECT VALOR_REAL FROM valor_anuncio where CODIGO_ANUNCIO = A.CODIGO_ANUNCIO) AS VALOR_REAL,
CANTIDAD_CUPONES
FROM anuncio AS A
where id_segmento_sexo IN (IN_ID_SEGMENTO_SEXO,3)
and id_segmento_edad IN (IN_ID_SEGMENTO_EDAD,6)
AND A.ESTADO_ANUNCIO = 'V'
AND (SELECT CANTIDAD_COMPARTIR + CANTIDAD_EXTRA_COMPARTIR FROM share_coin WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO AND ESTADO ='L') > 0
ORDER BY RAND()
LIMIT 3;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_CUPON`(IN `IN_ID_CUPON` INT(11))
BEGIN
SELECT A.ID_CUPON, 
A.NOMBRE_U_DIFUSOR, 
A.CODIGO_ANUNCIO , 
A.DESCUENTO_OBTENIDO, 
A.VALOR_FINAL,
(SELECT IMAGEN_ANUNCIO FROM anuncio WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO) AS IMAGEN_ANUNCIO,
(SELECT NOMBRE_ANUNCIO FROM anuncio WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO) AS NOMBRE_ANUNCIO,
(SELECT DESCRIPCION_ANUNCIO FROM anuncio WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO) AS DESCRIPCION_ANUNCIO
FROM cupon AS A
WHERE A.ID_CUPON = IN_ID_CUPON;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_CUPONES`(IN `IN_NOMBRE_U_DIFUSOR` VARCHAR(100))
BEGIN

SELECT A.ID_CUPON, 
A.NOMBRE_U_DIFUSOR, 
A.CODIGO_ANUNCIO , 
A.DESCUENTO_OBTENIDO, 
A.VALOR_FINAL,
(SELECT IMAGEN_ANUNCIO FROM anuncio WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO) AS IMAGEN_ANUNCIO,
(SELECT NOMBRE_ANUNCIO FROM anuncio WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO) AS DESCRIPCION
FROM cupon AS A
WHERE A.NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR
AND ESTADO = 'P'
ORDER BY FECHA_CREACION_CUPON DESC;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_MENSAJE`(IN `in_tipo_remitente` VARCHAR(300))
BEGIN
select * from mensaje where tipo_remitente = in_tipo_remitente
order by fecha desc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_SHARECOIN_P`()
BEGIN

SELECT ID_SHARE_COIN,
       CODIGO_ANUNCIO,
       CANTIDAD_COMPARTIR,
       CANTIDAD_EXTRA_COMPARTIR,
       (SELECT NOMBRE_U_ANUNCIANTE FROM anuncio WHERE CODIGO_ANUNCIO = A.CODIGO_ANUNCIO )AS NOMBRE_U_ANUNCIANTE
       FROM share_coin AS A
    WHERE ESTADO = 'P'
    ORDER BY ID_SHARE_COIN DESC; 

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCA_ANUNCIANTE_POR_CODIGO_ANUNCIO`(IN `IN_CODIGO_ANUNCIO` INT(11))
BEGIN

SELECT  NOMBRE_ANUNCIANTE,
    (SELECT NOMBRE_COMUNA FROM comuna WHERE ID_COMUNA  = A.ID_COMUNA) AS COMUNA,
        (SELECT NOMBRE_PROVINCIA FROM provincia WHERE ID_PROVINCIA  = (SELECT ID_PROVINCIA FROM comuna WHERE ID_COMUNA = A.ID_COMUNA )) AS PROVINCIA,
        DIRECCION_ANUNCIANTE,
        EMAIL_ANUNCIANTE,
        NOMBRE_U_ANUNCIANTE
        FROM anunciante as A
        WHERE NOMBRE_U_ANUNCIANTE IN(SELECT NOMBRE_U_ANUNCIANTE FROM anuncio WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONTAR_TOTAL_PUNTOS`(IN `IN_NOMBRE_U_DIFUSOR` VARCHAR(100))
BEGIN
SELECT COUNT(ID_COIN) AS TOTAL_COINS FROM coin WHERE ESTADO_COIN = 1 AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_CUPON`(IN `IN_NOMBRE_U_DIFUSOR` VARCHAR(100), IN `IN_CODIGO_ANUNCIO` INT(11), IN `IN_DESCUENTO_OBTENIDO` VARCHAR(2000), IN `IN_VALOR_FINAL` INT(11))
BEGIN

INSERT INTO cupon (
  NOMBRE_U_DIFUSOR, 
  FECHA_CREACION_CUPON, 
  CODIGO_ANUNCIO, 
  DESCUENTO_OBTENIDO, 
  VALOR_FINAL,
  ESTADO)
  VALUES(
  IN_NOMBRE_U_DIFUSOR,
  SYSDATE(),
  IN_CODIGO_ANUNCIO,
  IN_DESCUENTO_OBTENIDO,
  IN_VALOR_FINAL,
  'P'
  );

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DESCONTAR_COIN`(IN `IN_CANTIDAD_COINS` INT(11))
BEGIN

DECLARE CODIGO_COIN INT(11);

DECLARE CURSOR_ID_COIN  CURSOR FOR 
SELECT ID_COIN FROM coin WHERE ESTADO_COIN = 1 ORDER BY FECHA_INICIO LIMIT 0,IN_CANTIDAD_COINS;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET @hecho = TRUE;

OPEN CURSOR_ID_COIN;

loop1: LOOP

FETCH CURSOR_ID_COIN INTO CODIGO_COIN;

IF @hecho THEN
LEAVE loop1;
END IF;

UPDATE coin
SET ESTADO_COIN = 0
WHERE ID_COIN = CODIGO_COIN;


END LOOP loop1;

CLOSE CURSOR_ID_COIN;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DESCONTAR_CUPON`(IN IN_CODIGO_ANUNCIO INT(11))
BEGIN

DECLARE CUPONES INT(10);

SELECT CANTIDAD_CUPONES
INTO CUPONES
FROM anuncio
WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO;

UPDATE anuncio
SET CANTIDAD_CUPONES = CUPONES -1
WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GIROCABECERA`()
BEGIN
select * from giro_cabecera;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GIROS_POR_RUBRO_H_I`()
BEGIN
SELECT * FROM giro where ID_GIRO_DETALLE in (
select id_giro_detalle from giro_detalle where id_giro_cabecera in(select id_giro_cabecera from giro_cabecera
where id_giro_cabecera in(8,9)) );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INICIARSESIONANUNCIANTE`(IN IN_NOMBRE_ANUNCIANTE varchar(100), IN IN_PASSWORD_ANUNCIANTE varchar(100))
BEGIN
SELECT * FROM `anunciante` 
WHERE nombre_u_anunciante = IN_NOMBRE_ANUNCIANTE
AND password_anunciante =  IN_PASSWORD_ANUNCIANTE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INICIAR_SESION_ADMINISTRADOR`(IN IN_NOMBRE_U_ADMINISTRADOR VARCHAR(100), IN IN_PASSWORD_ADMINISTRADOR VARCHAR(100))
BEGIN
SELECT 
CODIGO_ADMINISTRADOR,
NOMBRE_U_ADMINISTRADOR,
NOMBRE_ADMINISTRADOR,
PASSWORD_ADMINISTRADOR,
APELLIDO_PATERNO_ADMINISTRADOR,
APELLIDO_MATERNO_ADMINISTRADOR,
EMAIL_ADMINISTRADOR
FROM administrador  
WHERE NOMBRE_U_ADMINISTRADOR =  IN_NOMBRE_U_ADMINISTRADOR
AND PASSWORD_ADMINISTRADOR = IN_PASSWORD_ADMINISTRADOR;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INICIAR_SESION_DIFUSOR`(IN IN_NOMBRE_U_DIFUSOR VARCHAR(100), IN IN_PASSWORD_DIFUSOR VARCHAR(100))
BEGIN
SELECT 
NOMBRE_U_DIFUSOR,
NOMBRES,
APELLIDO_PATERNO_DIFUSOR,
APELLIDO_MATERNO_DIFUSOR,
EMAIL_DIFUSOR,
(SELECT NOMBRE_AVATAR FROM avatar WHERE ID_AVATAR = A.ID_AVATAR) AS AVATAR,
ID_SEGMENTO_SEXO,
ID_SEGMENTO_EDAD
FROM difusor A 
WHERE NOMBRE_U_DIFUSOR =  IN_NOMBRE_U_DIFUSOR
AND PASSWORD_DIFUSOR = IN_PASSWORD_DIFUSOR;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_QUITAR_SHARE_COIN`(IN `IN_CODIGO_ANUNCIO` INT(11))
BEGIN

DECLARE COMPARTIR INT(10);
DECLARE COMPARTIR_EXTRA INT(10);

SELECT CANTIDAD_COMPARTIR, CANTIDAD_EXTRA_COMPARTIR
INTO COMPARTIR, COMPARTIR_EXTRA 
FROM share_coin WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO;

IF COMPARTIR > 0 THEN
  UPDATE share_coin
  SET CANTIDAD_COMPARTIR = COMPARTIR - 1
  WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO;

ELSE 
  UPDATE share_coin
  SET CANTIDAD_EXTRA_COMPARTIR = COMPARTIR_EXTRA -1
  WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RECHAZAR_ANUNCIO`(IN IN_CODIGO_ANUNCIO INT(11))
BEGIN
update anuncio set estado_anuncio = 'R'
where codigo_anuncio = in_codigo_anuncio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RECHAZAR_SHARECOIN`(IN IN_ID_SHARE_COIN INT(11))
BEGIN

UPDATE share_coin
SET ESTADO = 'R'
WHERE ID_SHARE_COIN = IN_ID_SHARE_COIN;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RESPONDER_MENSAJE`(IN `in_para` VARCHAR(100), IN `in_de` VARCHAR(100), IN `in_asunto` VARCHAR(200), IN `in_mensaje` VARCHAR(100), IN `in_nombre_u_anunciante` VARCHAR(200), IN `in_codigo_administrador` INT(10), IN `in_tipo_remitente` VARCHAR(10), IN `in_estado` VARCHAR(10))
BEGIN
INSERT INTO mensaje (
  MENSAJE,
  TIPO_REMITENTE,
  PARA,
  DE,
  NOMBRE_U_ANUNCIANTE,
  ASUNTO,
  CODIGO_ADMINISTRADOR,
  ESTADO,
  FECHA
  )VALUES(
  in_mensaje,
  in_tipo_remitente,
  in_para,
  in_de,
  in_nombre_u_anunciante,
  in_asunto,
  in_codigo_administrador,
  in_estado,
  now()
  );
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VALIDAR_CUPON`(IN `IN_CODIGO_CUPON` INT(11), IN `IN_NOMBRE_U_ANUNCIANTE` VARCHAR(100), OUT `RESPUESTA` BOOLEAN)
BEGIN

DECLARE EXISTE_CUPON INT(11);

SELECT COUNT(ID_CUPON) 
INTO EXISTE_CUPON
FROM cupon AS A
WHERE ID_CUPON = IN_CODIGO_CUPON
AND CODIGO_ANUNCIO IN (SELECT CODIGO_ANUNCIO FROM anuncio WHERE NOMBRE_U_ANUNCIANTE = IN_NOMBRE_U_ANUNCIANTE AND CODIGO_ANUNCIO = A.CODIGO_ANUNCIO)
AND ESTADO = 'P';


IF EXISTE_CUPON > 0 THEN
  UPDATE cupon
  SET ESTADO = 'V'
  WHERE ID_CUPON = IN_CODIGO_CUPON;

 SET RESPUESTA = TRUE;
 
 ELSE
 
 SET RESPUESTA = FALSE;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VALOR_COIN`()
BEGIN
SELECT VALOR_COIN FROM VALOR_COIN WHERE ID_VALOR_COIN =2;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICA_PUBLICAR`(IN `IN_CODIGO_ANUNCIO` INT(11), IN `IN_NOMBRE_U_DIFUSOR` VARCHAR(100), OUT `OUT_ESTADO_ANUNCIO` VARCHAR(1))
BEGIN

DECLARE IN_FECHA DATE;
DECLARE IN_HORA TIME;
DECLARE CONTAR INT(11);

SELECT FECHA,HORA
INTO IN_FECHA, IN_HORA
FROM publicar 
WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR;



SELECT COUNT(ID_PUBLICAR) 
INTO CONTAR
FROM publicar 
WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR;


IF CONTAR > 0 THEN
      IF IN_FECHA < DATE(NOW()) THEN
        UPDATE publicar set ESTADO = 'V'
               WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
               AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR; 
        ELSE
          IF IN_HORA < TIME(NOW())THEN
                UPDATE publicar set ESTADO = 'V'
               WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
               AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR; 
            ELSE 
              UPDATE publicar set ESTADO = 'F'
               WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
               AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR; 
          END IF;

      END IF;
ELSE
      INSERT INTO publicar
        (NOMBRE_U_DIFUSOR,CODIGO_ANUNCIO,FECHA,HORA,ESTADO)
        VALUES (IN_NOMBRE_U_DIFUSOR,IN_CODIGO_ANUNCIO,DATE(NOW()),TIME(NOW()),'V');
END IF;

SELECT ESTADO
INTO OUT_ESTADO_ANUNCIO
FROM publicar 
WHERE CODIGO_ANUNCIO = IN_CODIGO_ANUNCIO
AND NOMBRE_U_DIFUSOR = IN_NOMBRE_U_DIFUSOR;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE IF NOT EXISTS `administrador` (
  `CODIGO_ADMINISTRADOR` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U_ADMINISTRADOR` varchar(100) DEFAULT NULL,
  `NOMBRE_ADMINISTRADOR` text,
  `PASSWORD_ADMINISTRADOR` varchar(100) DEFAULT NULL,
  `APELLIDO_PATERNO_ADMINISTRADOR` text,
  `APELLIDO_MATERNO_ADMINISTRADOR` text,
  `EMAIL_ADMINISTRADOR` text,
  PRIMARY KEY (`CODIGO_ADMINISTRADOR`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`CODIGO_ADMINISTRADOR`, `NOMBRE_U_ADMINISTRADOR`, `NOMBRE_ADMINISTRADOR`, `PASSWORD_ADMINISTRADOR`, `APELLIDO_PATERNO_ADMINISTRADOR`, `APELLIDO_MATERNO_ADMINISTRADOR`, `EMAIL_ADMINISTRADOR`) VALUES
(1, 'administrador', 'Ruben', '123', 'Quinteros', 'Sepulveda', 'ruben@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador_giro_r`
--

CREATE TABLE IF NOT EXISTS `administrador_giro_r` (
  `CODIGO_GIRO` int(11) NOT NULL,
  `CODIGO_ADMINISTRADOR` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_GIRO`,`CODIGO_ADMINISTRADOR`),
  KEY `FK_ADMINISTRADOR_GIRO_R2` (`CODIGO_ADMINISTRADOR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anunciante`
--

CREATE TABLE IF NOT EXISTS `anunciante` (
  `NOMBRE_U_ANUNCIANTE` varchar(100) NOT NULL,
  `ID_COMUNA` int(11) NOT NULL,
  `NOMBRE_ANUNCIANTE` text,
  `DIRECCION_ANUNCIANTE` text,
  `PASSWORD_ANUNCIANTE` text,
  `ESTADO_ANUNCIANTE` varchar(1) DEFAULT NULL,
  `email_anunciante` varchar(100) NOT NULL,
  PRIMARY KEY (`NOMBRE_U_ANUNCIANTE`),
  KEY `FK_COMUNA_ANUNCIANTE_R` (`ID_COMUNA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `anunciante`
--

INSERT INTO `anunciante` (`NOMBRE_U_ANUNCIANTE`, `ID_COMUNA`, `NOMBRE_ANUNCIANTE`, `DIRECCION_ANUNCIANTE`, `PASSWORD_ANUNCIANTE`, `ESTADO_ANUNCIANTE`, `email_anunciante`) VALUES
('ChelasArtesa', 6205, 'cervezas artesanales don juan ltda', 'los alerces 4321', '123', 'F', 'chelas.artesa@mail.com'),
('comidarapida', 5101, 'Comida Rapida SA', 'los copihues 1324', '123', 'V', 'comida.rapida@comidas.cl'),
('Electricstyle', 13101, 'Textiles novedosos', 'Monedo #5489', '123', 'V', 'electricstyle@gmail.com'),
('Empresa1', 1101, 'empresa1', 'casa empresa 1', '123', 'V', ''),
('Empresa2', 13101, 'Empresa de bebidas', 'El Cipres 344', '123', 'V', 'empresabebidas@gmail.com'),
('Javoru', 13119, 'Calzados Javier', 'Pajaritos #2233', 'javoru', 'V', 'javier@calzados.cl'),
('JuegosRetro', 13101, 'Juegos Retro', 'Alameda #1111', '123', 'V', 'juegos.retro@juegosretro.cl'),
('Kiosko de la Esquina', 13106, 'Kioskos de la esquina SA', 'Las amapolas #123', '123', 'V', 'kioskoDeLaEsquina@kioskos.cl'),
('MascoPet', 13128, 'Mascoteria de Santiago', 'Santa Emilia #6431', '123', 'F', 'mascopet@mascopet.com'),
('MusicaRetro', 14101, 'Musica Retro', 'las casas #12322', '123', 'V', 'musica.retro@mail.com'),
('poleraspro', 3101, 'poleras pro don pedro SA', 'los heroes 323', '123', 'V', 'poleras.pro@mail.com'),
('PornoChile', 5102, 'PornoChile LTDA', 'San Carlos #6969', '123', 'R', 'pornochile@porno.cl');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anunciante_giro`
--

CREATE TABLE IF NOT EXISTS `anunciante_giro` (
  `CODIGO_GIRO` int(11) NOT NULL,
  `NOMBRE_U_ANUNCIANTE` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_GIRO`,`NOMBRE_U_ANUNCIANTE`),
  KEY `FK_ANUNCIANTE_GIRO2` (`NOMBRE_U_ANUNCIANTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `anunciante_giro`
--

INSERT INTO `anunciante_giro` (`CODIGO_GIRO`, `NOMBRE_U_ANUNCIANTE`) VALUES
(519000, 'ChelasArtesa'),
(552020, 'comidarapida'),
(519000, 'Electricstyle'),
(642020, 'Empresa2'),
(523210, 'Javoru'),
(524090, 'JuegosRetro'),
(522090, 'Kiosko de la Esquina'),
(519000, 'MascoPet'),
(524010, 'MusicaRetro'),
(521300, 'poleraspro'),
(519000, 'PornoChile');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncio`
--

CREATE TABLE IF NOT EXISTS `anuncio` (
  `CODIGO_ANUNCIO` int(100) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U_ANUNCIANTE` varchar(100) NOT NULL,
  `NOMBRE_ANUNCIO` text,
  `IMAGEN_ANUNCIO` text,
  `DESCRIPCION_ANUNCIO` text,
  `FECHA_CREACION_ANUNCIO` date DEFAULT NULL,
  `FECHA_MODIFICACION_ANUNCIO` date DEFAULT NULL,
  `ESTADO_ANUNCIO` text,
  `ID_CATEGORIA` int(11) DEFAULT NULL,
  `ID_SEGMENTO_SEXO` int(11) DEFAULT NULL,
  `ID_SEGMENTO_EDAD` int(11) DEFAULT NULL,
  `CANTIDAD_CUPONES` int(11) DEFAULT NULL,
  `PORCENTAJE_DESCUENTO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ANUNCIO`),
  KEY `FK_CATEGORIA_ANUNCIO_R` (`ID_CATEGORIA`),
  KEY `FK_SEGMENTO_SEXO_ANUNCIO_R` (`ID_SEGMENTO_SEXO`),
  KEY `FK_SEGMENTO_EDAD_ANUNCIO_R` (`ID_SEGMENTO_EDAD`),
  KEY `FK_ANUNCIANTE_ANUNCIO_R` (`NOMBRE_U_ANUNCIANTE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Volcado de datos para la tabla `anuncio`
--

INSERT INTO `anuncio` (`CODIGO_ANUNCIO`, `NOMBRE_U_ANUNCIANTE`, `NOMBRE_ANUNCIO`, `IMAGEN_ANUNCIO`, `DESCRIPCION_ANUNCIO`, `FECHA_CREACION_ANUNCIO`, `FECHA_MODIFICACION_ANUNCIO`, `ESTADO_ANUNCIO`, `ID_CATEGORIA`, `ID_SEGMENTO_SEXO`, `ID_SEGMENTO_EDAD`, `CANTIDAD_CUPONES`, `PORCENTAJE_DESCUENTO`) VALUES
(21, 'Kiosko de la Esquina', 'Bebidas en Lata', 'Kiosko de la Esquina/21/bebidas.jpg', 'bebidas en lata, mantener en lugar fresco y seco. Refrigerar despues de abrir.', '2015-07-08', NULL, 'V', 9, 1, 1, 9, 20),
(22, 'Kiosko de la Esquina', 'Album Panini Variedades', 'Kiosko de la Esquina/22/album.jpeg', 'Todos los Albums Panini disponibles', '2015-07-08', NULL, 'V', 7, 1, 2, 10, 50),
(23, 'Kiosko de la Esquina', 'Sobres Album Panini', 'Kiosko de la Esquina/23/sobres.jpg', 'Sobres variedades de todos los albums Panini', '2015-07-08', NULL, 'V', 7, 1, 1, 10, 50),
(24, 'Kiosko de la Esquina', 'Chicles Dos en Uno', 'Kiosko de la Esquina/24/chicle.jpg', 'Los clasicos chicles dos en uno.', '2015-07-08', NULL, 'F', 9, 1, 1, 10, 50),
(25, 'Kiosko de la Esquina', 'Subscripcion al diario', 'Kiosko de la Esquina/25/diario.jpg', 'Servicio de subscripcion al diario, si ud lo deseea puede solicitar una subscripcion mensual para que su kiosko mas cercano le lleve el diario a eleccion a su domicilio. Si canjea cupon el porcentaje de descuento sera por el primer mes.', '2015-07-08', NULL, 'F', 7, 1, 3, 10, 30),
(26, 'Kiosko de la Esquina', 'Cigarros Malboro', 'Kiosko de la Esquina/26/cigarro.jpg', 'Marlboro es una marca de cigarrillos explotada por Philip Morris USA (Grupo Altria) dentro del territorio estadounidense y por Philip Morris International en el resto del mundo. Es conocida por la imagen del Marlboro Man, ligada a la imagen del cowboy norteamericano, y el patrocinio en eventos deportivos como la NFL, de motociclismo como la MotoGP (Ducati) y de automovilismo la Formula 1 (Ferrari). Su nombre proviene de la calle Great Marlborough, en Nueva Jersey, donde se localizaba originalmente la fabrica. Richmond, Virginia, es donde se localiza la mayor planta de produccion de cigarros Marlboro.', '2015-07-08', NULL, 'R', 9, 2, 2, 10, 50),
(27, 'JuegosRetro', 'Megaman X - juego', 'JuegosRetro/27/megaman x.jpg', 'Mega Man X, desarrollado en 1993 por Capcom, es el primer videojuego de la serie Mega Man X. Mega Man X es la primera subsaga de Mega Man, y fue creada principalmente como el escalon para progresar desde los videojuegos de Mega Man de la NES a los de la Super Nintendo.\r\n\r\nEl juego fue lanzado originariamente en 1993 para la Super Nintendo, siendo publicado por Capcom en Estados Unidos y Japon, y por Nintendo en Europa.', '2015-07-08', NULL, 'V', 4, 1, 1, 9, 50),
(28, 'JuegosRetro', 'F-Zero', 'JuegosRetro/28/fzero.jpg', 'El juego se desarrolla en el 2560, en donde las personas multimillonarias, quienes llevan una vida sedentaria y desahogada, crearon una nueva forma de entretenimiento basada en la antigua Formula 1, llamada F-ZeroÃ?. El jugador puede elegir de entre cuatro personajes disponibles, los cuales poseen sus respectivos vehiculos voladores, cada uno con caracterÃ?Â­sticas unicas. El jugador puede competir contra los otros personajes que son controlados por la consola a lo largo de quince pistas divididas en tres torneos principales.\r\nJuego disponible en cartucho, segun imagen de referencia.', '2015-07-08', NULL, 'V', 4, 1, 1, 10, 40),
(29, 'JuegosRetro', 'Super Mario World', 'JuegosRetro/29/super mario world.jpg', 'La trama se centra en la busqueda que Mario y Luigi deben emprender para salvar a la Dinosaur Land y rescatar a la Princesa Toadstool de las garras de Bowser, el antagonista principal de la serie. Ambos hermanos deben viajar por siete mundos para restaurar el orden en Dinosaur Land.4 Para el juego, se baso en el gameplay de anteriores entregas de la saga, y ademas fueron introducidos nuevos poderes que aumentan las habilidades de los personajes, junto con otros aspectos que sirvieron como base para varios titulos posteriores de la serie.', '2015-07-08', NULL, 'V', 4, 1, 1, 10, 20),
(30, 'Javoru', 'Zapatillas Air Jordan Shadow', 'Javoru/30/Air-Jordan-1-Retro-Hi-OG-Shadow-01.jpeg', 'Zapatillas air jordan j1 shadow en promocion !', '2015-07-08', NULL, 'V', 8, 1, 2, 10, 30),
(31, 'JuegosRetro', 'The Legend of Zelda - A link to the Past', 'JuegosRetro/31/The_Legend_of_Zelda_-_A_Link_to_the_Past_logo.png', 'Tambien conocido como Zelda 3 y Zelda III, es un juego de accion y aventuras desarrollado y publicado por Nintendo para la consola Super Nintendo Entertainment System y tiempo despues a la Game Boy Advance, siendo la tercera entrega de la saga de videojuegos The Legend of Zelda.', '2015-07-08', NULL, 'V', 4, 1, 1, 10, 45),
(32, 'comidarapida', 'Combo hamburguesa', 'comidarapida/32/combo1.jpg', 'Tradicional combo de haburguesa, papas fritas y bebida. Puedes agrandar papas y bebidas por $400. ', '2015-07-10', NULL, 'V', 9, 3, 6, 9, 50),
(33, 'comidarapida', 'Combo Grande', 'comidarapida/33/combo2.jpg', 'Combo Grande, de papas fritas, hamburguesa, bebidas y nugets de pollo. Este combo puede ser agrandado por $400, si eres de esos clientes hambrientos, este es el combo que debes escoger.', '2015-07-10', NULL, 'V', 9, 3, 6, 10, 40),
(34, 'comidarapida', 'Papas Fritas', 'comidarapida/34/papas.jpg', 'Tradicionales papas fritas, solo de porte extra grande. Disfruta!', '2015-07-10', NULL, 'V', 9, 3, 1, 10, 60),
(35, 'comidarapida', 'Pizzas', 'comidarapida/35/pizzas.jpg', 'Pizzas de todas las variedades, peperoni y alemana. de portes Familiar, Extra Familiar y Gigante.', '2015-07-10', NULL, 'V', 9, 3, 6, 10, 50),
(36, 'comidarapida', 'Completos', 'comidarapida/36/completo.jpg', '15, 20, o 30cms, estos completos son lo mejor que tenemos en cuanto a completos. Hay Italianos, As, Dinamicos, etc. Solicitalos con tu combo o individual.', '2015-07-10', NULL, 'V', 9, 3, 6, 10, 35),
(37, 'MusicaRetro', 'AC DC', 'MusicaRetro/37/acdc.jpg', 'Disco AC DC Original, lleve ya!', '2015-07-11', NULL, 'V', 6, 3, 6, 10, 30),
(38, 'MusicaRetro', 'Cassette a su gusto', 'MusicaRetro/38/cassette.jpg', 'Cassetes Para grabar tus canciones favoritas, selecciona tu estilo y nosotros lo grabamos.', '2015-07-11', NULL, 'V', 6, 3, 3, 10, 25),
(39, 'MusicaRetro', 'Kiss - rock and roll all night', 'MusicaRetro/39/kiss.jpg', 'El clasico disco del grupo Kiss.', '2015-07-11', NULL, 'V', 6, 3, 6, 10, 20),
(40, 'MusicaRetro', 'Long Live Rock and Roll', 'MusicaRetro/40/longliverocknroll.jpg', 'Mix de los mejores grupos representantes del Rock And Roll, en CD.', '2015-07-11', NULL, 'F', 6, 3, 6, 10, 40),
(41, 'MusicaRetro', 'REM Green', 'MusicaRetro/41/rem.jpg', 'REM en uno de sus mejores discos, en CD.', '2015-07-11', NULL, 'V', 6, 3, 6, 10, 35),
(42, 'MusicaRetro', 'The Police', 'MusicaRetro/42/thepolice.jpg', 'Every Breath you take. Un Clasico grupo de Rock, liderado por Sting!', '2015-07-11', NULL, 'F', 6, 3, 6, 10, 60),
(43, 'Javoru', 'Zapatillas Under Armour ', 'Javoru/43/stephcurrysneakers.jpg', 'Zapatillas Under Armour Steph Curry Black Talla 44 ', '2015-07-11', NULL, 'F', 8, 3, 6, 10, 25),
(44, 'Javoru', 'Zapatillas ADIDAS Derick Rose', 'Javoru/44/drosesneakers.jpg', 'Zapatillas ADIDAS Derick Rose Talla 45 ', '2015-07-11', NULL, 'F', 8, 3, 6, 10, 20),
(45, 'comidarapida', 'todas las variedades de otras marcas', 'comidarapida/45/fastfoodlogos.gif', 'cualquier comida de otras marcas, en comera', '2015-07-11', NULL, 'R', 9, 3, 3, 10, 50),
(46, 'poleraspro', 'poleras variedades 1', 'poleraspro/46/blanca.jpg', ' of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who', '2015-07-11', NULL, 'F', 5, 1, 6, 10, 25),
(47, 'poleraspro', 'poleras variedades 2', 'poleraspro/47/negra.png', ' of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because thosho', '2015-07-11', NULL, 'F', 5, 3, 1, 10, 40),
(48, 'poleraspro', 'poleras cuello', 'poleraspro/48/pique.jpg', ' of the grt because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who', '2015-07-11', NULL, 'V', 5, 3, 6, 10, 45),
(49, 'Javoru', 'Zapatillas Jordan Oreo 4', 'Javoru/49/air-jordan-4-oreo-nikestore-1.jpg', 'Zapatillas Jordan Oreo 4 Talla 43', '2015-07-11', NULL, 'V', 8, 3, 6, 10, 20),
(50, 'poleraspro', 'poleras diseno', 'poleraspro/50/post.jpg', 'i officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', '2015-07-11', NULL, 'F', 5, 3, 6, 10, 30),
(51, 'Electricstyle', 'Poleron Electrico', 'Electricstyle/51/poleron.jpg', 'Novedoso poleron con luces led. Se el primero en tenerlo!.', '2015-07-11', NULL, 'V', 6, 1, 2, 10, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avatar`
--

CREATE TABLE IF NOT EXISTS `avatar` (
  `ID_AVATAR` int(100) NOT NULL AUTO_INCREMENT,
  `NOMBRE_AVATAR` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_AVATAR`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `avatar`
--

INSERT INTO `avatar` (`ID_AVATAR`, `NOMBRE_AVATAR`) VALUES
(1, 'Alien 3.ico'),
(2, 'Bat.ico'),
(3, 'Devil 2.ico'),
(4, 'Pumpkin.ico'),
(5, 'Sea Monster.ico'),
(6, 'Skull 2.ico'),
(7, 'Zombie Female.ico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `ID_CATEGORIA` int(11) NOT NULL DEFAULT '0',
  `NOMBRE_CATEGORIA` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID_CATEGORIA`, `NOMBRE_CATEGORIA`) VALUES
(1, 'Accesorios para vehiculo'),
(2, 'Animales y mascotas'),
(3, 'Celulares y telefonia'),
(4, 'Consolas y videojuegos'),
(5, 'Deportey fitness'),
(6, 'Electronica, audio y videos'),
(7, 'Hogar y muebles'),
(8, 'Calzado'),
(9, 'Comida y restorant');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coin`
--

CREATE TABLE IF NOT EXISTS `coin` (
  `ID_COIN` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_INICIO` date NOT NULL,
  `FECHA_TERMINO` date NOT NULL,
  `ESTADO_COIN` int(1) NOT NULL,
  `NOMBRE_U_DIFUSOR` varchar(100) DEFAULT NULL,
  `ID_VALOR_COIN` int(11) NOT NULL,
  `CODIGO_ANUNCIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_COIN`),
  KEY `FK_DIFUSOR_AG_PUNTO` (`NOMBRE_U_DIFUSOR`),
  KEY `FK_VALOR_COIN_COIN_R` (`ID_VALOR_COIN`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=149 ;

--
-- Volcado de datos para la tabla `coin`
--

INSERT INTO `coin` (`ID_COIN`, `FECHA_INICIO`, `FECHA_TERMINO`, `ESTADO_COIN`, `NOMBRE_U_DIFUSOR`, `ID_VALOR_COIN`, `CODIGO_ANUNCIO`) VALUES
(83, '2015-07-08', '0000-00-00', 0, 'rubenqs2', 2, 19),
(84, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(85, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 21),
(86, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 21),
(87, '2015-07-08', '0000-00-00', 0, 'rubenqs2', 2, 21),
(88, '2015-07-08', '0000-00-00', 0, 'rubenqs2', 2, 21),
(89, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 21),
(90, '2015-07-08', '0000-00-00', 0, 'rubenqs2', 2, 21),
(91, '2015-07-08', '0000-00-00', 0, 'rubenqs2', 2, 19),
(92, '2015-07-08', '0000-00-00', 0, 'rubenqs2', 2, 21),
(93, '2015-07-08', '0000-00-00', 0, 'rubenqs2', 2, 21),
(94, '2015-07-08', '0000-00-00', 0, 'rubenqs2', 2, 27),
(95, '2015-07-08', '0000-00-00', 0, 'rubenqs2', 2, 28),
(96, '2015-07-09', '0000-00-00', 0, 'rubenqs', 2, 21),
(97, '2015-07-09', '0000-00-00', 0, 'rubenqs', 2, 28),
(98, '2015-07-09', '0000-00-00', 0, 'rubenqs2', 2, 28),
(99, '2015-07-09', '0000-00-00', 0, 'rubenqs2', 2, 19),
(100, '2015-07-10', '0000-00-00', 0, 'rubenqs2', 2, 19),
(101, '2015-07-10', '0000-00-00', 0, 'rubenqs2', 2, 19),
(102, '2015-07-10', '0000-00-00', 0, 'rubenqs2', 2, 27),
(103, '2015-07-10', '0000-00-00', 1, 'rubenqs2', 2, 27),
(104, '2015-07-10', '0000-00-00', 1, 'zamorator', 2, 27),
(105, '2015-07-10', '0000-00-00', 1, 'zamorator', 2, 36),
(106, '2015-07-10', '0000-00-00', 1, 'zamorator', 2, 21),
(107, '2015-07-10', '0000-00-00', 0, 'zamorator', 2, 19),
(108, '2015-07-10', '0000-00-00', 0, 'zamorator', 2, 28),
(109, '2015-07-10', '0000-00-00', 0, 'zamorator', 2, 34),
(110, '2015-07-11', '0000-00-00', 1, 'rubenqs', 2, 35),
(111, '2015-07-11', '0000-00-00', 1, 'rubenqs', 2, 36),
(112, '2015-07-11', '0000-00-00', 1, 'rubenqs', 2, 32),
(113, '2015-07-11', '0000-00-00', 1, 'rubenqs', 2, 32),
(114, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(115, '2015-07-11', '0000-00-00', 1, 'rubenqs', 2, 32),
(116, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(117, '2015-07-08', '0000-00-00', 0, 'rubenqs2', 2, 19),
(118, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(119, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(120, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(121, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(122, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(123, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(124, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(125, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(126, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(127, '2015-07-08', '0000-00-00', 0, 'rubenqs', 2, 19),
(128, '2015-07-11', '0000-00-00', 1, 'rubenqs', 2, 36),
(129, '2015-07-11', '0000-00-00', 1, 'zamorator', 2, 36),
(130, '2015-07-11', '0000-00-00', 1, 'zamorator', 2, 38),
(131, '2015-07-11', '0000-00-00', 1, 'zamorator', 2, 28),
(132, '2015-07-11', '0000-00-00', 1, 'Javier', 2, 49),
(133, '2015-07-11', '0000-00-00', 1, 'rubenqs', 2, 30),
(134, '2015-07-11', '0000-00-00', 1, 'rubenqs', 2, 30),
(135, '2015-07-11', '0000-00-00', 1, 'zamorator', 2, 29),
(136, '2015-07-11', '0000-00-00', 1, 'zamorator', 2, 32),
(137, '2015-07-11', '0000-00-00', 1, 'zamorator', 2, 37),
(138, '2015-07-11', '0000-00-00', 1, 'Mclio', 2, 37),
(139, '2015-07-11', '0000-00-00', 1, 'Mclio', 2, 51),
(140, '2015-07-11', '0000-00-00', 1, 'Mclio', 2, 28),
(141, '2015-07-11', '0000-00-00', 1, 'Mclio', 2, 27),
(142, '2015-07-11', '0000-00-00', 1, 'Mclio', 2, 49),
(143, '2015-07-11', '0000-00-00', 1, 'Mclio', 2, 29),
(144, '2015-07-12', '0000-00-00', 1, 'zamorator', 2, 38),
(145, '2015-07-12', '0000-00-00', 1, 'zamorator', 2, 30),
(146, '2015-07-12', '0000-00-00', 1, 'rubenqs', 2, 35),
(147, '2015-07-13', '0000-00-00', 1, 'zamorator', 2, 28),
(148, '2015-07-13', '0000-00-00', 1, 'zamorator', 2, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE IF NOT EXISTS `comuna` (
  `ID_COMUNA` int(11) NOT NULL,
  `ID_PROVINCIA` int(11) NOT NULL,
  `NOMBRE_COMUNA` text,
  PRIMARY KEY (`ID_COMUNA`),
  KEY `FK_PROVINCIA_COMUNA_R` (`ID_PROVINCIA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`ID_COMUNA`, `ID_PROVINCIA`, `NOMBRE_COMUNA`) VALUES
(1101, 11, 'Iquique'),
(1107, 11, 'Alto Hospicio'),
(1401, 14, 'Pozo Almonte'),
(1402, 14, 'Camiña'),
(1403, 14, 'Colchane'),
(1404, 14, 'Huara'),
(1405, 14, 'Pica'),
(2101, 21, 'Antofagasta'),
(2102, 21, 'Mejillones'),
(2103, 21, 'Sierra Gorda'),
(2104, 21, 'Taltal'),
(2201, 22, 'Calama'),
(2202, 22, 'Ollagüe'),
(2203, 22, 'San Pedro de Atacama'),
(2301, 23, 'Tocopilla'),
(2302, 23, 'María Elena'),
(3101, 31, 'Copiapó'),
(3102, 31, 'Caldera'),
(3103, 31, 'Tierra Amarilla'),
(3201, 32, 'Chañaral'),
(3202, 32, 'Diego de Almagro'),
(3301, 33, 'Vallenar'),
(3302, 33, 'Alto del Carmen'),
(3303, 33, 'Freirina'),
(3304, 33, 'Huasco'),
(4101, 41, 'La Serena'),
(4102, 41, 'Coquimbo'),
(4103, 41, 'Andacollo'),
(4104, 41, 'La Higuera'),
(4105, 41, 'Paiguano'),
(4106, 41, 'Vicuña'),
(4201, 42, 'Illapel'),
(4202, 42, 'Canela'),
(4203, 42, 'Los Vilos'),
(4204, 42, 'Salamanca'),
(4301, 43, 'Ovalle'),
(4302, 43, 'Combarbalá'),
(4303, 43, 'Monte Patria'),
(4304, 43, 'Punitaqui'),
(4305, 43, 'Río Hurtado'),
(5101, 51, 'Valparaíso'),
(5102, 51, 'Casablanca'),
(5103, 51, 'Concón'),
(5104, 51, 'Juan Fernández'),
(5105, 51, 'Puchuncaví'),
(5107, 51, 'Quintero'),
(5109, 51, 'Viña del Mar'),
(5201, 52, 'Isla de Pascua'),
(5301, 53, 'Los Andes'),
(5302, 53, 'Calle Larga'),
(5303, 53, 'Rinconada'),
(5304, 53, 'San Esteban'),
(5401, 54, 'La Ligua'),
(5402, 54, 'Cabildo'),
(5403, 54, 'Papudo'),
(5404, 54, 'Petorca'),
(5405, 54, 'Zapallar'),
(5501, 55, 'Quillota'),
(5502, 55, 'Calera'),
(5503, 55, 'Hijuelas'),
(5504, 55, 'La Cruz'),
(5506, 55, 'Nogales'),
(5601, 56, 'San Antonio'),
(5602, 56, 'Algarrobo'),
(5603, 56, 'Cartagena'),
(5604, 56, 'El Quisco'),
(5605, 56, 'El Tabo'),
(5606, 56, 'Santo Domingo'),
(5701, 57, 'San Felipe'),
(5702, 57, 'Catemu'),
(5703, 57, 'Llaillay'),
(5704, 57, 'Panquehue'),
(5705, 57, 'Putaendo'),
(5706, 57, 'Santa María'),
(5801, 58, 'Quilpué'),
(5802, 58, 'Limache'),
(5803, 58, 'Olmué'),
(5804, 58, 'Villa Alemana'),
(6101, 61, 'Rancagua'),
(6102, 61, 'Codegua'),
(6103, 61, 'Coinco'),
(6104, 61, 'Coltauco'),
(6105, 61, 'Doñihue'),
(6106, 61, 'Graneros'),
(6107, 61, 'Las Cabras'),
(6108, 61, 'Machalí'),
(6109, 61, 'Malloa'),
(6110, 61, 'Mostazal'),
(6111, 61, 'Olivar'),
(6112, 61, 'Peumo'),
(6113, 61, 'Pichidegua'),
(6114, 61, 'Quinta de Tilcoco'),
(6115, 61, 'Rengo'),
(6116, 61, 'Requínoa'),
(6117, 61, 'San Vicente'),
(6201, 62, 'Pichilemu'),
(6202, 62, 'La Estrella'),
(6203, 62, 'Litueche'),
(6204, 62, 'Marchihue'),
(6205, 62, 'Navidad'),
(6206, 62, 'Paredones'),
(6301, 63, 'San Fernando'),
(6302, 63, 'Chépica'),
(6303, 63, 'Chimbarongo'),
(6304, 63, 'Lolol'),
(6305, 63, 'Nancagua'),
(6306, 63, 'Palmilla'),
(6307, 63, 'Peralillo'),
(6308, 63, 'Placilla'),
(6309, 63, 'Pumanque'),
(6310, 63, 'Santa Cruz'),
(7101, 71, 'Talca'),
(7102, 71, 'Constitución'),
(7103, 71, 'Curepto'),
(7104, 71, 'Empedrado'),
(7105, 71, 'Maule'),
(7106, 71, 'Pelarco'),
(7107, 71, 'Pencahue'),
(7108, 71, 'Río Claro'),
(7109, 71, 'San Clemente'),
(7110, 71, 'San Rafael'),
(7201, 72, 'Cauquenes'),
(7202, 72, 'Chanco'),
(7203, 72, 'Pelluhue'),
(7301, 73, 'Curicó'),
(7302, 73, 'Hualañé'),
(7303, 73, 'Licantén'),
(7304, 73, 'Molina'),
(7305, 73, 'Rauco'),
(7306, 73, 'Romeral'),
(7307, 73, 'Sagrada Familia'),
(7308, 73, 'Teno'),
(7309, 73, 'Vichuquén'),
(7401, 74, 'Linares'),
(7402, 74, 'Colbún'),
(7403, 74, 'Longaví'),
(7404, 74, 'Parral'),
(7405, 74, 'Retiro'),
(7406, 74, 'San Javier'),
(7407, 74, 'Villa Alegre'),
(7408, 74, 'Yerbas Buenas'),
(8101, 81, 'Concepción'),
(8102, 81, 'Coronel'),
(8103, 81, 'Chiguayante'),
(8104, 81, 'Florida'),
(8105, 81, 'Hualqui'),
(8106, 81, 'Lota'),
(8107, 81, 'Penco'),
(8108, 81, 'San Pedro de la Paz'),
(8109, 81, 'Santa Juana'),
(8110, 81, 'Talcahuano'),
(8111, 81, 'Tomé'),
(8112, 81, 'Hualpén'),
(8201, 82, 'Lebu'),
(8202, 82, 'Arauco'),
(8203, 82, 'Cañete'),
(8204, 82, 'Contulmo'),
(8205, 82, 'Curanilahue'),
(8206, 82, 'Los Álamos'),
(8207, 82, 'Tirúa'),
(8301, 83, 'Los Ángeles'),
(8302, 83, 'Antuco'),
(8303, 83, 'Cabrero'),
(8304, 83, 'Laja'),
(8305, 83, 'Mulchén'),
(8306, 83, 'Nacimiento'),
(8307, 83, 'Negrete'),
(8308, 83, 'Quilaco'),
(8309, 83, 'Quilleco'),
(8310, 83, 'San Rosendo'),
(8311, 83, 'Santa Bárbara'),
(8312, 83, 'Tucapel'),
(8313, 83, 'Yumbel'),
(8314, 83, 'Alto Biobío'),
(8401, 84, 'Chillán'),
(8402, 84, 'Bulnes'),
(8403, 84, 'Cobquecura'),
(8404, 84, 'Coelemu'),
(8405, 84, 'Coihueco'),
(8406, 84, 'Chillán Viejo'),
(8407, 84, 'El Carmen'),
(8408, 84, 'Ninhue'),
(8409, 84, 'Ñiquén'),
(8410, 84, 'Pemuco'),
(8411, 84, 'Pinto'),
(8412, 84, 'Portezuelo'),
(8413, 84, 'Quillón'),
(8414, 84, 'Quirihue'),
(8415, 84, 'Ránquil'),
(8416, 84, 'San Carlos'),
(8417, 84, 'San Fabián'),
(8418, 84, 'San Ignacio'),
(8419, 84, 'San Nicolás'),
(8420, 84, 'Treguaco'),
(8421, 84, 'Yungay'),
(9101, 91, 'Temuco'),
(9102, 91, 'Carahue'),
(9103, 91, 'Cunco'),
(9104, 91, 'Curarrehue'),
(9105, 91, 'Freire'),
(9106, 91, 'Galvarino'),
(9107, 91, 'Gorbea'),
(9108, 91, 'Lautaro'),
(9109, 91, 'Loncoche'),
(9110, 91, 'Melipeuco'),
(9111, 91, 'Nueva Imperial'),
(9112, 91, 'Padre las Casas'),
(9113, 91, 'Perquenco'),
(9114, 91, 'Pitrufquén'),
(9115, 91, 'Pucón'),
(9116, 91, 'Saavedra'),
(9117, 91, 'Teodoro Schmidt'),
(9118, 91, 'Toltén'),
(9119, 91, 'Vilcún'),
(9120, 91, 'Villarrica'),
(9121, 91, 'Cholchol'),
(9201, 92, 'Angol'),
(9202, 92, 'Collipulli'),
(9203, 92, 'Curacautín'),
(9204, 92, 'Ercilla'),
(9205, 92, 'Lonquimay'),
(9206, 92, 'Los Sauces'),
(9207, 92, 'Lumaco'),
(9208, 92, 'Purén'),
(9209, 92, 'Renaico'),
(9210, 92, 'Traiguén'),
(9211, 92, 'Victoria'),
(10101, 101, 'Puerto Montt'),
(10102, 101, 'Calbuco'),
(10103, 101, 'Cochamó'),
(10104, 101, 'Fresia'),
(10105, 101, 'Frutillar'),
(10106, 101, 'Los Muermos'),
(10107, 101, 'Llanquihue'),
(10108, 101, 'Maullín'),
(10109, 101, 'Puerto Varas'),
(10201, 102, 'Castro'),
(10202, 102, 'Ancud'),
(10203, 102, 'Chonchi'),
(10204, 102, 'Curaco de Vélez'),
(10205, 102, 'Dalcahue'),
(10206, 102, 'Puqueldón'),
(10207, 102, 'Queilén'),
(10208, 102, 'Quellón'),
(10209, 102, 'Quemchi'),
(10210, 102, 'Quinchao'),
(10301, 103, 'Osorno'),
(10302, 103, 'Puerto Octay'),
(10303, 103, 'Purranque'),
(10304, 103, 'Puyehue'),
(10305, 103, 'Río Negro'),
(10306, 103, 'San Juan de la Costa'),
(10307, 103, 'San Pablo'),
(10401, 104, 'Chaitén'),
(10402, 104, 'Futaleufú'),
(10403, 104, 'Hualaihué'),
(10404, 104, 'Palena'),
(11101, 111, 'Coihaique'),
(11102, 111, 'Lago Verde'),
(11201, 112, 'Aisén'),
(11202, 112, 'Cisnes'),
(11203, 112, 'Guaitecas'),
(11301, 113, 'Cochrane'),
(11302, 113, 'O’Higgins'),
(11303, 113, 'Tortel'),
(11401, 114, 'Chile Chico'),
(11402, 114, 'Río Ibáñez'),
(12101, 121, 'Punta Arenas'),
(12102, 121, 'Laguna Blanca'),
(12103, 121, 'Río Verde'),
(12104, 121, 'San Gregorio'),
(12201, 122, 'Cabo de Hornos'),
(12202, 122, 'Antártica'),
(12301, 123, 'Porvenir'),
(12302, 123, 'Primavera'),
(12303, 123, 'Timaukel'),
(12401, 124, 'Natales'),
(12402, 124, 'Torres del Paine'),
(13101, 131, 'Santiago'),
(13102, 131, 'Cerrillos'),
(13103, 131, 'Cerro Navia'),
(13104, 131, 'Conchalí'),
(13105, 131, 'El Bosque'),
(13106, 131, 'Estación Central'),
(13107, 131, 'Huechuraba'),
(13108, 131, 'Independencia'),
(13109, 131, 'La Cisterna'),
(13110, 131, 'La Florida'),
(13111, 131, 'La Granja'),
(13112, 131, 'La Pintana'),
(13113, 131, 'La Reina'),
(13114, 131, 'Las Condes'),
(13115, 131, 'Lo Barnechea'),
(13116, 131, 'Lo Espejo'),
(13117, 131, 'Lo Prado'),
(13118, 131, 'Macul'),
(13119, 131, 'Maipú'),
(13120, 131, 'Ñuñoa'),
(13121, 131, 'Pedro Aguirre Cerda'),
(13122, 131, 'Peñalolén'),
(13123, 131, 'Providencia'),
(13124, 131, 'Pudahuel'),
(13125, 131, 'Quilicura'),
(13126, 131, 'Quinta Normal'),
(13127, 131, 'Recoleta'),
(13128, 131, 'Renca'),
(13129, 131, 'San Joaquín'),
(13130, 131, 'San Miguel'),
(13131, 131, 'San Ramón'),
(13132, 131, 'Vitacura'),
(13201, 132, 'Puente Alto'),
(13202, 132, 'Pirque'),
(13203, 132, 'San José de Maipo'),
(13301, 133, 'Colina'),
(13302, 133, 'Lampa'),
(13303, 133, 'Tiltil'),
(13401, 134, 'San Bernardo'),
(13402, 134, 'Buin'),
(13403, 134, 'Calera de Tango'),
(13404, 134, 'Paine'),
(13501, 135, 'Melipilla'),
(13502, 135, 'Alhué'),
(13503, 135, 'Curacaví'),
(13504, 135, 'María Pinto'),
(13505, 135, 'San Pedro'),
(13601, 136, 'Talagante'),
(13602, 136, 'El Monte'),
(13603, 136, 'Isla de Maipo'),
(13604, 136, 'Padre Hurtado'),
(13605, 136, 'Peñaflor'),
(14101, 141, 'Valdivia'),
(14102, 141, 'Corral'),
(14103, 141, 'Lanco'),
(14104, 141, 'Los Lagos'),
(14105, 141, 'Máfil'),
(14106, 141, 'Mariquina'),
(14107, 141, 'Paillaco'),
(14108, 141, 'Panguipulli'),
(14201, 142, 'La Unión'),
(14202, 142, 'Futrono'),
(14203, 142, 'Lago Ranco'),
(14204, 142, 'Río Bueno'),
(15101, 151, 'Arica'),
(15102, 151, 'Camarones'),
(15201, 152, 'Putre'),
(15202, 152, 'General Lagos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupon`
--

CREATE TABLE IF NOT EXISTS `cupon` (
  `ID_CUPON` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U_DIFUSOR` varchar(100) NOT NULL,
  `DESCRIPCION_CUPON` smallint(6) DEFAULT NULL,
  `FECHA_CREACION_CUPON` datetime DEFAULT NULL,
  `FECHA_VENCIMIENTO_CUPON` date DEFAULT NULL,
  `CODIGO_ANUNCIO` int(11) DEFAULT NULL,
  `DESCUENTO_OBTENIDO` varchar(100) DEFAULT NULL,
  `VALOR_FINAL` int(11) DEFAULT NULL,
  `ESTADO` varchar(1) NOT NULL,
  PRIMARY KEY (`ID_CUPON`),
  KEY `FK_DIFUSOR_CUPON_R` (`NOMBRE_U_DIFUSOR`),
  KEY `FK_ANUNCIO_CUPON_R` (`CODIGO_ANUNCIO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Volcado de datos para la tabla `cupon`
--

INSERT INTO `cupon` (`ID_CUPON`, `NOMBRE_U_DIFUSOR`, `DESCRIPCION_CUPON`, `FECHA_CREACION_CUPON`, `FECHA_VENCIMIENTO_CUPON`, `CODIGO_ANUNCIO`, `DESCUENTO_OBTENIDO`, `VALOR_FINAL`, `ESTADO`) VALUES
(65, 'rubenqs', NULL, '2015-07-11 00:46:49', NULL, 32, '1', 3250, 'P'),
(66, 'zamorator', NULL, '2015-07-11 09:07:53', NULL, 27, '1', 14840, 'P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `difusor`
--

CREATE TABLE IF NOT EXISTS `difusor` (
  `NOMBRE_U_DIFUSOR` varchar(100) NOT NULL,
  `NOMBRES` text,
  `APELLIDO_PATERNO_DIFUSOR` text,
  `APELLIDO_MATERNO_DIFUSOR` text,
  `PASSWORD_DIFUSOR` text,
  `EMAIL_DIFUSOR` text,
  `ID_SEGMENTO_EDAD` int(11) DEFAULT NULL,
  `ID_SEGMENTO_SEXO` int(11) DEFAULT NULL,
  `ID_AVATAR` int(100) DEFAULT NULL,
  PRIMARY KEY (`NOMBRE_U_DIFUSOR`),
  KEY `FK_SEGMENTO_EDAD_DIFUSOR_R` (`ID_SEGMENTO_EDAD`),
  KEY `FK_SEGMENTO_SEXO_DIFUSOR_R` (`ID_SEGMENTO_SEXO`),
  KEY `FK_AVATAR_DIFUSOR_R` (`ID_AVATAR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `difusor`
--

INSERT INTO `difusor` (`NOMBRE_U_DIFUSOR`, `NOMBRES`, `APELLIDO_PATERNO_DIFUSOR`, `APELLIDO_MATERNO_DIFUSOR`, `PASSWORD_DIFUSOR`, `EMAIL_DIFUSOR`, `ID_SEGMENTO_EDAD`, `ID_SEGMENTO_SEXO`, `ID_AVATAR`) VALUES
('Javier', 'Javier Ignacio', 'Castro', 'Retamal', '123', 'javier@javier.cl', 2, 1, 4),
('Mclio', 'Emilio Jose', 'Aguilar', 'Venegas', 'maria1989', 'mclio.aguilar@gmail.com', 2, 1, 6),
('otro', 'otro', 'otro', 'otro', '123', 'otr@otro.cl', 2, 1, 1),
('rubenqs', 'Ruben Felipe', 'Quinteros', 'Sepulveda', '123', 'ruben.quinteros89@gmail.com', 2, 1, 5),
('rubenqs2', 'Ruben Felipe', 'Quinteros', 'Sepulveda', '123', 'ruben@gmail.com', 2, 1, 1),
('zamorator', 'Diego', 'Zamora', 'Flores', '123', 'zamorator@gmail.com', 2, 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `difusor_anuncio_r`
--

CREATE TABLE IF NOT EXISTS `difusor_anuncio_r` (
  `NOMBRE_U_DIFUSOR` varchar(100) NOT NULL,
  `CODIGO_ANUNCIO` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`NOMBRE_U_DIFUSOR`,`CODIGO_ANUNCIO`),
  KEY `FK_DIFUSOR_ANUNCIO_R2` (`CODIGO_ANUNCIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `difusor_redsocial_r`
--

CREATE TABLE IF NOT EXISTS `difusor_redsocial_r` (
  `ID_RED_SOCIAL` int(11) NOT NULL,
  `NOMBRE_U_DIFUSOR` varchar(100) NOT NULL,
  `ID_RED_SOCIAL_DIFUSOR` varchar(100) NOT NULL DEFAULT '',
  `NOMBRE_RED_SOCIAL_DIFUSOR` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_RED_SOCIAL`,`ID_RED_SOCIAL_DIFUSOR`,`NOMBRE_U_DIFUSOR`),
  KEY `FK_DIFUSOR_REDSOCIAL_R2` (`NOMBRE_U_DIFUSOR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `difusor_redsocial_r`
--

INSERT INTO `difusor_redsocial_r` (`ID_RED_SOCIAL`, `NOMBRE_U_DIFUSOR`, `ID_RED_SOCIAL_DIFUSOR`, `NOMBRE_RED_SOCIAL_DIFUSOR`) VALUES
(1, 'zamorator', '10154143315582281', 'Diego Zamora'),
(1, 'otro', '10206810193721215', 'PheliiPe Quinteros Sepulveda'),
(1, 'rubenqs', '10206810193721215', 'PheliiPe Quinteros Sepulveda'),
(1, 'Mclio', '10207165310591036', 'Emilio Jose Aguilar Venegas'),
(1, 'Javier', '10207407029753013', 'Javier Ignacio Castro Retamal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorito`
--

CREATE TABLE IF NOT EXISTS `favorito` (
  `ID_FAVORITO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_U_DIFUSOR` varchar(100) NOT NULL,
  `CODIGO_ANUNCIO` int(11) NOT NULL,
  `ESTADO_FAVORITO` int(1) DEFAULT NULL,
  `FECHA_MOD` date DEFAULT NULL,
  PRIMARY KEY (`ID_FAVORITO`),
  KEY `FK_DIFUSOR_FAVORITO` (`NOMBRE_U_DIFUSOR`),
  KEY `FK_ANUNCIO_FAVORITO` (`CODIGO_ANUNCIO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `favorito`
--

INSERT INTO `favorito` (`ID_FAVORITO`, `NOMBRE_U_DIFUSOR`, `CODIGO_ANUNCIO`, `ESTADO_FAVORITO`, `FECHA_MOD`) VALUES
(12, 'zamorator', 28, 1, '2015-07-10'),
(13, 'zamorator', 27, 1, '2015-07-10'),
(14, 'rubenqs', 51, 1, '2015-07-11'),
(15, 'rubenqs', 28, 1, '2015-07-11'),
(16, 'rubenqs', 35, 1, '2015-07-11'),
(17, 'rubenqs', 32, 1, '2015-07-11'),
(18, 'rubenqs', 30, 1, '2015-07-11'),
(19, 'Javier', 30, 1, '2015-07-11'),
(20, 'zamorator', 51, 1, '2015-07-11'),
(21, 'Javier', 49, 1, '2015-07-11'),
(22, 'zamorator', 37, 0, '2015-07-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `giro`
--

CREATE TABLE IF NOT EXISTS `giro` (
  `CODIGO_GIRO` int(11) NOT NULL,
  `ID_GIRO_DETALLE` int(100) DEFAULT NULL,
  `DETALLE` varchar(500) DEFAULT NULL,
  `AFECTO_IVA` varchar(5) DEFAULT NULL,
  `CATEGORIA_TRIBUTARIA` int(1) DEFAULT NULL,
  `DISPONIBLE_INTERNET` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_GIRO`),
  KEY `FK_GIRO_GIRO_DETALLE_R` (`ID_GIRO_DETALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `giro`
--

INSERT INTO `giro` (`CODIGO_GIRO`, `ID_GIRO_DETALLE`, `DETALLE`, `AFECTO_IVA`, `CATEGORIA_TRIBUTARIA`, `DISPONIBLE_INTERNET`) VALUES
(11111, 133, 'CULTIVO DE TRIGO', 'SI', 1, 'SI'),
(11112, 133, 'CULTIVO DE MAIZ', 'SI', 1, 'SI'),
(11113, 133, 'CULTIVO DE AVENA', 'SI', 1, 'SI'),
(11114, 133, 'CULTIVO DE ARROZ', 'SI', 1, 'SI'),
(11115, 133, 'CULTIVO DE CEBADA', 'SI', 1, 'SI'),
(11119, 133, 'CULTIVO DE OTROS CEREALES', 'SI', 1, 'SI'),
(11121, 133, 'CULTIVO FORRAJEROS EN PRADERAS NATURALES', 'SI', 1, 'SI'),
(11122, 133, 'CULTIVO FORRAJEROS EN PRADERAS MEJORADAS O SEMBRADAS', 'SI', 1, 'SI'),
(11131, 133, 'CULTIVO DE POROTOS O FRIJOL', 'SI', 1, 'SI'),
(11132, 133, 'CULTIVO, PRODUCCIÓN DE LUPINO', 'SI', 1, 'SI'),
(11139, 133, 'CULTIVO DE OTRAS LEGUMBRES', 'SI', 1, 'SI'),
(11141, 133, 'CULTIVO DE PAPAS', 'SI', 1, 'SI'),
(11142, 133, 'CULTIVO DE CAMOTES O BATATAS', 'SI', 1, 'SI'),
(11149, 133, 'CULTIVO DE OTROS TUBÉRCULOS N.C.P', 'SI', 1, 'SI'),
(11151, 133, 'CULTIVO DE RAPS', 'SI', 1, 'SI'),
(11152, 133, 'CULTIVO DE MARAVILLA', 'SI', 1, 'SI'),
(11159, 133, 'CULTIVO DE OTRAS OLEAGINOSAS N.C.P.', 'SI', 1, 'SI'),
(11160, 133, 'PRODUCCIÓN DE SEMILLAS DE CEREALES, LEGUMBRES, OLEAGINOSAS', 'SI', 1, 'SI'),
(11191, 133, 'CULTIVO DE REMOLACHA', 'SI', 1, 'SI'),
(11192, 133, 'CULTIVO DE TABACO', 'SI', 1, 'SI'),
(11193, 133, 'CULTIVO DE FIBRAS VEGETALES INDUSTRIALES', 'SI', 1, 'SI'),
(11194, 133, 'CULTIVO DE PLANTAS AROMÁTICAS O MEDICINALES', 'SI', 1, 'SI'),
(11199, 133, 'OTROS CULTIVOS N.C.P.', 'SI', 1, 'SI'),
(11211, 133, 'CULTIVO TRADICIONAL DE HORTALIZAS FRESCAS', 'SI', 1, 'SI'),
(11212, 133, 'CULTIVO DE HORTALIZAS EN INVERNADEROS Y CULTIVOS HIDROPONICOS', 'SI', 1, 'SI'),
(11213, 133, 'CULTIVO ORGÁNICO DE HORTALIZAS', 'SI', 1, 'SI'),
(11220, 133, 'CULTIVO DE PLANTAS VIVAS Y PRODUCTOS DE LA FLORICULTURA', 'SI', 1, 'SI'),
(11230, 133, 'PRODUCCIÓN DE SEMILLAS DE FLORES, PRADOS, FRUTAS Y HORTALIZAS', 'SI', 1, 'SI'),
(11240, 133, 'PRODUCCIÓN EN VIVEROS; EXCEPTO ESPECIES FORESTALES', 'SI', 1, 'SI'),
(11250, 133, 'CULTIVO Y RECOLECCIÓN DE HONGOS, TRUFAS Y SAVIA; PRODUCCIÓN DE JARABE DE ARCE DE AZÚCAR Y AZÚCAR', 'SI', 1, 'SI'),
(11311, 133, 'CULTIVO DE UVA DESTINADA A PRODUCCIÓN DE PISCO Y AGUARDIENTE', 'SI', 1, 'SI'),
(11312, 133, 'CULTIVO DE UVA DESTINADA A PRODUCCIÓN DE VINO', 'SI', 1, 'SI'),
(11313, 133, 'CULTIVO DE UVA DE MESA', 'SI', 1, 'SI'),
(11321, 133, 'CULTIVO DE FRUTALES EN ÁRBOLES O ARBUSTOS CON CICLO DE VIDA MAYOR A UNA TEMPORADA', 'SI', 1, 'SI'),
(11322, 133, 'CULTIVO DE FRUTALES MENORES EN PLANTAS CON CICLO DE VIDA DE UNA TEMPORADA', 'SI', 1, 'SI'),
(11330, 133, 'CULTIVO DE PLANTAS CUYAS HOJAS O FRUTAS SE UTILIZAN PARA PREPARAR BEBIDAS', 'SI', 1, 'SI'),
(11340, 133, 'CULTIVO DE ESPECIAS', 'SI', 1, 'SI'),
(12111, 1, 'CRÍA DE GANADO BOVINO PARA LA PRODUCCIÓN LECHERA', 'SI', 1, 'SI'),
(12112, 1, 'CRÍA DE GANADO PARA PRODUCCIÓN DE CARNE, O COMO GANADO REPRODUCTOR', 'SI', 1, 'SI'),
(12120, 1, 'CRÍA DE GANADO OVINO Y/O EXPLOTACIÓN LANERA', 'SI', 1, 'SI'),
(12130, 1, 'CRÍA DE EQUINOS (CABALLARES, MULARES);', 'SI', 1, 'SI'),
(12210, 1, 'CRÍA DE PORCINOS', 'SI', 1, 'SI'),
(12221, 1, 'CRÍA DE AVES DE CORRAL PARA LA PRODUCCIÓN DE CARNE', 'SI', 1, 'SI'),
(12222, 1, 'CRÍA DE AVES DE CORRAL PARA LA PRODUCCIÓN DE HUEVOS', 'SI', 1, 'SI'),
(12223, 1, 'CRÍA DE AVES FINAS O NO TRADICIONALES', 'SI', 1, 'SI'),
(12230, 1, 'CRÍA DE ANIMALES DOMÉSTICOS; PERROS Y GATOS', 'SI', 1, 'SI'),
(12240, 1, 'APICULTURA', 'SI', 1, 'SI'),
(12250, 1, 'RANICULTURA, HELICICULTURA U OTRA ACTIVIDAD CON ANIMALES MENORES O INSECTOS', 'SI', 1, 'SI'),
(12290, 1, 'OTRAS EXPLOTACIONES DE ANIMALES NO CLASIFICADOS EN OTRA PARTE, INCLUIDO SUS SUBPRODUCTOS', 'SI', 1, 'SI'),
(13000, 2, 'EXPLOTACIÓN MIXTA', 'SI', 1, 'SI'),
(14011, 3, 'SERVICIO DE CORTE Y ENFARDADO DE FORRAJE', 'SI', 1, 'SI'),
(14012, 3, 'SERVICIO DE RECOLECCIÓN, EMPACADO, TRILLA, DESCASCARAMIENTO Y DESGRANE; Y SIMILARES', 'SI', 1, 'SI'),
(14013, 3, 'SERVICIO DE ROTURACIÓN SIEMBRA Y SIMILARES', 'SI', 1, 'SI'),
(14014, 3, 'DESTRUCCIÓN DE PLAGAS; PULVERIZACIONES, FUMIGACIONES U OTRAS', 'SI', 1, 'SI'),
(14015, 3, 'COSECHA, PODA, AMARRE Y LABORES DE ADECUACIÓN DE LA PLANTA U OTRAS', 'SI', 1, 'SI'),
(14019, 3, 'OTROS SERVICIOS AGRÍCOLAS N.C.P.', 'SI', 1, 'SI'),
(14021, 3, 'SERVICIOS DE ADIESTRAMIENTO, GUARDERÍA Y CUIDADOS DE MASCOTAS; EXCEPTO ACTIVIDADES VETERINARIAS', 'SI', 1, 'SI'),
(14022, 3, 'SERVICIOS GANADEROS, EXCEPTO ACTIVIDADES VETERINARIAS', 'SI', 1, 'SI'),
(15010, 4, 'CAZA DE MAMÍFEROS MARINOS; EXCEPTO BALLENAS', 'SI', 1, 'SI'),
(15090, 4, 'CAZA ORDINARIA Y MEDIANTE TRAMPAS, Y ACTIVIDADES DE SERVICIOS CONEXAS', 'SI', 1, 'SI'),
(20010, 5, 'EXPLOTACIÓN DE BOSQUES', 'SI', 1, 'SI'),
(20020, 5, 'RECOLECCIÓN DE PRODUCTOS FORESTALES SILVESTRES', 'SI', 1, 'SI'),
(20030, 5, 'EXPLOTACIÓN DE VIVEROS DE ESPECIES FORESTALES', 'SI', 1, 'SI'),
(20041, 5, 'SERVICIOS DE FORESTACIÓN', 'SI', 1, 'SI'),
(20042, 5, 'SERVICIOS DE CORTA DE MADERA', 'SI', 1, 'SI'),
(20043, 5, 'SERVICIOS DE CONTROL DE INCENDIOS FORESTALES', 'SI', 1, 'SI'),
(20049, 5, 'OTRAS ACTIVIDADES DE SERVICIOS CONEXAS A LA SILVICULTURA N.C.P.', 'SI', 1, 'SI'),
(51010, 6, 'CULTIVO DE ESPECIES ACUÁTICAS EN CUERPO DE AGUA DULCE', 'SI', 1, 'SI'),
(51020, 6, 'REPRODUCCIÓN Y CRIANZAS DE PECES MARINOS', 'SI', 1, 'SI'),
(51030, 6, 'CULTIVO, REPRODUCCIÓN Y CRECIMIENTOS DE VEGETALES ACUÁTICOS', 'SI', 1, 'SI'),
(51040, 6, 'REPRODUCCIÓN Y CRÍA DE MOLUSCOS Y CRUSTACEOS.', 'SI', 1, 'SI'),
(51090, 6, 'SERVICIOS RELACIONADOS CON LA ACUICULTURA, NO INCLUYE SERVICIOS PROFESIONALES Y DE EXTRACCIÓN', 'SI', 1, 'SI'),
(52010, 7, 'PESCA INDUSTRIAL', 'SI', 1, 'SI'),
(52020, 7, 'ACTIVIDAD PESQUERA DE BARCOS FACTORÍAS', 'SI', 1, 'SI'),
(52030, 7, 'PESCA ARTESANAL. EXTRACCIÓN DE RECURSOS ACUÁTICOS EN GENERAL; INCLUYE BALLENAS', 'SI', 1, 'SI'),
(52040, 7, 'RECOLECCIÓN DE PRODUCTOS MARINOS, COMO PERLAS NATURALES, ESPONJAS, CORALES Y ALGAS.', 'SI', 1, 'SI'),
(52050, 7, 'SERVICIOS RELACIONADOS CON LA PESCA, NO INCLUYE SERVICIOS PROFESIONALES', 'SI', 1, 'SI'),
(100000, 8, 'EXTRACCIÓN, AGLOMERACIÓN DE CARBÓN DE PIEDRA, LIGNITO Y TURBA', 'SI', 1, 'SI'),
(111000, 9, 'EXTRACCIÓN DE PETRÓLEO CRUDO Y GAS NATURAL', 'SI', 1, 'SI'),
(112000, 9, 'ACTIVIDADES DE SERVICIOS RELACIONADAS CON LA EXTRACCIÓN DE PETRÓLEO Y GAS', 'SI', 1, 'SI'),
(120000, 10, 'EXTRACCIÓN DE MINERALES DE URANIO Y TORIO', 'SI', 1, 'SI'),
(131000, 10, 'EXTRACCIÓN DE MINERALES DE HIERRO', 'SI', 1, 'SI'),
(132010, 10, 'EXTRACCIÓN DE ORO Y PLATA', 'SI', 1, 'SI'),
(132020, 10, 'EXTRACCIÓN DE ZINC Y PLOMO', 'SI', 1, 'SI'),
(132030, 10, 'EXTRACCIÓN DE MANGANESO', 'SI', 1, 'SI'),
(132090, 10, 'EXTRACCIÓN DE OTROS MINERALES METALÍFEROS N.C.P.', 'SI', 1, 'SI'),
(133000, 10, 'EXTRACCIÓN DE COBRE', 'SI', 1, 'SI'),
(141000, 11, 'EXTRACCIÓN DE PIEDRA, ARENA Y ARCILLA', 'SI', 1, 'SI'),
(142100, 11, 'EXTRACCIÓN DE NITRATOS Y YODO', 'SI', 1, 'SI'),
(142200, 11, 'EXTRACCIÓN DE SAL', 'SI', 1, 'SI'),
(142300, 11, 'EXTRACCIÓN DE LITIO Y CLORUROS, EXCEPTO SAL', 'SI', 1, 'SI'),
(142900, 11, 'EXPLOTACIÓN DE OTRAS MINAS Y CANTERAS N.C.P.', 'SI', 1, 'SI'),
(151110, 12, 'PRODUCCIÓN, PROCESAMIENTO DE CARNES ROJAS Y PRODUCTOS CÁRNICOS', 'SI', 1, 'SI'),
(151120, 12, 'CONSERVACIÓN DE CARNES ROJAS (FRIGORÍFICOS);', 'SI', 1, 'SI'),
(151130, 12, 'PRODUCCIÓN, PROCESAMIENTO Y CONSERVACIÓN DE CARNES DE AVE Y OTRAS CARNES DISTINTAS A LAS ROJAS', 'SI', 1, 'SI'),
(151140, 12, 'ELABORACIÓN DE CECINAS, EMBUTIDOS Y CARNES EN CONSERVA.', 'SI', 1, 'SI'),
(151210, 12, 'PRODUCCIÓN DE HARINA DE PESCADO', 'SI', 1, 'SI'),
(151221, 12, 'FABRICACIÓN DE PRODUCTOS ENLATADOS DE PESCADO Y MARISCOS', 'SI', 1, 'SI'),
(151222, 12, 'ELABORACIÓN DE CONGELADOS DE PESCADOS Y MARISCOS', 'SI', 1, 'SI'),
(151223, 12, 'ELABORACIÓN DE PRODUCTOS AHUMADOS, SALADOS, DESHIDRATADOS Y OTROS PROCESOS SIMILARES', 'SI', 1, 'SI'),
(151230, 12, 'ELABORACIÓN DE PRODUCTOS EN BASE A VEGETALES ACUÁTICOS', 'SI', 1, 'SI'),
(151300, 12, 'ELABORACIÓN Y CONSERVACIÓN DE FRUTAS, LEGUMBRES Y HORTALIZAS', 'SI', 1, 'SI'),
(151410, 12, 'ELABORACIÓN DE ACEITES Y GRASAS DE ORIGEN VEGETAL', 'SI', 1, 'SI'),
(151420, 12, 'ELABORACIÓN DE ACEITES Y GRASAS DE ORIGEN ANIMAL, EXCEPTO LAS MANTEQUILLAS', 'SI', 1, 'SI'),
(151430, 12, 'ELABORACIÓN DE ACEITES Y GRASAS DE ORIGEN MARINO', 'SI', 1, 'SI'),
(152010, 13, 'ELABORACIÓN DE LECHE, MANTEQUILLA, PRODUCTOS LÁCTEOS Y DERIVADOS', 'SI', 1, 'SI'),
(152020, 13, 'ELABORACIÓN DE QUESOS', 'SI', 1, 'SI'),
(152030, 13, 'FABRICACIÓN DE POSTRES A BASE DE LECHE (HELADOS, SORBETES Y OTROS SIMILARES);', 'SI', 1, 'SI'),
(153110, 14, 'ELABORACIÓN DE HARINAS DE TRIGO', 'SI', 1, 'SI'),
(153120, 14, 'ACTIVIDADES DE MOLIENDA DE ARROZ', 'SI', 1, 'SI'),
(153190, 14, 'ELABORACIÓN DE OTRAS MOLINERAS Y ALIMENTOS A BASE DE CEREALES', 'SI', 1, 'SI'),
(153210, 14, 'ELABORACIÓN DE ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDÓN', 'SI', 1, 'SI'),
(153220, 14, 'ELABORACIÓN DE GLUCOSA Y OTROS AZÚCARES DIFERENTES DE LA REMOLACHA', 'SI', 1, 'SI'),
(153300, 14, 'ELABORACIÓN DE ALIMENTOS PREPARADOS PARA ANIMALES', 'SI', 1, 'SI'),
(154110, 15, 'FABRICACIÓN DE PAN, PRODUCTOS DE PANADERÍA Y PASTELERÍA', 'SI', 1, 'SI'),
(154120, 15, 'FABRICACIÓN DE GALLETAS', 'SI', 1, 'SI'),
(154200, 15, 'ELABORACIÓN DE AZÚCAR DE REMOLACHA O CANA', 'SI', 1, 'SI'),
(154310, 15, 'ELABORACIÓN DE CACAO Y CHOCOLATES', 'SI', 1, 'SI'),
(154320, 15, 'FABRICACIÓN DE PRODUCTOS DE CONFITERÍA', 'SI', 1, 'SI'),
(154400, 15, 'ELABORACIÓN DE MACARRONES, FIDEOS, ALCUZCUZ Y PRODUCTOS FARINACEOS SIMILARES', 'SI', 1, 'SI'),
(154910, 15, 'ELABORACIÓN DE TE, CAFÉ, INFUSIONES', 'SI', 1, 'SI'),
(154920, 15, 'ELABORACIÓN DE LEVADURAS NATURALES O ARTIFICIALES', 'SI', 1, 'SI'),
(154930, 15, 'ELABORACIÓN DE VINAGRES, MOSTAZAS, MAYONESAS Y CONDIMENTOS EN GENERAL', 'SI', 1, 'SI'),
(154990, 15, 'ELABORACIÓN DE OTROS PRODUCTOS ALIMENTICIOS NO CLASIFICADOS EN OTRA PARTE', 'SI', 1, 'SI'),
(155110, 16, 'ELABORACIÓN DE PISCOS (INDUSTRIAS PISQUERAS);', 'SI', 1, 'SI'),
(155120, 16, 'ELABORACIÓN DE BEBIDAS ALCOHÓLICAS Y DE ALCOHOL ETÍLICO A PARTIR DE SUSTANCIAS FERMENTADAS Y OTROS', 'SI', 1, 'SI'),
(155200, 16, 'ELABORACIÓN DE VINOS', 'SI', 1, 'SI'),
(155300, 16, 'ELABORACIÓN DE BEBIDAS MALTEADAS, CERVEZAS Y MALTAS', 'SI', 1, 'SI'),
(155410, 16, 'ELABORACIÓN DE BEBIDAS NO ALCOHÓLICAS', 'SI', 1, 'SI'),
(155420, 16, 'ENVASADO DE AGUA MINERAL NATURAL, DE MANANTIAL Y POTABLE PREPARADA', 'SI', 1, 'SI'),
(155430, 16, 'ELABORACIÓN DE HIELO', 'SI', 1, 'SI'),
(160010, 17, 'FABRICACIÓN DE CIGARROS Y CIGARRILLOS', 'SI', 1, 'SI'),
(160090, 17, 'FABRICACIÓN DE OTROS PRODUCTOS DEL TABACO', 'SI', 1, 'SI'),
(171100, 18, 'PREPARACIÓN DE HILATURA DE FIBRAS TEXTILES; TEJEDURA PROD. TEXTILES', 'SI', 1, 'SI'),
(171200, 18, 'ACABADO DE PRODUCTOS TEXTIL', 'SI', 1, 'SI'),
(172100, 19, 'FABRICACIÓN DE ARTÍCULOS CONFECCIONADOS DE MATERIAS TEXTILES, EXCEPTO PRENDAS DE VESTIR', 'SI', 1, 'SI'),
(172200, 19, 'FABRICACIÓN DE TAPICES Y ALFOMBRA', 'SI', 1, 'SI'),
(172300, 19, 'FABRICACIÓN DE CUERDAS, CORDELES, BRAMANTES Y REDES', 'SI', 1, 'SI'),
(172910, 19, 'FABRICACIÓN DE TEJIDOS DE USO INDUSTRIAL COMO TEJIDOS IMPREGNADOS, MOLTOPRENE, BATISTA, ETC.', 'SI', 1, 'SI'),
(172990, 19, 'FABRICACIÓN DE OTROS PRODUCTOS TEXTILES N.C.P.', 'SI', 1, 'SI'),
(173000, 20, 'FABRICACIÓN DE TEJIDOS DE PUNTO', 'SI', 1, 'SI'),
(181010, 21, 'FABRICACIÓN DE PRENDAS DE VESTIR TEXTILES Y SIMILARES', 'SI', 1, 'SI'),
(181020, 21, 'FABRICACIÓN DE PRENDAS DE VESTIR DE CUERO NATURAL, ARTIFICIAL, PLÁSTICO', 'SI', 1, 'SI'),
(181030, 21, 'FABRICACIÓN DE ACCESORIOS DE VESTIR', 'SI', 1, 'SI'),
(181040, 21, 'FABRICACIÓN DE ROPA DE TRABAJO', 'SI', 1, 'SI'),
(182000, 22, 'ADOBO Y TENIDOS DE PIELES; FABRICACIÓN DE ARTÍCULOS DE PIEL', 'SI', 1, 'SI'),
(191100, 22, 'CURTIDO Y ADOBO DE CUEROS', 'SI', 1, 'SI'),
(191200, 22, 'FABRICACIÓN DE MALETAS, BOLSOS DE MANO Y SIMILARES; ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA', 'SI', 1, 'SI'),
(192000, 23, 'FABRICACIÓN DE CALZADO', 'SI', 1, 'SI'),
(201000, 24, 'ASERRADO Y ACEPILLADURA DE MADERAS', 'SI', 1, 'SI'),
(202100, 25, 'FABRICACIÓN DE TABLEROS, PANELES Y HOJAS DE MADERA PARA ENCHAPADO', 'SI', 1, 'SI'),
(202200, 25, 'FABRICACIÓN DE PARTES Y PIEZAS DE CARPINTERÍA PARA EDIFICIOS Y CONSTRUCCIONES', 'SI', 1, 'SI'),
(202300, 25, 'FABRICACIÓN DE RECIPIENTES DE MADERA', 'SI', 1, 'SI'),
(202900, 25, 'FABRICACIÓN DE OTROS PRODUCTOS DE MADERA; ARTÍCULOS DE CORCHO, PAJA Y MATERIALES TRENZABLES', 'SI', 1, 'SI'),
(210110, 26, 'FABRICACIÓN DE CELULOSA Y OTRAS PASTAS DE MADERA', 'SI', 1, 'SI'),
(210121, 26, 'FABRICACIÓN DE PAPEL DE PERIÓDICO', 'SI', 1, 'SI'),
(210129, 26, 'FABRICACIÓN DE PAPEL Y CARTÓN N.C.P.', 'SI', 1, 'SI'),
(210200, 26, 'FABRICACIÓN DE PAPEL Y CARTÓN ONDULADO Y DE ENVASES DE PAPEL Y CARTÓN', 'SI', 1, 'SI'),
(210900, 26, 'FABRICACIÓN DE OTROS ARTÍCULOS DE PAPEL Y CARTÓN', 'SI', 1, 'SI'),
(221101, 27, 'EDICIÓN PRINCIPALMENTE DE LIBROS', 'SI', 1, 'SI'),
(221109, 27, 'EDICIÓN DE FOLLETOS, PARTITURAS Y OTRAS PUBLICACIONES', 'SI', 1, 'SI'),
(221200, 27, 'EDICIÓN DE PERIÓDICOS, REVISTAS Y PUBLICACIONES PERIÓDICAS', 'SI', 1, 'SI'),
(221300, 27, 'EDICIÓN DE GRABACIONES', 'SI', 1, 'SI'),
(221900, 27, 'OTRAS ACTIVIDADES DE EDICIÓN', 'SI', 1, 'SI'),
(222101, 28, 'IMPRESIÓN PRINCIPALMENTE DE LIBROS', 'SI', 1, 'SI'),
(222109, 28, 'OTRAS ACTIVIDADES DE IMPRESIÓN N.C.P.', 'SI', 1, 'SI'),
(222200, 28, 'ACTIVIDADES DE SERVICIO RELACIONADA CON LA IMPRESIÓN', 'SI', 1, 'SI'),
(223000, 28, 'REPRODUCCIÓN DE GRABACIONES', 'SI', 1, 'SI'),
(231000, 29, 'FABRICACIÓN DE PRODUCTOS DE HORNOS COQUE', 'SI', 1, 'SI'),
(232000, 29, 'FABRICACIÓN DE PRODUCTOS DE REFINACIÓN DE PETRÓLEO', 'SI', 1, 'SI'),
(233000, 30, 'ELABORACIÓN DE COMBUSTIBLE NUCLEAR', 'SI', 1, 'SI'),
(241110, 31, 'FABRICACIÓN DE CARBÓN VEGETAL, Y BRIQUETAS DE CARBÓN VEGETAL', 'SI', 1, 'SI'),
(241190, 31, 'FABRICACIÓN DE SUSTANCIAS QUÍMICAS BÁSICAS, EXCEPTO ABONOS Y COMPUESTOS DE NITRÓGENO', 'SI', 1, 'SI'),
(241200, 31, 'FABRICACIÓN DE ABONOS Y COMPUESTOS DE NITRÓGENO', 'SI', 1, 'SI'),
(241300, 31, 'FABRICACIÓN DE PLÁSTICOS EN FORMAS PRIMARIAS Y DE CAUCHO SINTÉTICO', 'SI', 1, 'SI'),
(242100, 32, 'FABRICACIÓN DE PLAGUICIDAS Y OTROS PRODUCTOS QUÍMICOS DE USO AGROPECUARIO', 'SI', 1, 'SI'),
(242200, 32, 'FABRICACIÓN DE PINTURAS, BARNICES Y PRODUCTOS DE REVESTIMIENTO SIMILARES', 'SI', 1, 'SI'),
(242300, 32, 'FABRICACIÓN DE PRODUCTOS FARMACEUTICOS, SUSTANCIAS QUÍMICAS MEDICINALES Y PRODUCTOS BOTÁNICOS', 'SI', 1, 'SI'),
(242400, 32, 'FABRICACIONES DE JABONES Y DETERGENTES, PREPARADOS PARA LIMPIAR, PERFUMES Y PREPARADOS DE TOCADOR', 'SI', 1, 'SI'),
(242910, 32, 'FABRICACIÓN DE EXPLOSIVOS Y PRODUCTOS DE PIROTECNIA', 'SI', 1, 'SI'),
(242990, 32, 'FABRICACIÓN DE OTROS PRODUCTOS QUÍMICOS N.C.P.', 'SI', 1, 'SI'),
(243000, 33, 'FABRICACIÓN DE FIBRAS MANUFACTURADAS', 'SI', 1, 'SI'),
(251110, 34, 'FABRICACIÓN DE CUBIERTAS Y CÁMARAS DE CAUCHO', 'SI', 1, 'SI'),
(251120, 34, 'RECAUCHADO Y RENOVACIÓN DE CUBIERTAS DE CAUCHO', 'SI', 1, 'SI'),
(251900, 34, 'FABRICACIÓN DE OTROS PRODUCTOS DE CAUCHO', 'SI', 1, 'SI'),
(252010, 35, 'FABRICACIÓN DE PLANCHAS, LÁMINAS, CINTAS, TIRAS DE PLÁSTICO', 'SI', 1, 'SI'),
(252020, 35, 'FABRICACIÓN DE TUBOS, MANGUERAS PARA LA CONSTRUCCIÓN', 'SI', 1, 'SI'),
(252090, 35, 'FABRICACIÓN DE OTROS ARTÍCULOS DE PLÁSTICO', 'SI', 1, 'SI'),
(261010, 36, 'FABRICACIÓN, MANIPULADO Y TRANSFORMACIÓN DE VIDRIO PLANO', 'SI', 1, 'SI'),
(261020, 36, 'FABRICACIÓN DE VIDRIO HUECO', 'SI', 1, 'SI'),
(261030, 36, 'FABRICACIÓN DE FIBRAS DE VIDRIO', 'SI', 1, 'SI'),
(261090, 36, 'FABRICACIÓN DE ARTÍCULOS DE VIDRIO N.C.P.', 'SI', 1, 'SI'),
(269101, 37, 'FABRICACIÓN DE PRODUCTOS DE CERÁMICA NO REFRACTARIA PARA USO NO ESTRUCTURAL CON FINES ORNAMENTALES', 'SI', 1, 'SI'),
(269109, 37, 'FABRICACIÓN DE PRODUCTOS DE CERÁMICA NO REFRACTARIA PARA USO NO ESTRUCTURAL N.C.P.', 'SI', 1, 'SI'),
(269200, 37, 'FABRICACIÓN DE PRODUCTOS DE CERÁMICAS REFRACTARIA', 'SI', 1, 'SI'),
(269300, 37, 'FABRICACIÓN DE PRODUCTOS DE ARCILLA Y CERÁMICAS NO REFRACTARIAS PARA USO ESTRUCTURAL', 'SI', 1, 'SI'),
(269400, 37, 'FABRICACIÓN DE CEMENTO, CAL Y YESO', 'SI', 1, 'SI'),
(269510, 37, 'ELABORACIÓN DE HORMIGÓN, ARTÍCULOS DE HORMIGÓN Y MORTERO (MEZCLA PARA CONSTRUCCIÓN);', 'SI', 1, 'SI'),
(269520, 37, 'FABRICACIÓN DE PRODUCTOS DE FIBROCEMENTO Y ASBESTOCEMENTO', 'SI', 1, 'SI'),
(269530, 37, 'FABRICACIÓN DE PANELES DE YESO PARA LA CONSTRUCCIÓN', 'SI', 1, 'SI'),
(269590, 37, 'FABRICACIÓN DE ARTÍCULOS DE CEMENTO Y YESO N.C.P.', 'SI', 1, 'SI'),
(269600, 37, 'CORTE, TALLADO Y ACABADO DE LA PIEDRA', 'SI', 1, 'SI'),
(269910, 37, 'FABRICACIÓN DE MEZCLAS BITUMINOSAS A BASE DE ASFALTO, DE BETUNES NATURALES, Y PRODUCTOS SIMILARES', 'SI', 1, 'SI'),
(269990, 37, 'FABRICACIÓN DE OTROS PRODUCTOS MINERALES NO METÁLICOS N.C.P', 'SI', 1, 'SI'),
(271000, 38, 'INDUSTRIAS BASICAS DE HIERRO Y ACERO', 'SI', 1, 'SI'),
(272010, 39, 'ELABORACIÓN DE PRODUCTOS DE COBRE EN FORMAS PRIMARIAS.', 'SI', 1, 'SI'),
(272020, 39, 'ELABORACIÓN DE PRODUCTOS DE ALUMINIO EN FORMAS PRIMARIAS', 'SI', 1, 'SI'),
(272090, 39, 'FABRICACIÓN DE PRODUCTOS PRIMARIOS DE METALES PRECIOSOS Y DE OTROS METALES NO FERROSOS N.C.P.', 'SI', 1, 'SI'),
(273100, 40, 'FUNDICIÓN DE HIERRO Y ACERO', 'SI', 1, 'SI'),
(273200, 40, 'FUNDICIÓN DE METALES NO FERROSOS', 'SI', 1, 'SI'),
(281100, 41, 'FABRICACIÓN DE PRODUCTOS METÁLICOS DE USO ESTRUCTURAL', 'SI', 1, 'SI'),
(281211, 41, 'FABRICACIÓN DE RECIPIENTES DE GAS COMPRIMIDO O LICUADO', 'SI', 1, 'SI'),
(281219, 41, 'FABRICACIÓN DE TANQUES, DEPÓSITOS Y RECIPIENTES DE METAL N.C.P.', 'SI', 1, 'SI'),
(281280, 41, 'REPARACIÓN DE TANQUES, DEPÓSITOS Y RECIPIENTES DE METAL', 'SI', 1, 'SI'),
(281310, 41, 'FABRICACIÓN DE GENERADORES DE VAPOR, EXCEPTO CALDERAS DE AGUA CALIENTE PARA CALEFACCIÓN', 'SI', 1, 'SI'),
(281380, 41, 'REPARACIÓN DE GENERADORES DE VAPOR, EXCEPTO CALDERAS DE AGUA CALIENTE PARA CALEFACCIÓN CENTRAL', 'SI', 1, 'SI'),
(289100, 42, 'FORJA, PRENSADO, ESTAMPADO Y LAMINADO DE METAL; INCLUYE PULVIMETALURGIA', 'SI', 1, 'SI'),
(289200, 42, 'TRATAMIENTOS Y REVESTIMIENTOS DE METALES; OBRAS DE INGENIERÍA MECÁNICA EN GENERAL', 'SI', 1, 'SI'),
(289310, 42, 'FABRICACIÓN DE ARTÍCULOS DE CUCHILLERÍA', 'SI', 1, 'SI'),
(289320, 42, 'FABRICACIÓN DE HERRAMIENTAS DE MANO Y ARTÍCULOS DE FERRETERÍA', 'SI', 1, 'SI'),
(289910, 42, 'FABRICACIÓN DE CABLES, ALAMBRES Y PRODUCTOS DE ALAMBRE', 'SI', 1, 'SI'),
(289990, 42, 'FABRICACIÓN DE OTROS PRODUCTOS ELABORADOS DE METAL N.C.P.', 'SI', 1, 'SI'),
(291110, 43, 'FABRICACIÓN DE MOTORES Y TURBINAS, EXCEPTO PARA AERONAVES, VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', 'SI', 1, 'SI'),
(291180, 43, 'REPARACIÓN DE MOTORES Y TURBINAS, EXCEPTO PARA AERONAVES, VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', 'SI', 1, 'SI'),
(291210, 43, 'FABRICACIÓN DE BOMBAS, GRIFOS, VÁLVULAS, COMPRESORES, SISTEMAS HIDRÁULICOS', 'SI', 1, 'SI'),
(291280, 43, 'REPARACIÓN DE BOMBAS, COMPRESORES, SISTEMAS HIDRÁULICOS, VÁLVULAS Y ARTÍCULOS DE GRIFERÍA', 'SI', 1, 'SI'),
(291310, 43, 'FABRICACIÓN DE COJINETES, ENGRANAJES, TRENES DE ENGRANAJES Y PIEZAS DE TRANSMISIÓN', 'SI', 1, 'SI'),
(291380, 43, 'REPARACIÓN DE COJINETES, ENGRANAJES, TRENES DE ENGRANAJES Y PIEZAS DE TRANSMISIÓN', 'SI', 1, 'SI'),
(291410, 43, 'FABRICACIÓN DE HORNOS, HOGARES Y QUEMADORES', 'SI', 1, 'SI'),
(291480, 43, 'REPARACIÓN DE HORNOS, HOGARES Y QUEMADORES', 'SI', 1, 'SI'),
(291510, 43, 'FABRICACIÓN DE EQUIPO DE ELEVACIÓN Y MANIPULACIÓN', 'SI', 1, 'SI'),
(291580, 43, 'REPARACIÓN DE EQUIPO DE ELEVACIÓN Y MANIPULACIÓN', 'SI', 1, 'SI'),
(291910, 43, 'FABRICACIÓN DE OTRO TIPO DE MAQUINARIAS DE USO GENERAL', 'SI', 1, 'SI'),
(291980, 43, 'REPARACIÓN OTROS TIPOS DE MAQUINARIA Y EQUIPOS DE USO GENERAL', 'SI', 1, 'SI'),
(292110, 44, 'FABRICACIÓN DE MAQUINARIA AGROPECUARIA Y FORESTAL', 'SI', 1, 'SI'),
(292180, 44, 'REPARACIÓN DE MAQUINARIA AGROPECUARIA Y FORESTAL', 'SI', 1, 'SI'),
(292210, 44, 'FABRICACIÓN DE MÁQUINAS HERRAMIENTAS', 'SI', 1, 'SI'),
(292280, 44, 'REPARACIÓN DE MÁQUINAS HERRAMIENTAS', 'SI', 1, 'SI'),
(292310, 44, 'FABRICACIÓN DE MAQUINARIA METALÚRGICA', 'SI', 1, 'SI'),
(292380, 44, 'REPARACIÓN DE MAQUINARIA PARA LA INDUSTRIA METALÚRGICA', 'SI', 1, 'SI'),
(292411, 44, 'FABRICACIÓN DE MAQUINARIA PARA MINAS Y CANTERAS Y PARA OBRAS DE CONSTRUCCIÓN', 'SI', 1, 'SI'),
(292412, 44, 'FABRICACIÓN DE PARTES PARA MÁQUINAS DE SONDEO O PERFORACIÓN', 'SI', 1, 'SI'),
(292480, 44, 'REPARACIÓN DE MAQUINARIA PARA LA EXPLOTACIÓN DE PETRÓLEO, MINAS, CANTERAS, Y OBRAS DE CONSTRUCCIÓN', 'SI', 1, 'SI'),
(292510, 44, 'FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE ALIMENTOS, BEBIDAS Y TABACOS', 'SI', 1, 'SI'),
(292580, 44, 'REPARACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE ALIMENTOS, BEBIDAS Y TABACOS', 'SI', 1, 'SI'),
(292610, 44, 'FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE PRENDAS TEXTILES, PRENDAS DE VESTIR Y CUEROS', 'SI', 1, 'SI'),
(292680, 44, 'REPARACIÓN DE MAQUINARIA PARA LA INDUSTRIA TEXTIL, DE LA CONFECCIÓN, DEL CUERO Y DEL CALZADO', 'SI', 1, 'SI'),
(292710, 44, 'FABRICACIÓN DE ARMAS Y MUNICIONES', 'SI', 1, 'SI'),
(292780, 44, 'REPARACIÓN DE ARMAS', 'SI', 1, 'SI'),
(292910, 44, 'FABRICACIÓN DE OTROS TIPOS DE MAQUINARIAS DE USO ESPECIAL', 'SI', 1, 'SI'),
(292980, 44, 'REPARACIÓN DE OTROS TIPOS DE MAQUINARIA DE USO ESPECIAL', 'SI', 1, 'SI'),
(293000, 45, 'FABRICACIÓN DE APARATOS DE USO DOMÉSTICO N.C.P.', 'SI', 1, 'SI'),
(300010, 46, 'FABRICACIÓN Y ARMADO DE COMPUTADORES Y HARDWARE EN GENERAL', 'SI', 1, 'SI'),
(300020, 46, 'FABRICACIÓN DE MAQUINARIA DE OFICINA, CONTABILIDAD, N.C.P.', 'SI', 1, 'SI'),
(311010, 47, 'FABRICACIÓN DE MOTORES, GENERADORES Y TRANSFORMADORES ELÉCTRICOS', 'SI', 1, 'SI'),
(311080, 47, 'REPARACIÓN DE MOTORES, GENERADORES Y TRANSFORMADORES ELÉCTRICOS', 'SI', 1, 'SI'),
(312010, 48, 'FABRICACIÓN DE APARATOS DE DISTRIBUCIÓN Y CONTROL', 'SI', 1, 'SI'),
(312080, 48, 'REPARACIÓN DE APARATOS DE DISTRIBUCIÓN Y CONTROL', 'SI', 1, 'SI'),
(313000, 49, 'FABRICACIÓN DE HILOS Y CABLES AISLADOS', 'SI', 1, 'SI'),
(314000, 50, 'FABRICACIÓN DE ACUMULADORES DE PILAS Y BATERÍAS PRIMARIAS', 'SI', 1, 'SI'),
(315010, 51, 'FABRICACIÓN DE LÁMPARAS Y EQUIPO DE ILUMINACIÓN', 'SI', 1, 'SI'),
(315080, 51, 'REPARACIÓN DE EQUIPO DE ILUMINACIÓN', 'SI', 1, 'SI'),
(319010, 52, 'FABRICACIÓN DE OTROS TIPOS DE EQUIPO ELÉCTRICO N.C.P.', 'SI', 1, 'SI'),
(319080, 52, 'REPARACIÓN DE OTROS TIPOS DE EQUIPO ELÉCTRICO N.C.P.', 'SI', 1, 'SI'),
(321010, 53, 'FABRICACIÓN DE COMPONENTES ELECTRÓNICOS', 'SI', 1, 'SI'),
(321080, 53, 'REPARACIÓN DE COMPONENTES ELECTRÓNICOS', 'SI', 1, 'SI'),
(322010, 54, 'FABRICACIÓN DE TRANSMISORES DE RADIO Y TELEVISIÓN, APARATOS PARA TELEFONÍA Y TELEGRAFÍA CON HILOS', 'SI', 1, 'SI'),
(322080, 54, 'REPARACIÓN DE TRANSMISORES DE RADIO Y TELEVISIÓN, APARATOS PARA TELEFONÍA Y TELEGRAFÍA CON HILOS', 'SI', 1, 'SI'),
(323000, 55, 'FABRICACIÓN DE RECEPTORES (RADIO Y TV);; APARATOS DE GRABACIÓN Y REPRODUCCIÓN (AUDIO Y VIDEO);', 'SI', 1, 'SI'),
(331110, 56, 'FABRICACIÓN DE EQUIPO MÉDICO Y QUIRÚRGICO, Y DE APARATOS ORTOPÉDICOS', 'SI', 1, 'SI'),
(331120, 56, 'LABORATORIOS DENTALES', 'SI', 1, 'SI'),
(331180, 56, 'REPARACIÓN DE EQUIPO MÉDICO Y QUIRÚRGICO, Y DE APARATOS ORTOPÉDICOS', 'SI', 1, 'SI'),
(331210, 56, 'FABRICACIÓN DE INSTRUMENTOS Y APARATOS PARA MEDIR, VERIFICAR, ENSAYAR, NAVEGAR Y OTROS FINES', 'SI', 1, 'SI'),
(331280, 56, 'REPARACIÓN DE INSTRUMENTOS Y APARATOS PARA MEDIR, VERIFICAR, ENSAYAR, NAVEGAR Y OTROS FINES', 'SI', 1, 'SI'),
(331310, 56, 'FABRICACIÓN DE EQUIPOS DE CONTROL DE PROCESOS INDUSTRIALES', 'SI', 1, 'SI'),
(331380, 56, 'REPARACIÓN DE EQUIPOS DE CONTROL DE PROCESOS INDUSTRIALES', 'SI', 1, 'SI'),
(332010, 57, 'FABRICACIÓN Y/O REPARACIÓN DE LENTES Y ARTÍCULOS OFTALMOLÓGICOS', 'SI', 1, 'SI'),
(332020, 57, 'FABRICACIÓN DE INSTRUMENTOS DE OPTICA N.C.P. Y EQUIPOS FOTOGRÁFICOS', 'SI', 1, 'SI'),
(332080, 57, 'REPARACIÓN DE INSTRUMENTOS DE OPTICA N.C.P Y EQUIPO FOTOGRÁFICOS', 'SI', 1, 'SI'),
(333000, 58, 'FABRICACIÓN DE RELOJES', 'SI', 1, 'SI'),
(341000, 59, 'FABRICACIÓN DE VEHÍCULOS AUTOMOTORES', 'SI', 1, 'SI'),
(342000, 59, 'FABRICACIÓN DE CARROCERÍAS PARA VEHÍCULOS AUTOMOTORES; FABRICACIÓN DE REMOLQUES Y SEMI REMOLQUES', 'SI', 1, 'SI'),
(343000, 59, 'FABRICACIÓN DE PARTES Y ACCESORIOS PARA VEHÍCULOS AUTOMOTORES Y SUS MOTORES', 'SI', 1, 'SI'),
(351110, 60, 'CONSTRUCCIÓN Y REPARACIÓN DE BUQUES; ASTILLEROS', 'SI', 1, 'SI'),
(351120, 60, 'CONSTRUCCIÓN DE EMBARCACIONES MENORES', 'SI', 1, 'SI'),
(351180, 60, 'REPARACIÓN DE EMBARCACIONES MENORES', 'SI', 1, 'SI'),
(351210, 60, 'CONSTRUCCIÓN DE EMBARCACIONES DE RECREO Y DEPORTE', 'SI', 1, 'SI'),
(351280, 60, 'REPARACIÓN DE EMBARCACIONES DE RECREO Y DEPORTES', 'SI', 1, 'SI'),
(352000, 61, 'FABRICACIÓN DE LOCOMOTORAS Y DE MATERIAL RODANTE PARA FERROCARRILES Y TRANVÍAS', 'SI', 1, 'SI'),
(353010, 62, 'FABRICACIÓN DE AERONAVES Y NAVES ESPACIALES', 'SI', 1, 'SI'),
(353080, 62, 'REPARACIÓN DE AERONAVES Y NAVES ESPACIALES', 'SI', 1, 'SI'),
(359100, 63, 'FABRICACIÓN DE MOTOCICLETAS', 'SI', 1, 'SI'),
(359200, 63, 'FABRICACIÓN DE BICICLETAS Y DE SILLONES DE RUEDAS PARA INVALIDOS', 'SI', 1, 'SI'),
(359900, 63, 'FABRICACIÓN DE OTROS EQUIPOS DE TRANSPORTE N.C.P.', 'SI', 1, 'SI'),
(361010, 64, 'FABRICACIÓN DE MUEBLES PRINCIPALMENTE DE MADERA', 'SI', 1, 'SI'),
(361020, 64, 'FABRICACIÓN DE OTROS MUEBLES N.C.P., INCLUSO COLCHONES', 'SI', 1, 'SI'),
(369100, 65, 'FABRICACIÓN DE JOYAS Y PRODUCTOS CONEXOS', 'SI', 1, 'SI'),
(369200, 65, 'FABRICACIÓN DE INSTRUMENTOS DE MÚSICA', 'SI', 1, 'SI'),
(369300, 65, 'FABRICACIÓN DE ARTÍCULOS DE DEPORTE', 'SI', 1, 'SI'),
(369400, 65, 'FABRICACIÓN DE JUEGOS Y JUGUETES', 'SI', 1, 'SI'),
(369910, 65, 'FABRICACIÓN DE PLUMAS Y LÁPICES DE TODA CLASE Y ARTÍCULOS DE ESCRITORIO EN GENERAL', 'SI', 1, 'SI'),
(369920, 65, 'FABRICACIÓN DE BROCHAS, ESCOBAS Y CEPILLOS', 'SI', 1, 'SI'),
(369930, 65, 'FABRICACIÓN DE FÓSFOROS', 'SI', 1, 'SI'),
(369990, 65, 'FABRICACIÓN DE ARTÍCULOS DE OTRAS INDUSTRIAS N.C.P.', 'SI', 1, 'SI'),
(371000, 66, 'RECICLAMIENTO DE DESPERDICIOS Y DESECHOS METÁLICOS', 'SI', 1, 'SI'),
(372010, 66, 'RECICLAMIENTO DE PAPEL', 'SI', 1, 'SI'),
(372020, 66, 'RECICLAMIENTO DE VIDRIO', 'SI', 1, 'SI'),
(372090, 66, 'RECICLAMIENTO DE OTROS DESPERDICIOS Y DESECHOS N.C.P.', 'SI', 1, 'SI'),
(401011, 67, 'GENERACIÓN HIDROELÉCTRICA', 'SI', 1, 'SI'),
(401012, 67, 'GENERACIÓN EN CENTRALES TERMOELÉCTRICA DE CICLOS COMBINADOS', 'SI', 1, 'SI'),
(401013, 67, 'GENERACIÓN EN OTRAS CENTRALES TERMOELÉCTRICAS', 'SI', 1, 'SI'),
(401019, 67, 'GENERACIÓN EN OTRAS CENTRALES N.C.P.', 'SI', 1, 'SI'),
(401020, 67, 'TRANSMISIÓN DE ENERGÍA ELÉCTRICA', 'SI', 1, 'SI'),
(401030, 67, 'DISTRIBUCIÓN DE ENERGIA ELÉCTRICA', 'SI', 1, 'SI'),
(402000, 68, 'FABRICACIÓN DE GAS; DISTRIBUCIÓN DE COMBUSTIBLES GASEOSOS POR TUBERÍAS', 'SI', 1, 'SI'),
(403000, 69, 'SUMINISTRO DE VAPOR Y AGUA CALIENTE', 'SI', 1, 'SI'),
(410000, 70, 'CAPTACIÓN, DEPURACIÓN Y DISTRIBUCIÓN DE AGUA', 'ND', 1, 'SI'),
(451010, 71, 'PREPARACIÓN DEL TERRENO, EXCAVACIONES Y MOVIMIENTOS DE TIERRAS', 'SI', 1, 'SI'),
(451020, 71, 'SERVICIOS DE DEMOLICIÓN Y EL DERRIBO DE EDIFICIOS Y OTRAS ESTRUCTURAS', 'SI', 1, 'SI'),
(452010, 71, 'CONSTRUCCIÓN DE EDIFICIOS COMPLETOS O DE PARTES DE EDIFICIOS', 'SI', 1, 'SI'),
(452020, 71, 'OBRAS DE INGENIERÍA', 'SI', 1, 'SI'),
(453000, 71, 'ACONDICIONAMIENTO DE EDIFICIOS', 'SI', 1, 'SI'),
(454000, 71, 'OBRAS MENORES EN CONSTRUCCIÓN (CONTRATISTAS, ALBANILES, CARPINTEROS);', 'SI', 1, 'SI'),
(455000, 71, 'ALQUILER DE EQUIPO DE CONSTRUCCIÓN O DEMOLICIÓN DOTADO DE OPERARIOS', 'SI', 1, 'SI'),
(501010, 72, 'VENTA AL POR MAYOR DE VEHÍCULOS AUTOMOTORES (IMPORTACIÓN, DISTRIBUCIÓN*EXCEPTO MOTOCICLETAS', 'SI', 1, 'SI'),
(501020, 72, 'VENTA O COMPRAVENTA AL POR MENOR DE VEHÍCULOS AUTOMOTORES NUEVOS O USADOS; EXCEPTO MOTOCICLETAS', 'SI', 1, 'SI'),
(502010, 73, 'SERVICIO DE LAVADO DE VEHÍCULOS AUTOMOTORES', 'ND', 1, 'SI'),
(502020, 73, 'SERVICIOS DE REMOLQUE DE VEHÍCULOS (GRUAS);', 'SI', 1, 'SI'),
(502080, 73, 'MANTENIMIENTO Y REPARACIÓN DE VEHÍCULOS AUTOMOTORES', 'ND', 1, 'SI'),
(503000, 74, 'VENTA DE PARTES, PIEZAS Y ACCESORIOS DE VEHÍCULOS AUTOMOTORES', 'SI', 1, 'SI'),
(504010, 75, 'VENTA DE MOTOCICLETAS', 'SI', 1, 'SI'),
(504020, 75, 'VENTA DE PIEZAS Y ACCESORIOS DE MOTOCICLETAS', 'SI', 1, 'SI'),
(504080, 75, 'REPARACIÓN DE MOTOCICLETAS', 'ND', 1, 'SI'),
(505000, 76, 'VENTA AL POR MENOR DE COMBUSTIBLE PARA AUTOMOTORES', 'SI', 1, 'SI'),
(511010, 77, 'CORRETAJE DE PRODUCTOS AGRÍCOLAS', 'SI', 1, 'SI'),
(511020, 77, 'CORRETAJE DE GANADO (FERIAS DE GANADO);', 'SI', 1, 'SI'),
(511030, 77, 'OTROS TIPOS DE CORRETAJES O REMATES N.C.P. (NO INCLUYE SERVICIOS DE MARTILLERO);', 'SI', 1, 'SI'),
(512110, 78, 'VENTA AL POR MAYOR DE ANIMALES VIVOS', 'SI', 1, 'SI'),
(512120, 78, 'VENTA AL POR MAYOR DE PRODUCTOS PECUARIOS (LANAS, PIELES, CUEROS SIN PROCESAR);; EXCEPTO ALIMENTOS', 'SI', 1, 'SI'),
(512130, 78, 'VENTA AL POR MAYOR DE MATERIAS PRIMAS AGRÍCOLAS', 'SI', 1, 'SI'),
(512210, 78, 'MAYORISTA DE FRUTAS Y VERDURAS', 'SI', 1, 'SI'),
(512220, 78, 'MAYORISTAS DE CARNES', 'SI', 1, 'SI'),
(512230, 78, 'MAYORISTAS DE PRODUCTOS DEL MAR (PESCADO, MARISCOS, ALGAS);', 'SI', 1, 'SI'),
(512240, 78, 'MAYORISTAS DE VINOS Y BEBIDAS ALCOHÓLICAS Y DE FANTASÍA', 'SI', 1, 'SI'),
(512250, 78, 'VENTA AL POR MAYOR DE CONFITES', 'SI', 1, 'SI'),
(512260, 78, 'VENTA AL POR MAYOR DE TABACO Y PRODUCTOS DERIVADOS', 'SI', 1, 'SI'),
(512290, 78, 'VENTA AL POR MAYOR DE HUEVOS, LECHE, ABARROTES, Y OTROS ALIMENTOS N.C.P.', 'SI', 1, 'SI'),
(513100, 79, 'VENTA AL POR MAYOR DE PRODUCTOS TEXTILES, PRENDAS DE VESTIR Y CALZADO', 'SI', 1, 'SI'),
(513910, 79, 'VENTA AL POR MAYOR DE MUEBLES', 'SI', 1, 'SI'),
(513920, 79, 'VENTA AL POR MAYOR DE ARTÍCULOS ELÉCTRICOS Y ELECTRÓNICOS PARA EL HOGAR', 'SI', 1, 'SI'),
(513930, 79, 'VENTA AL POR MAYOR DE ARTÍCULOS DE PERFUMERÍA, COSMÉTICOS, JABONES Y PRODUCTOS DE LIMPIEZA', 'SI', 1, 'SI'),
(513940, 79, 'VENTA AL POR MAYOR DE PAPEL Y CARTÓN', 'SI', 1, 'SI'),
(513951, 79, 'VENTA AL POR MAYOR DE LIBROS', 'SI', 1, 'SI'),
(513952, 79, 'VENTA AL POR MAYOR DE REVISTAS Y PERIÓDICOS', 'SI', 1, 'SI'),
(513960, 79, 'VENTA AL POR MAYOR DE PRODUCTOS FARMACEUTICOS', 'SI', 1, 'SI'),
(513970, 79, 'VENTA AL POR MAYOR DE INSTRUMENTOS CIENTÍFICOS Y QUIRÚRGICOS', 'SI', 1, 'SI'),
(513990, 79, 'VENTA AL POR MAYOR DE OTROS ENSERES DOMÉSTICOS N.C.P.', 'SI', 1, 'SI'),
(514110, 80, 'VENTA AL POR MAYOR DE COMBUSTIBLES LÍQUIDOS', 'SI', 1, 'SI'),
(514120, 80, 'VENTA AL POR MAYOR DE COMBUSTIBLES SÓLIDOS', 'SI', 1, 'SI'),
(514130, 80, 'VENTA AL POR MAYOR DE COMBUSTIBLES GASEOSOS', 'SI', 1, 'SI'),
(514140, 80, 'VENTA AL POR MAYOR DE PRODUCTOS CONEXOS A LOS COMBUSTIBLES', 'SI', 1, 'SI'),
(514200, 80, 'VENTA AL POR MAYOR DE METALES Y MINERALES METALÍFEROS', 'SI', 1, 'SI'),
(514310, 80, 'VENTA AL POR MAYOR DE MADERA NO TRABAJADA Y PRODUCTOS RESULTANTES DE SU ELABORACIÓN PRIMARIA', 'SI', 1, 'SI'),
(514320, 80, 'VENTA AL POR MAYOR DE MATERIALES DE CONSTRUCCIÓN, ARTÍCULOS DE FERRETERÍA Y RELACIONADOS', 'SI', 1, 'SI'),
(514910, 80, 'VENTA AL POR MAYOR DE PRODUCTOS QUÍMICOS', 'SI', 1, 'SI'),
(514920, 80, 'VENTA AL POR MAYOR DE DESECHOS METÁLICOS (CHATARRA);', 'SI', 1, 'SI'),
(514930, 80, 'VENTA AL POR MAYOR DE INSUMOS VETERINARIOS', 'SI', 1, 'SI'),
(514990, 80, 'VENTA AL POR MAYOR DE OTROS PRODUCTOS INTERMEDIOS, DESPERDICIOS Y DESECHOS N.C.P.', 'SI', 1, 'NO'),
(515001, 81, 'VENTA AL POR MAYOR DE MAQUINARIA AGRÍCOLA Y FORESTAL', 'SI', 1, 'SI'),
(515002, 81, 'VENTA AL POR MAYOR DE MAQUINARIA METALÚRGICA', 'SI', 1, 'SI'),
(515003, 81, 'VENTA AL POR MAYOR DE MAQUINARIA PARA LA MINERÍA', 'SI', 1, 'SI'),
(515004, 81, 'VENTA AL POR MAYOR DE MAQUINARIA PARA LA CONSTRUCCIÓN', 'SI', 1, 'SI'),
(515005, 81, 'VENTA AL POR MAYOR DE MAQUINARIA PARA LA ELABORACIÓN DE ALIMENTOS, BEBIDAS Y TABACO', 'SI', 1, 'SI'),
(515006, 81, 'VENTA AL POR MAYOR DE MAQUINARIA PARA TEXTILES Y CUEROS', 'SI', 1, 'SI'),
(515007, 81, 'VENTA AL POR MAYOR DE MÁQUINAS Y EQUIPOS DE OFICINA; INCLUYE MATERIALES CONEXOS', 'SI', 1, 'SI'),
(515008, 81, 'VENTA AL POR MAYOR DE MAQUINARIA Y EQUIPO DE TRANSPORTE EXCEPTO VEHÍCULOS AUTOMOTORES', 'SI', 1, 'SI'),
(515009, 81, 'VENTA AL POR MAYOR DE MAQUINARIA, HERRAMIENTAS, EQUIPO Y MATERIALES N.C.P.', 'SI', 1, 'SI'),
(519000, 82, 'VENTA AL POR MAYOR DE OTROS PRODUCTOS N.C.P.', 'SI', 1, 'NO'),
(521111, 83, 'GRANDES ESTABLECIMIENTOS (VENTA DE ALIMENTOS);; HIPERMERCADOS', 'SI', 1, 'SI'),
(521112, 83, 'ALMACENES MEDIANOS (VENTA DE ALIMENTOS);; SUPERMERCADOS, MINIMARKETS', 'SI', 1, 'SI'),
(521120, 83, 'ALMACENES PEQUENOS (VENTA DE ALIMENTOS);', 'SI', 1, 'SI'),
(521200, 83, 'GRANDES TIENDAS - PRODUCTOS DE FERRETERÍA Y PARA EL HOGAR', 'SI', 1, 'SI'),
(521300, 83, 'GRANDES TIENDAS - VESTUARIO Y PRODUCTOS PARA EL HOGAR', 'SI', 1, 'SI'),
(521900, 83, 'VENTA AL POR MENOR DE OTROS PRODUCTOS EN PEQUENOS ALMACENES NO ESPECIALIZADOS', 'SI', 1, 'SI'),
(522010, 84, 'VENTA AL POR MENOR DE BEBIDAS Y LICORES (BOTILLERÍAS);', 'SI', 1, 'SI'),
(522020, 84, 'VENTA AL POR MENOR DE CARNES (ROJAS, BLANCAS, OTRAS*PRODUCTOS CÁRNICOS Y SIMILARES', 'SI', 1, 'SI'),
(522030, 84, 'COMERCIO AL POR MENOR DE VERDURAS Y FRUTAS (VERDULERÍA);', 'SI', 1, 'SI'),
(522040, 84, 'VENTA AL POR MENOR DE PESCADOS, MARISCOS Y PRODUCTOS CONEXOS', 'SI', 1, 'SI'),
(522050, 84, 'VENTA AL POR MENOR DE PRODUCTOS DE PANADERÍA Y PASTELERÍA', 'SI', 1, 'SI'),
(522060, 84, 'VENTA AL POR MENOR DE ALIMENTOS PARA MASCOTAS Y ANIMALES EN GENERAL', 'SI', 1, 'SI'),
(522070, 84, 'VENTA AL POR MENOR DE AVES Y HUEVOS', 'SI', 1, 'SI'),
(522090, 84, 'VENTA AL POR MENOR DE PRODUCTOS DE CONFITERÍAS, CIGARRILLOS, Y OTROS', 'SI', 1, 'SI'),
(523111, 85, 'FARMACIAS - PERTENECIENTES A CADENA DE ESTABLECIMIENTOS', 'SI', 1, 'SI'),
(523112, 85, 'FARMACIAS INDEPENDIENTES', 'SI', 1, 'SI'),
(523120, 85, 'VENTA AL POR MENOR DE PRODUCTOS MEDICINALES', 'SI', 1, 'SI'),
(523130, 85, 'VENTA AL POR MENOR DE ARTÍCULOS ORTOPÉDICOS', 'SI', 1, 'SI'),
(523140, 85, 'VENTA AL POR MENOR DE ARTÍCULOS DE TOCADOR Y COSMÉTICOS', 'SI', 1, 'SI'),
(523210, 85, 'VENTA AL POR MENOR DE CALZADO', 'SI', 1, 'SI'),
(523220, 85, 'VENTA AL POR MENOR DE PRENDAS DE VESTIR EN GENERAL, INCLUYE ACCESORIOS', 'SI', 1, 'SI'),
(523230, 85, 'VENTA AL POR MENOR DE LANAS, HILOS Y SIMILARES', 'SI', 1, 'SI'),
(523240, 85, 'VENTA AL POR MENOR DE MALETERÍAS, TALABARTERÍAS Y ARTÍCULOS DE CUERO', 'SI', 1, 'SI'),
(523250, 85, 'VENTA AL POR MENOR DE ROPA INTERIOR Y PRENDAS DE USO PERSONAL', 'SI', 1, 'SI'),
(523290, 85, 'COMERCIO AL POR MENOR DE TEXTILES PARA EL HOGAR Y OTROS PRODUCTOS TEXTILES N.C.P.', 'SI', 1, 'SI'),
(523310, 85, 'VENTA AL POR MENOR DE ARTÍCULOS ELECTRODOMÉSTICOS Y ELECTRÓNICOS PARA EL HOGAR', 'SI', 1, 'SI'),
(523320, 85, 'VENTA AL POR MENOR DE CRISTALES, LOZAS, PORCELANA, MENAJE (CRISTALERÍAS);', 'SI', 1, 'SI'),
(523330, 85, 'VENTA AL POR MENOR DE MUEBLES; INCLUYE COLCHONES', 'SI', 1, 'SI'),
(523340, 85, 'VENTA AL POR MENOR DE INSTRUMENTOS MUSICALES (CASA DE MÚSICA);', 'SI', 1, 'SI'),
(523350, 85, 'VENTA AL POR MENOR DE DISCOS, CASSETTES, DVD Y VIDEOS', 'SI', 1, 'SI'),
(523360, 85, 'VENTA AL POR MENOR DE LÁMPARAS, APLIQUÉS Y SIMILARES', 'SI', 1, 'SI'),
(523390, 85, 'VENTA AL POR MENOR DE APARATOS, ARTÍCULOS, EQUIPO DE USO DOMÉSTICO N.C.P.', 'SI', 1, 'SI'),
(523410, 85, 'VENTA AL POR MENOR DE ARTÍCULOS DE FERRETERÍA Y MATERIALES DE CONSTRUCCIÓN', 'SI', 1, 'SI'),
(523420, 85, 'VENTA AL POR MENOR DE PINTURAS, BARNICES Y LACAS', 'SI', 1, 'SI'),
(523430, 85, 'COMERCIO AL POR MENOR DE PRODUCTOS DE VIDRIO', 'SI', 1, 'SI'),
(523911, 85, 'COMERCIO AL POR MENOR DE ARTÍCULOS FOTOGRÁFICOS', 'SI', 1, 'SI'),
(523912, 85, 'COMERCIO AL POR MENOR DE ARTÍCULOS ÓPTICOS', 'SI', 1, 'SI'),
(523921, 85, 'COMERCIO POR MENOR DE JUGUETES', 'SI', 1, 'SI'),
(523922, 85, 'COMERCIO AL POR MENOR DE LIBROS', 'SI', 1, 'SI'),
(523923, 85, 'COMERCIO AL POR MENOR DE REVISTAS Y DIARIOS', 'SI', 1, 'SI'),
(523924, 85, 'COMERCIO DE ARTÍCULOS DE SUMINISTROS DE OFICINAS Y ARTÍCULOS DE ESCRITORIO EN GENERAL', 'SI', 1, 'SI'),
(523930, 85, 'COMERCIO AL POR MENOR DE COMPUTADORAS, SOFTWARES Y SUMINISTROS', 'SI', 1, 'SI'),
(523941, 85, 'COMERCIO AL POR MENOR DE ARMERÍAS, ARTÍCULOS DE CAZA Y PESCA', 'SI', 1, 'SI'),
(523942, 85, 'COMERCIO AL POR MENOR DE BICICLETAS Y SUS REPUESTOS', 'SI', 1, 'SI'),
(523943, 85, 'COMERCIO AL POR MENOR DE ARTÍCULOS DEPORTIVOS', 'SI', 1, 'SI'),
(523950, 85, 'COMERCIO AL POR MENOR DE ARTÍCULOS DE JOYERÍA, FANTASÍAS Y RELOJERÍAS', 'SI', 1, 'SI'),
(523961, 85, 'VENTA AL POR MENOR DE GAS LICUADO EN BOMBONAS', 'SI', 1, 'SI'),
(523969, 85, 'VENTA AL POR MENOR DE CARBÓN, LENA Y OTROS COMBUSTIBLES DE USO DOMÉSTICO', 'SI', 1, 'SI'),
(523991, 85, 'COMERCIO AL POR MENOR DE ARTÍCULOS TÍPICOS (ARTESANÍAS);', 'SI', 1, 'SI'),
(523992, 85, 'VENTA AL POR MENOR DE FLORES, PLANTAS, ÁRBOLES, SEMILLAS, ABONOS', 'SI', 1, 'SI'),
(523993, 85, 'VENTA AL POR MENOR DE MASCOTAS Y ACCESORIOS', 'SI', 1, 'SI'),
(523999, 85, 'VENTAS AL POR MENOR DE OTROS PRODUCTOS EN ALMACENES ESPECIALIZADOS N.C.P.', 'SI', 1, 'SI'),
(524010, 86, 'COMERCIO AL POR MENOR DE ANTIGUEDADES', 'SI', 1, 'SI'),
(524020, 86, 'COMERCIO AL POR MENOR DE ROPA USADA', 'SI', 1, 'SI'),
(524090, 86, 'COMERCIO AL POR MENOR DE ARTÍCULOS Y ARTEFACTOS USADOS N.C.P.', 'SI', 1, 'SI'),
(525110, 87, 'VENTA AL POR MENOR EN EMPRESAS DE VENTA A DISTANCIA POR CORREO', 'SI', 1, 'SI'),
(525120, 87, 'VENTA AL POR MENOR EN EMPRESAS DE VENTA A DISTANCIA VÍA TELEFÓNICA', 'SI', 1, 'SI'),
(525130, 87, 'VENTA AL POR MENOR EN EMPRESAS DE VENTA A DISTANCIA VÍA INTERNET; COMERCIO ELECTRÓNICO', 'SI', 1, 'SI'),
(525200, 87, 'VENTA AL POR MENOR EN PUESTOS DE VENTA Y MERCADOS', 'SI', 1, 'SI'),
(525911, 87, 'VENTA AL POR MENOR REALIZADA POR INDEPENDIENTES EN TRANSPORTE PÚBLICO (LEY 20.388);', 'SI', 1, 'SI'),
(525919, 87, 'VENTA AL POR MENOR NO REALIZADA EN ALMACENES DE PRODUCTOS PROPIOS N.C.P.', 'SI', 1, 'SI'),
(525920, 87, 'MÁQUINAS EXPENDEDORAS', 'SI', 1, 'SI'),
(525930, 87, 'VENTA AL POR MENOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA', 'SI', 1, 'SI'),
(525990, 87, 'OTROS TIPOS DE VENTA AL POR MENOR NO REALIZADA EN ALMACENES N.C.P.', 'SI', 1, 'SI'),
(526010, 88, 'REPARACIÓN DE CALZADO Y OTROS ARTÍCULOS DE CUERO', 'ND', 1, 'SI'),
(526020, 88, 'REPARACIONES ELÉCTRICAS Y ELECTRÓNICAS', 'ND', 1, 'SI'),
(526030, 88, 'REPARACIÓN DE RELOJES Y JOYAS', 'ND', 1, 'SI'),
(526090, 88, 'OTRAS REPARACIONES DE EFECTOS PERSONALES Y ENSERES DOMÉSTICOS N.C.P.', 'ND', 1, 'SI'),
(551010, 89, 'HOTELES', 'SI', 1, 'SI'),
(551020, 89, 'MOTELES', 'SI', 1, 'SI'),
(551030, 89, 'RESIDENCIALES', 'SI', 1, 'SI'),
(551090, 89, 'OTROS TIPOS DE HOSPEDAJE TEMPORAL COMO CAMPING, ALBERGUES, POSADAS, REFUGIOS Y SIMILARES', 'SI', 1, 'SI'),
(552010, 90, 'RESTAURANTES', 'SI', 1, 'SI'),
(552020, 90, 'ESTABLECIMIENTOS DE COMIDA RÁPIDA (BARES, FUENTES DE SODA, GELATERÍAS, PIZZERÍAS Y SIMILARES);', 'SI', 1, 'SI'),
(552030, 90, 'CASINOS Y CLUBES SOCIALES', 'SI', 1, 'SI'),
(552040, 90, 'SERVICIOS DE COMIDA PREPARADA EN FORMA INDUSTRIAL', 'SI', 1, 'SI'),
(552050, 90, 'SERVICIOS DE BANQUETES, BODAS Y OTRAS CELEBRACIONES', 'SI', 1, 'SI'),
(552090, 90, 'SERVICIOS DE OTROS ESTABLECIMIENTOS QUE EXPENDEN COMIDAS Y BEBIDAS', 'SI', 1, 'SI'),
(601001, 91, 'TRANSPORTE INTERURBANO DE PASAJEROS POR FERROCARRILES', 'SI', 1, 'SI'),
(601002, 91, 'TRANSPORTE DE CARGA POR FERROCARRILES', 'SI', 1, 'SI'),
(602110, 92, 'TRANSPORTE URBANO DE PASAJEROS VÍA FERROCARRIL (INCLUYE METRO);', 'NO', 1, 'SI'),
(602120, 92, 'TRANSPORTE URBANO DE PASAJEROS VÍA AUTOBUS (LOCOMOCIÓN COLECTIVA);', 'NO', 1, 'SI'),
(602130, 92, 'TRANSPORTE INTERURBANO DE PASAJEROS VÍA AUTOBUS', 'NO', 1, 'SI'),
(602140, 92, 'TRANSPORTE URBANO DE PASAJEROS VÍA TAXI COLECTIVO', 'NO', 1, 'SI'),
(602150, 92, 'SERVICIOS DE TRANSPORTE ESCOLAR', 'NO', 1, 'SI'),
(602160, 92, 'SERVICIOS DE TRANSPORTE DE TRABAJADORES', 'NO', 1, 'SI'),
(602190, 92, 'OTROS TIPOS DE TRANSPORTE REGULAR DE PASAJEROS POR VÍA TERRESTRE N.C.P.', 'NO', 1, 'SI'),
(602210, 92, 'TRANSPORTES POR TAXIS LIBRES Y RADIOTAXIS', 'NO', 1, 'SI'),
(602220, 92, 'SERVICIOS DE TRANSPORTE A TURISTAS', 'NO', 1, 'SI'),
(602230, 92, 'TRANSPORTE DE PASAJEROS EN VEHÍCULOS DE TRACCIÓN HUMANA Y ANIMAL', 'NO', 1, 'SI'),
(602290, 92, 'OTROS TIPOS DE TRANSPORTE NO REGULAR DE PASAJEROS N.C.P.', 'NO', 1, 'SI'),
(602300, 92, 'TRANSPORTE DE CARGA POR CARRETERA', 'SI', 1, 'SI'),
(603000, 93, 'TRANSPORTE POR TUBERÍAS', 'SI', 1, 'SI'),
(611001, 94, 'TRANSPORTE MARÍTIMO Y DE CABOTAJE DE PASAJEROS', 'SI', 1, 'SI'),
(611002, 94, 'TRANSPORTE MARÍTIMO Y DE CABOTAJE DE CARGA', 'SI', 1, 'SI'),
(612001, 95, 'TRANSPORTE DE PASAJEROS POR VÍAS DE NAVEGACIÓN INTERIORES', 'SI', 1, 'SI'),
(612002, 95, 'TRANSPORTE DE CARGA POR VÍAS DE NAVEGACIÓN INTERIORES', 'SI', 1, 'SI'),
(621010, 96, 'TRANSPORTE REGULAR POR VÍA AÉREA DE PASAJEROS', 'SI', 1, 'SI'),
(621020, 96, 'TRANSPORTE REGULAR POR VÍA AÉREA DE CARGA', 'SI', 1, 'SI'),
(622001, 96, 'TRANSPORTE NO REGULAR POR VÍA AÉREA DE PASAJEROS', 'SI', 1, 'SI'),
(622002, 96, 'TRANSPORTE NO REGULAR POR VÍA AÉREA DE CARGA', 'SI', 1, 'SI'),
(630100, 97, 'MANIPULACIÓN DE LA CARGA', 'SI', 1, 'SI'),
(630200, 97, 'SERVICIOS DE ALMACENAMIENTO Y DEPÓSITO', 'SI', 1, 'SI'),
(630310, 97, 'TERMINALES TERRESTRES DE PASAJEROS', 'SI', 1, 'SI'),
(630320, 97, 'ESTACIONAMIENTO DE VEHÍCULOS Y PARQUÍMETROS', 'SI', 1, 'SI'),
(630330, 97, 'PUERTOS Y AEROPUERTOS', 'SI', 1, 'SI'),
(630340, 97, 'SERVICIOS PRESTADOS POR CONCESIONARIOS DE CARRETERAS', 'SI', 1, 'SI'),
(630390, 97, 'OTRAS ACTIVIDADES CONEXAS AL TRANSPORTE N.C.P.', 'SI', 1, 'SI'),
(630400, 97, 'AGENCIAS Y ORGANIZADORES DE VIAJES; ACTIVIDADES DE ASISTENCIA A TURISTAS N.C.P.', 'SI', 1, 'SI'),
(630910, 97, 'AGENCIAS DE ADUANAS', 'ND', 1, 'SI'),
(630920, 97, 'AGENCIAS DE TRANSPORTE', 'ND', 1, 'SI'),
(641100, 98, 'ACTIVIDADES POSTALES NACIONALES', 'ND', 1, 'SI'),
(641200, 98, 'ACTIVIDADES DE CORREO DISTINTAS DE LAS ACTIVIDADES POSTALES NACIONALES', 'ND', 1, 'SI'),
(642010, 99, 'SERVICIOS DE TELEFONÍA FIJA', 'SI', 1, 'SI'),
(642020, 99, 'SERVICIOS DE TELEFONÍA MÓVIL', 'SI', 1, 'SI'),
(642030, 99, 'PORTADORES TELEFÓNICOS (LARGA DISTANCIA NACIONAL E INTERNACIONAL);', 'SI', 1, 'SI'),
(642040, 99, 'SERVICIOS DE TELEVISIÓN NO ABIERTA', 'SI', 1, 'SI'),
(642050, 99, 'PROVEEDORES DE INTERNET', 'SI', 1, 'SI'),
(642061, 99, 'CENTROS DE LLAMADOS; INCLUYE ENVÍO DE FAX', 'SI', 1, 'SI'),
(642062, 99, 'CENTROS DE ACCESO A INTERNET', 'SI', 1, 'SI'),
(642090, 99, 'OTROS SERVICIOS DE TELECOMUNICACIONES N.C.P.', 'SI', 1, 'SI'),
(651100, 100, 'BANCA CENTRAL', 'SI', 1, 'NO'),
(651910, 100, 'BANCOS', 'SI', 1, 'NO'),
(651920, 100, 'FINANCIERAS', 'SI', 1, 'SI'),
(651990, 100, 'OTROS TIPOS DE INTERMEDIACIÓN MONETARIA N.C.P.', 'SI', 1, 'SI'),
(659110, 101, 'LEASING FINANCIERO', 'SI', 1, 'SI'),
(659120, 101, 'LEASING HABITACIONAL', 'SI', 1, 'SI'),
(659210, 101, 'FINANCIAMIENTO DEL FOMENTO DE LA PRODUCCIÓN', 'SI', 1, 'NO'),
(659220, 101, 'ACTIVIDADES DE CRÉDITO PRENDARIO', 'SI', 1, 'SI'),
(659231, 101, 'FACTORING', 'SI', 1, 'SI'),
(659232, 101, 'SECURITIZADORAS', 'SI', 1, 'NO'),
(659290, 101, 'OTROS INSTITUCIONES FINANCIERAS N.C.P.', 'SI', 1, 'SI'),
(659911, 101, 'ADMINISTRADORAS DE FONDOS DE INVERSIÓN', 'SI', 1, 'SI'),
(659912, 101, 'ADMINISTRADORAS DE FONDOS MUTUOS', 'SI', 1, 'SI'),
(659913, 101, 'ADMINISTRADORAS DE FICES (FONDOS DE INVERSIÓN DE CAPITAL EXTRANJERO);', 'SI', 1, 'SI'),
(659914, 101, 'ADMINISTRADORAS DE FONDOS PARA LA VIVIENDA', 'SI', 1, 'SI'),
(659915, 101, 'ADMINISTRADORAS DE FONDOS PARA OTROS FINES Y/O GENERALES', 'SI', 1, 'SI'),
(659920, 101, 'SOCIEDADES DE INVERSIÓN Y RENTISTAS DE CAPITALES MOBILIARIOS EN GENERAL', 'NO', 1, 'SI'),
(660101, 102, 'PLANES DE SEGURO DE VIDA', 'SI', 1, 'NO'),
(660102, 102, 'PLANES DE REASEGUROS DE VIDA', 'SI', 1, 'NO'),
(660200, 102, 'ADMINISTRADORAS DE FONDOS DE PENSIONES (AFP);', 'SI', 1, 'NO'),
(660301, 102, 'PLANES DE SEGUROS GENERALES', 'SI', 1, 'NO'),
(660302, 102, 'PLANES DE REASEGUROS GENERALES', 'SI', 1, 'NO'),
(660400, 102, 'ISAPRES', 'SI', 1, 'NO'),
(671100, 103, 'ADMINISTRACIÓN DE MERCADOS FINANCIEROS', 'SI', 1, 'SI'),
(671210, 103, 'CORREDORES DE BOLSA', 'SI', 1, 'SI'),
(671220, 103, 'AGENTES DE VALORES', 'SI', 1, 'SI'),
(671290, 103, 'OTROS SERVICIOS DE CORRETAJE', 'SI', 1, 'SI'),
(671910, 103, 'CÁMARA DE COMPENSACIÓN', 'SI', 1, 'SI'),
(671921, 103, 'ADMINISTRADORA DE TARJETAS DE CRÉDITO', 'SI', 1, 'SI'),
(671929, 103, 'EMPRESAS DE ASESORÍA, CONSULTORÍA FINANCIERA Y DE APOYO AL GIRO', 'ND', 1, 'SI'),
(671930, 103, 'CLASIFICADORES DE RIESGOS', 'SI', 1, 'SI'),
(671940, 103, 'CASAS DE CAMBIO Y OPERADORES DE DIVISA', 'ND', 1, 'SI'),
(671990, 103, 'OTRAS ACTIVIDADES AUXILIARES DE LA INTERMEDIACIÓN FINANCIERA N.C.P.', 'SI', 1, 'SI'),
(672010, 104, 'CORREDORES DE SEGUROS', 'ND', 1, 'SI'),
(672020, 104, 'AGENTES Y LIQUIDADORES DE SEGUROS', 'NO', 2, 'SI'),
(672090, 104, 'OTRAS ACTIVIDADES AUXILIARES DE LA FINANCIACIÓN DE PLANES DE SEGUROS Y DE PENSIONES N.C.P.', 'ND', 0, 'SI'),
(701001, 105, 'ARRIENDO DE INMUEBLES AMOBLADOS O CON EQUIPOS Y MAQUINARIAS', 'SI', 1, 'SI'),
(701009, 105, 'COMPRA, VENTA Y ALQUILER (EXCEPTO AMOBLADOS*DE INMUEBLES PROPIOS O ARRENDADOS', 'NO', 1, 'SI'),
(702000, 106, 'CORREDORES DE PROPIEDADES', 'ND', 0, 'SI'),
(711101, 107, 'ALQUILER DE AUTOS Y CAMIONETAS SIN CHOFER', 'SI', 1, 'SI'),
(711102, 107, 'ALQUILER DE OTROS EQUIPOS DE TRANSPORTE POR VÍA TERRESTRE SIN OPERARIOS', 'SI', 1, 'SI'),
(711200, 107, 'ALQUILER DE TRANSPORTE POR VÍA ACUÁTICA SIN TRIPULACIÓN', 'SI', 1, 'SI'),
(711300, 107, 'ALQUILER DE EQUIPO DE TRANSPORTE POR VÍA AÉREA SIN TRIPULANTES', 'SI', 1, 'SI'),
(712100, 108, 'ALQUILER DE MAQUINARIA Y EQUIPO AGROPECUARIO', 'SI', 1, 'SI'),
(712200, 108, 'ALQUILER DE MAQUINARIA Y EQUIPO DE CONSTRUCCIÓN E INGENIERÍA CIVIL', 'SI', 1, 'SI'),
(712300, 108, 'ALQUILER DE MAQUINARIA Y EQUIPO DE OFICINA (SIN OPERARIOS NI SERVICIO ADMINISTRATIVO);', 'SI', 1, 'SI'),
(712900, 108, 'ALQUILER DE OTROS TIPOS DE MAQUINARIAS Y EQUIPOS N.C.P.', 'SI', 1, 'SI'),
(713010, 109, 'ALQUILER DE BICICLETAS Y ARTÍCULOS PARA DEPORTES', 'SI', 1, 'SI'),
(713020, 109, 'ARRIENDO DE VIDEOS, JUEGOS DE VIDEO, Y EQUIPOS REPRODUCTORES DE VIDEO, MÚSICA Y SIMILARES', 'SI', 1, 'SI'),
(713030, 109, 'ALQUILER DE MOBILIARIO PARA EVENTOS (SILLAS, MESAS, MESONES, VAJILLAS, TOLDOS Y RELACIONADOS);', 'SI', 1, 'SI'),
(713090, 109, 'ALQUILER DE OTROS EFECTOS PERSONALES Y ENSERES DOMÉSTICOS N.C.P.', 'SI', 1, 'SI'),
(722000, 110, 'ASESORES Y CONSULTORES EN INFORMÁTICA (SOFTWARE);', 'NO', 2, 'SI'),
(724000, 110, 'PROCESAMIENTO DE DATOS Y ACTIVIDADES RELACIONADAS CON BASES DE DATOS', 'ND', 1, 'SI'),
(725000, 111, 'MANTENIMIENTO Y REPARACIÓN DE MAQUINARIA DE OFICINA, CONTABILIDAD E INFORMÁTICA', 'SI', 1, 'SI'),
(726000, 110, 'EMPRESAS DE SERVICIOS INTEGRALES DE INFORMÁTICA', 'ND', 1, 'SI'),
(731000, 112, 'INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS NATURALES Y LA INGENIERÍA', 'ND', 1, 'SI'),
(732000, 112, 'INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS SOCIALES Y LAS HUMANIDADES', 'ND', 1, 'SI'),
(741110, 113, 'SERVICIOS JURÍDICOS', 'NO', 2, 'SI'),
(741120, 113, 'SERVICIO NOTARIAL', 'NO', 2, 'NO'),
(741130, 113, 'CONSERVADOR DE BIENES RAICES', 'NO', 2, 'NO'),
(741140, 113, 'RECEPTORES JUDICIALES', 'NO', 2, 'SI'),
(741190, 113, 'ARBITRAJES, SÍNDICOS, PERITOS Y OTROS', 'NO', 2, 'SI'),
(741200, 113, 'ACTIVIDADES DE CONTABILIDAD, TENEDURÍA DE LIBROS Y AUDITORÍA; ASESORAMIENTOS TRIBUTARIOS', 'NO', 2, 'SI'),
(741300, 113, 'INVESTIGACIÓN DE MERCADOS Y REALIZACIÓN DE ENCUESTAS DE OPINIÓN PÚBLICA', 'ND', 0, 'SI'),
(741400, 113, 'ACTIVIDADES DE ASESORAMIENTO EMPRESARIAL Y EN MATERIA DE GESTIÓN', 'NO', 0, 'SI'),
(742110, 114, 'SERVICIOS DE ARQUITECTURA Y TÉCNICO RELACIONADO', 'NO', 2, 'SI'),
(742121, 114, 'EMPRESAS DE SERVICIOS GEOLÓGICOS Y DE PROSPECCIÓN', 'SI', 1, 'SI'),
(742122, 114, 'SERVICIOS PROFESIONALES EN GEOLOGÍA Y PROSPECCIÓN', 'NO', 2, 'SI'),
(742131, 114, 'EMPRESAS DE SERVICIOS DE TOPOGRAFÍA Y AGRIMENSURA', 'SI', 1, 'SI'),
(742132, 114, 'SERVICIOS PROFESIONALES DE TOPOGRAFÍA Y AGRIMENSURA', 'NO', 2, 'SI'),
(742141, 114, 'SERVICIOS DE INGENIERÍA PRESTADOS POR EMPRESAS N.C.P.', 'SI', 1, 'SI'),
(742142, 114, 'SERVICIOS DE INGENIERÍA PRESTADOS POR PROFESIONALES N.C.P.', 'NO', 2, 'SI'),
(742190, 114, 'OTROS SERVICIOS DESARROLLADOS POR PROFESIONALES', 'NO', 2, 'SI'),
(742210, 114, 'SERVICIO DE REVISIÓN TÉCNICA DE VEHÍCULOS AUTOMOTORES', 'SI', 1, 'SI'),
(742290, 114, 'OTROS SERVICIOS DE ENSAYOS Y ANALISIS TÉCNICOS', 'ND', 1, 'SI'),
(743001, 115, 'EMPRESAS DE PUBLICIDAD', 'SI', 1, 'SI'),
(743002, 115, 'SERVICIOS PERSONALES EN PUBLICIDAD', 'NO', 2, 'SI'),
(749110, 116, 'SERVICIOS SUMINISTRO DE PERSONAL; EMPRESAS SERVICIOS TRANSITORIOS', 'SI', 1, 'SI'),
(749190, 116, 'SERVICIOS DE RECLUTAMIENTO DE PERSONAL', 'SI', 1, 'SI'),
(749210, 116, 'ACTIVIDADES DE INVESTIGACIÓN', 'ND', 0, 'SI'),
(749221, 116, 'SERVICIOS INTEGRALES DE SEGURIDAD', 'ND', 1, 'SI'),
(749222, 116, 'TRANSPORTE DE VALORES', 'SI', 1, 'SI'),
(749229, 116, 'SERVICIOS PERSONALES RELACIONADOS CON SEGURIDAD', 'NO', 2, 'SI'),
(749310, 116, 'EMPRESAS DE LIMPIEZA DE EDIFICIOS RESIDENCIALES Y NO RESIDENCIALES', 'SI', 1, 'SI'),
(749320, 116, 'DESRATIZACIÓN Y FUMIGACIÓN NO AGRÍCOLA', 'ND', 1, 'SI'),
(749401, 116, 'SERVICIOS DE REVELADO, IMPRESIÓN, AMPLIACIÓN DE FOTOGRAFÍAS', 'SI', 1, 'SI'),
(749402, 116, 'ACTIVIDADES DE FOTOGRAFÍA PUBLICITARIA', 'ND', 0, 'SI'),
(749409, 116, 'SERVICIOS PERSONALES DE FOTOGRAFÍA', 'NO', 2, 'SI'),
(749500, 116, 'SERVICIOS DE ENVASADO Y EMPAQUE', 'SI', 1, 'SI'),
(749911, 116, 'SERVICIOS DE COBRANZA DE CUENTAS', 'ND', 1, 'SI'),
(749912, 116, 'EVALUACIÓN Y CALIFICACIÓN DEL GRADO DE SOLVENCIA', 'ND', 1, 'SI'),
(749913, 116, 'ASESORÍAS EN LA GESTIÓN DE LA COMPRA O VENTA DE PEQUENAS Y MEDIANAS EMPRESAS', 'ND', 1, 'SI'),
(749921, 116, 'DISENADORES DE VESTUARIO', 'ND', 0, 'SI'),
(749922, 116, 'DISENADORES DE INTERIORES', 'ND', 0, 'SI'),
(749929, 116, 'OTROS DISENADORES N.C.P.', 'ND', 0, 'SI'),
(749931, 116, 'EMPRESAS DE TAQUIGRAFÍA, REPRODUCCIÓN, DESPACHO DE CORRESPONDENCIA, Y OTRAS LABORES DE OFICINA', 'SI', 1, 'SI'),
(749932, 116, 'SERVICIOS PERSONALES DE TRADUCCIÓN, INTERPRETACIÓN Y LABORES DE OFICINA', 'NO', 2, 'SI'),
(749933, 116, 'EMPRESAS DE TRADUCCIÓN E INTERPRETACIÓN', 'SI', 1, 'SI'),
(749934, 116, 'SERVICIOS DE FOTOCOPIAS', 'SI', 1, 'SI'),
(749940, 116, 'AGENCIAS DE CONTRATACIÓN DE ACTORES', 'SI', 1, 'SI'),
(749950, 116, 'ACTIVIDADES DE SUBASTA (MARTILLEROS);', 'SI', 1, 'SI'),
(749961, 116, 'GALERÍAS DE ARTE', 'SI', 1, 'SI'),
(749962, 116, 'FERIAS DE EXPOSICIONES CON FINES EMPRESARIALES', 'ND', 1, 'SI'),
(749970, 116, 'SERVICIOS DE CONTESTACIÓN DE LLAMADAS (CALL CENTER);', 'SI', 1, 'SI'),
(749990, 116, 'OTRAS ACTIVIDADES EMPRESARIALES N.C.P.', 'SI', 1, 'SI'),
(751110, 117, 'GOBIERNO CENTRAL', 'ND', 1, 'NO'),
(751120, 117, 'MUNICIPALIDADES', 'ND', 1, 'NO'),
(751200, 117, 'ACTIVIDADES DEL PODER JUDICIAL', 'ND', 1, 'NO'),
(751300, 117, 'ACTIVIDADES DEL PODER LEGISLATIVO', 'ND', 1, 'NO');
INSERT INTO `giro` (`CODIGO_GIRO`, `ID_GIRO_DETALLE`, `DETALLE`, `AFECTO_IVA`, `CATEGORIA_TRIBUTARIA`, `DISPONIBLE_INTERNET`) VALUES
(752100, 117, 'RELACIONES EXTERIORES', 'ND', 1, 'NO'),
(752200, 117, 'ACTIVIDADES DE DEFENSA', 'ND', 1, 'NO'),
(752300, 117, 'ACTIVIDADES DE MANTENIMIENTO DEL ORDEN PÚBLICO Y DE SEGURIDAD', 'ND', 1, 'SI'),
(753010, 118, 'ACTIVIDADES DE PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA RELACIONADOS CON SALUD', 'ND', 1, 'NO'),
(753020, 118, 'CAJAS DE COMPENSACIÓN', 'ND', 1, 'SI'),
(753090, 118, 'OTRAS ACTIVIDADES DE PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', 'ND', 1, 'NO'),
(801010, 119, 'ESTABLECIMIENTOS DE ENSEÑANZA PREESCOLAR', 'SI', 1, 'SI'),
(801020, 119, 'ESTABLECIMIENTOS DE ENSEÑANZA PRIMARIA', 'SI', 1, 'SI'),
(802100, 119, 'ESTABLECIMIENTOS DE ENSEÑANZA SECUNDARIA DE FORMACIÓN GENERAL', 'SI', 1, 'SI'),
(802200, 119, 'ESTABLECIMIENTOS DE ENSEÑANZA SECUNDARIA DE FORMACIÓN TÉCNICA Y PROFESIONAL', 'SI', 1, 'SI'),
(803010, 119, 'UNIVERSIDADES', 'SI', 1, 'NO'),
(803020, 119, 'INSTITUTOS PROFESIONALES', 'SI', 1, 'NO'),
(803030, 119, 'CENTROS DE FORMACIÓN TÉCNICA', 'SI', 1, 'SI'),
(809010, 119, 'ESTABLECIMIENTOS DE ENSEÑANZA PRIMARIA Y SECUNDARIA PARA ADULTOS', 'SI', 1, 'SI'),
(809020, 119, 'ESTABLECIMIENTOS DE ENSEÑANZA PREUNIVERSITARIA', 'SI', 1, 'SI'),
(809030, 119, 'EDUCACIÓN EXTRAESCOLAR (ESCUELA DE CONDUCCIÓN, MÚSICA, MODELAJE, ETC.);', 'SI', 1, 'SI'),
(809041, 119, 'EDUCACIÓN A DISTANCIA (INTERNET, CORRESPONDENCIA, OTRAS);', 'NO', 1, 'SI'),
(809049, 119, 'SERVICIOS PERSONALES DE EDUCACIÓN', 'NO', 2, 'SI'),
(851110, 120, 'HOSPITALES Y CLÍNICAS', 'SI', 1, 'NO'),
(851120, 120, 'CLÍNICAS PSIQUIATRICAS, CENTROS DE REHABILITACIÓN, ASILOS Y CLÍNICAS DE REPOSO', 'SI', 1, 'SI'),
(851211, 120, 'SERVICIOS DE MÉDICOS EN FORMA INDEPENDIENTE', 'NO', 2, 'SI'),
(851212, 120, 'ESTABLECIMIENTOS MÉDICOS DE ATENCIÓN AMBULATORIA (CENTROS MÉDICOS);', 'ND', 1, 'SI'),
(851221, 120, 'SERVICIOS DE ODONTÓLOGOS EN FORMA INDEPENDIENTE', 'NO', 2, 'SI'),
(851222, 120, 'CENTROS DE ATENCIÓN ODONTOLÓGICA', 'ND', 1, 'SI'),
(851910, 120, 'LABORATORIOS CLÍNICOS; INCLUYE BANCOS DE SANGRE', 'ND', 1, 'SI'),
(851920, 120, 'OTROS PROFESIONALES DE LA SALUD', 'NO', 2, 'SI'),
(851990, 120, 'OTRAS ACTIVIDADES EMPRESARIALES RELACIONADAS CON LA SALUD HUMANA', 'ND', 1, 'SI'),
(852010, 121, 'ACTIVIDADES DE CLÍNICAS VETERINARIAS', 'ND', 1, 'SI'),
(852021, 121, 'SERVICIOS DE MÉDICOS VETERINARIOS EN FORMA INDEPENDIENTE', 'NO', 2, 'SI'),
(852029, 121, 'SERVICIOS DE OTROS PROFESIONALES INDEPENDIENTES EN EL ÁREA VETERINARIA', 'NO', 2, 'SI'),
(853100, 122, 'SERVICIOS SOCIALES CON ALOJAMIENTO', 'ND', 1, 'SI'),
(853200, 122, 'SERVICIOS SOCIALES SIN ALOJAMIENTO', 'ND', 1, 'SI'),
(900010, 123, 'SERVICIOS DE VERTEDEROS', 'SI', 1, 'SI'),
(900020, 123, 'BARRIDO DE EXTERIORES', 'SI', 1, 'SI'),
(900030, 123, 'RECOGIDA Y ELIMINACIÓN DE DESECHOS', 'SI', 1, 'SI'),
(900040, 123, 'SERVICIOS DE EVACUACIÓN DE RILES Y AGUAS SERVIDAS', 'SI', 1, 'SI'),
(900050, 123, 'SERVICIOS DE TRATAMIENTO DE RILES Y AGUAS SERVIDAS', 'SI', 1, 'SI'),
(900090, 123, 'OTRAS ACTIVIDADES DE MANEJO DE DESPERDICIOS', 'SI', 1, 'SI'),
(911100, 124, 'ACTIVIDADES DE ORGANIZACIONES EMPRESARIALES Y DE EMPLEADORES', 'ND', 1, 'SI'),
(911210, 124, 'COLEGIOS PROFESIONALES', 'ND', 1, 'NO'),
(911290, 124, 'ACTIVIDADES DE OTRAS ORGANIZACIONES PROFESIONALES', 'ND', 1, 'SI'),
(912000, 125, 'ACTIVIDADES DE SINDICATOS', 'ND', 1, 'SI'),
(919100, 125, 'ACTIVIDADES DE ORGANIZACIONES RELIGIOSAS', 'ND', 1, 'NO'),
(919200, 125, 'ACTIVIDADES DE ORGANIZACIONES POLÍTICAS', 'ND', 1, 'SI'),
(919910, 125, 'CENTROS DE MADRES Y UNIDADES VECINALES Y COMUNALES', 'ND', 1, 'NO'),
(919920, 125, 'CLUBES SOCIALES', 'ND', 1, 'NO'),
(919930, 125, 'SERVICIOS DE INSTITUTOS DE ESTUDIOS, FUNDACIONES, CORPORACIONES DE DESARROLLO (EDUCACIÓN, SALUD);', 'ND', 1, 'NO'),
(919990, 125, 'ACTIVIDADES DE OTRAS ASOCIACIONES N.C.P.', 'ND', 1, 'SI'),
(921110, 126, 'PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS', 'ND', 1, 'SI'),
(921120, 126, 'DISTRIBUIDORA CINEMATOGRÁFICAS', 'SI', 1, 'SI'),
(921200, 126, 'EXHIBICIÓN DE FILMES Y VIDEOCINTAS', 'SI', 1, 'SI'),
(921310, 126, 'ACTIVIDADES DE TELEVISIÓN', 'ND', 1, 'SI'),
(921320, 126, 'ACTIVIDADES DE RADIO', 'ND', 1, 'SI'),
(921411, 126, 'SERVICIOS DE PRODUCCIÓN DE RECITALES Y OTROS EVENTOS MUSICALES MASIVOS', 'ND', 1, 'SI'),
(921419, 126, 'SERVICIOS DE PRODUCCIÓN TEATRAL Y OTROS N.C.P.', 'ND', 1, 'SI'),
(921420, 126, 'ACTIVIDADES EMPRESARIALES DE ARTISTAS', 'SI', 1, 'SI'),
(921430, 126, 'ACTIVIDADES ARTÍSTICAS; FUNCIONES DE ARTISTAS, ACTORES, MÚSICOS, CONFERENCISTAS, OTROS', 'NO', 2, 'SI'),
(921490, 126, 'AGENCIAS DE VENTA DE BILLETES DE TEATRO, SALAS DE CONCIERTO Y DE TEATRO', 'ND', 1, 'SI'),
(921911, 126, 'INSTRUCTORES DE DANZA', 'NO', 2, 'SI'),
(921912, 126, 'ACTIVIDADES DE DISCOTECAS, CABARET, SALAS DE BAILE Y SIMILARES', 'SI', 1, 'SI'),
(921920, 126, 'ACTIVIDADES DE PARQUES DE ATRACCIONES Y CENTROS SIMILARES', 'SI', 1, 'SI'),
(921930, 126, 'ESPECTÁCULOS CIRCENSES, DE TÍTERES U OTROS SIMILARES', 'SI', 1, 'SI'),
(921990, 126, 'OTRAS ACTIVIDADES DE ENTRETENIMIENTO N.C.P.', 'ND', 0, 'SI'),
(922001, 127, 'AGENCIAS DE NOTICIAS', 'ND', 1, 'SI'),
(922002, 127, 'SERVICIOS PERIODÍSTICOS PRESTADO POR PROFESIONALES', 'NO', 2, 'SI'),
(923100, 128, 'ACTIVIDADES DE BIBLIOTECAS Y ARCHIVOS', 'ND', 1, 'SI'),
(923200, 128, 'ACTIVIDADES DE MUSEOS Y PRESERVACIÓN DE LUGARES Y EDIFICIOS HISTÓRICOS', 'ND', 1, 'SI'),
(923300, 128, 'ACTIVIDADES DE JARDINES BOTÁNICOS Y ZOOLÓGICOS Y DE PARQUES NACIONALES', 'ND', 1, 'SI'),
(924110, 129, 'EXPLOTACIÓN DE INSTALACIONES ESPECIALIZADAS PARA LAS PRACTICAS DEPORTIVAS', 'ND', 1, 'SI'),
(924120, 129, 'ACTIVIDADES DE CLUBES DE DEPORTES Y ESTADIOS', 'ND', 1, 'SI'),
(924131, 129, 'FUTBOL PROFESIONAL', 'ND', 1, 'SI'),
(924132, 129, 'FUTBOL AMATEUR', 'ND', 1, 'SI'),
(924140, 129, 'HIPÓDROMOS', 'SI', 1, 'SI'),
(924150, 129, 'PROMOCIÓN Y ORGANIZACIÓN DE ESPECTÁCULOS DEPORTIVOS', 'ND', 1, 'SI'),
(924160, 129, 'ESCUELAS PARA DEPORTES', 'SI', 1, 'SI'),
(924190, 129, 'OTRAS ACTIVIDADES RELACIONADAS AL DEPORTE N.C.P.', 'ND', 1, 'SI'),
(924910, 129, 'SISTEMAS DE JUEGOS DE AZAR MASIVOS.', 'SI', 1, 'NO'),
(924920, 129, 'ACTIVIDADES DE CASINO DE JUEGOS', 'SI', 1, 'NO'),
(924930, 129, 'SALAS DE BILLAR, BOWLING, POOL Y JUEGOS ELECTRÓNICOS', 'SI', 1, 'SI'),
(924940, 129, 'CONTRATACIÓN DE ACTORES PARA CINE, TV, Y TEATRO', 'SI', 1, 'SI'),
(924990, 129, 'OTROS SERVICIOS DE DIVERSIÓN Y ESPARCIMIENTOS N.C.P.', 'ND', 0, 'SI'),
(930100, 130, 'LAVADO Y LIMPIEZA DE PRENDAS DE TELA Y DE PIEL, INCLUSO LAS LIMPIEZAS EN SECO', 'SI', 1, 'SI'),
(930200, 130, 'PELUQUERÍAS Y SALONES DE BELLEZA', 'ND', 0, 'SI'),
(930310, 130, 'SERVICIOS FUNERARIOS', 'SI', 1, 'SI'),
(930320, 130, 'SERVICIOS EN CEMENTERIOS', 'SI', 1, 'SI'),
(930330, 130, 'SERVICIOS DE CARROZAS FÚNEBRES (TRANSPORTE DE CADÁVERES);', 'SI', 1, 'SI'),
(930390, 130, 'OTRAS ACTIVIDADES DE SERVICIOS FUNERARIOS Y OTRAS ACTIVIDADES CONEXAS', 'SI', 1, 'SI'),
(930910, 130, 'ACTIVIDADES DE MANTENIMIENTO FÍSICO CORPORAL (BAÑOS, TURCOS, SAUNAS);', 'SI', 1, 'SI'),
(930990, 130, 'OTRAS ACTIVIDADES DE SERVICIOS PERSONALES N.C.P.', 'NO', 2, 'SI'),
(950001, 131, 'HOGARES PRIVADOS INDIVIDUALES CON SERVICIO DOMÉSTICO', 'NO', 0, 'NO'),
(950002, 131, 'CONSEJO DE ADMINISTRACIÓN DE EDIFICIOS Y CONDOMINIOS', 'NO', 1, 'NO'),
(990000, 132, 'ORGANIZACIONES Y ÓRGANOS EXTRATERRITORIALES', 'ND', 1, 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `giro_cabecera`
--

CREATE TABLE IF NOT EXISTS `giro_cabecera` (
  `ID_GIRO_CABECERA` int(100) NOT NULL DEFAULT '0',
  `NOMBRE_GIRO_CABECERA` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID_GIRO_CABECERA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `giro_cabecera`
--

INSERT INTO `giro_cabecera` (`ID_GIRO_CABECERA`, `NOMBRE_GIRO_CABECERA`) VALUES
(1, 'Agricultura, Ganadería, Caza y Silvicultura'),
(2, 'Pesca'),
(3, 'Explotación de Minas y Canteras'),
(4, 'Industrias Manufactureras No Metálicas'),
(5, 'Industrias Manufactureras Metálicas'),
(6, 'Suministro de Electricidad, Gas y Agua'),
(7, 'Construcción'),
(8, 'Comercio al Por Mayor y Menor; Rep. Vehículos Automotores/Enseres Domésticos'),
(9, 'Hoteles y Restaurantes'),
(10, 'Transporte, Almacenamiento y Comunicaciones'),
(11, 'Intermediación Financiera'),
(12, 'Actividades Inmobiliarias, Empresariales y de Alquiler'),
(13, 'Adm. Pública y Defensa; Planes de Seg. Social, Afiliación Obligatoria'),
(14, 'Enseñanza'),
(15, 'Servicios Sociales y de Salud'),
(16, 'Otras Actividades de Servicios Comunitarias, Sociales y Personales'),
(17, 'Consejo de Administración de Edificios y Condominios'),
(18, 'Organizaciones y Órganos Extraterritoriales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `giro_detalle`
--

CREATE TABLE IF NOT EXISTS `giro_detalle` (
  `ID_GIRO_DETALLE` int(100) NOT NULL DEFAULT '0',
  `NOMBRE_GIRO_DETALLE` varchar(300) DEFAULT NULL,
  `ID_GIRO_CABECERA` int(100) DEFAULT NULL,
  PRIMARY KEY (`ID_GIRO_DETALLE`),
  KEY `FK_GIRO_DETALLE_GIRO_CABECERA_R` (`ID_GIRO_CABECERA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `giro_detalle`
--

INSERT INTO `giro_detalle` (`ID_GIRO_DETALLE`, `NOMBRE_GIRO_DETALLE`, `ID_GIRO_CABECERA`) VALUES
(1, 'CRÍA DE ANIMALES ', 1),
(2, 'CULTIVO PROD. AGRÍCOLAS EN COMBINACIÓN CON CRÍA DE ANIMALES ', 1),
(3, 'ACTIVIDADES DE SERVICIOS AGRÍCOLAS Y GANADEROS ', 1),
(4, 'CAZA ORDINARIA Y MEDIANTE TRAMPAS, REPOBLACIÓN, ACT. SERVICIO CONEXAS ', 1),
(5, 'SILVICULTURA, EXTRACCIÓN DE MADERA Y ACTIVIDADES DE SERVICIOS CONEXAS ', 1),
(6, 'EXPLT. DE CRIADEROS DE PECES Y PROD. DEL MAR; SERVICIOS RELACIONADOS ', 2),
(7, 'PESCA EXTRACTIVA: Y SERVICIOS RELACIONADOS ', 2),
(8, 'EXTRACCIÓN, AGLOMERACIÓN DE CARBÓN DE PIEDRA, LIGNITO Y TURBA ', 3),
(9, 'EXTRACCIÓN DE PETRÓLEO CRUDO Y GAS NATURAL; ACTIVIDADES RELACIONADAS ', 3),
(10, 'EXTRACCIÓN DE MINERALES METALÍFEROS ', 3),
(11, 'EXPLOTACIÓN DE MINAS Y CANTERAS ', 3),
(12, 'PRODUCCIÓN, PROCESAMIENTO Y CONSERVACIÓN DE ALIMENTOS ', 4),
(13, 'ELABORACIÓN DE PRODUCTOS LÁCTEOS ', 4),
(14, 'ELAB. DE PROD. DE MOLINERÍA, ALMIDONES Y PROD. DERIVADOS DEL ALMIDÓN ', 4),
(15, 'ELABORACIÓN DE OTROS PRODUCTOS ALIMENTICIOS ', 4),
(16, 'ELABORACIÓN DE BEBIDAS ', 4),
(17, 'ELABORACIÓN DE PRODUCTOS DEL TABACO ', 4),
(18, 'HILANDERÍA, TEJEDURA Y ACABADO DE PRODUCTOS TEXTILES ', 4),
(19, 'FABRICACIÓN DE OTROS PRODUCTOS TEXTILES ', 4),
(20, 'FABRICACIÓN DE TEJIDOS Y ARTÍCULOS DE PUNTO Y GANCHILLO ', 4),
(21, 'FABRICACIÓN DE PRENDAS DE VESTIR; EXCEPTO PRENDAS DE PIEL ', 4),
(22, 'PROCESAMIENTO Y FABRICACIÓN DE ARTÍCULOS DE PIEL Y CUERO ', 4),
(23, 'FABRICACIÓN DE CALZADO ', 4),
(24, 'ASERRADO Y ACEPILLADURA DE MADERAS ', 4),
(25, 'FAB. DE PRODUCTOS DE MADERA Y CORCHO,  PAJA Y DE MATERIALES TRENZABLES ', 4),
(26, 'FABRICACIÓN DE PAPEL Y PRODUCTOS DEL PAPEL ', 4),
(27, 'ACTIVIDADES DE EDICIÓN ', 4),
(28, 'ACTIVIDADES DE IMPRESIÓN Y DE SERVICIOS CONEXOS ', 4),
(29, 'FABRICACIÓN DE PRODUCTOS DE HORNOS COQUE Y DE REFINACIÓN DE PETRÓLEO ', 4),
(30, 'ELABORACIÓN DE COMBUSTIBLE NUCLEAR ', 4),
(31, 'FABRICACIÓN DE SUSTANCIAS QUÍMICAS BÁSICAS ', 4),
(32, 'FABRICACIÓN DE OTROS PRODUCTOS QUÍMICOS ', 4),
(33, 'FABRICACIÓN DE FIBRAS MANUFACTURADAS ', 4),
(34, 'FABRICACIÓN DE PRODUCTOS DE CAUCHO ', 4),
(35, 'FABRICACIÓN DE PRODUCTOS DE PLÁSTICO ', 4),
(36, 'FABRICACIÓN DE VIDRIOS Y PRODUCTOS DE VIDRIO ', 4),
(37, 'FABRICACIÓN DE PRODUCTOS MINERALES NO METÁLICOS N.C.P. ', 4),
(38, 'INDUSTRIAS BÁSICAS DE HIERRO Y ACERO ', 5),
(39, 'FAB. DE PRODUCTOS PRIMARIOS DE METALES PRECIOSOS Y METALES NO FERROSOS ', 5),
(40, 'FUNDICIÓN DE METALES ', 5),
(41, 'FAB. DE PROD. METÁLICOS PARA USO ESTRUCTURAL ', 5),
(42, 'FAB. DE OTROS PROD. ELABORADOS DE METAL; ACT. DE TRABAJO DE METALES ', 5),
(43, 'FABRICACIÓN DE MAQUINARIA DE USO GENERAL ', 5),
(44, 'FABRICACIÓN DE MAQUINARIA DE USO ESPECIAL ', 5),
(45, 'FABRICACIÓN DE APARATOS DE USO DOMÉSTICO N.C.P. ', 5),
(46, 'FABRICACIÓN DE MAQUINARIA DE OFICINA, CONTABILIDAD E INFORMÁTICA ', 5),
(47, 'FAB. Y REPARACIÓN DE MOTORES, GENERADORES Y TRANSFORMADORES ELÉCTRICOS ', 5),
(48, 'FABRICACIÓN DE APARATOS DE DISTRIBUCIÓN Y CONTROL; SUS REPARACIONES ', 5),
(49, 'FABRICACIÓN DE HILOS Y CABLES AISLADOS ', 5),
(50, 'FABRICACIÓN DE ACUMULADORES DE PILAS Y BATERÍAS PRIMARIAS ', 5),
(51, 'FABRICACIÓN Y REPARACIÓN DE LÁMPARAS Y EQUIPO DE ILUMINACIÓN ', 5),
(52, 'FABRICACIÓN Y REPARACIÓN DE OTROS TIPOS DE EQUIPO ELÉCTRICO N.C.P. ', 5),
(53, 'FABRICACIÓN DE COMPONENTES ELECTRÓNICOS; SUS REPARACIONES ', 5),
(54, 'FAB. Y REPARACIÓN DE TRANSMISORES DE RADIO, TELEVISIÓN, TELEFONÍA ', 5),
(55, 'FAB. DE RECEPTORES DE RADIO, TELEVISIÓN, APARATOS DE AUDIO/VÍDEO ', 5),
(56, 'FAB. DE APARATOS E INSTRUMENTOS MÉDICOS Y PARA REALIZAR MEDICIONES ', 5),
(57, 'FAB. Y REPARACIÓN DE INSTRUMENTOS DE ÓPTICA Y EQUIPO FOTOGRÁFICO ', 5),
(58, 'FABRICACIÓN DE RELOJES ', 5),
(59, 'FABRICACIÓN DE VEHÍCULOS AUTOMOTORES ', 5),
(60, 'CONSTRUCCIÓN Y REPARACIÓN DE BUQUES Y OTRAS EMBARCACIONES ', 5),
(61, 'FAB. DE LOCOMOTORAS Y MATERIAL RODANTE PARA FERROCARRILES Y TRANVÍAS ', 5),
(62, 'FABRICACIÓN DE AERONAVES Y NAVES ESPACIALES; SUS REPARACIONES ', 5),
(63, 'FABRICACIÓN DE OTROS TIPOS DE EQUIPO DE TRANSPORTE N.C.P. ', 5),
(64, 'FABRICACIÓN DE MUEBLES ', 5),
(65, 'INDUSTRIAS MANUFACTURERAS N.C.P. ', 5),
(66, 'RECICLAMIENTO DE DESPERDICIOS Y DESECHOS ', 5),
(67, 'GENERACIÓN, CAPTACIÓN Y DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA ', 6),
(68, 'FABRICACIÓN DE GAS; DISTRIBUCIÓN DE COMBUSTIBLES GASEOSOS POR TUBERÍAS ', 6),
(69, 'SUMINISTRO DE VAPOR Y AGUA CALIENTE ', 6),
(70, 'CAPTACIÓN, DEPURACIÓN Y DISTRIBUCIÓN DE AGUA ', 6),
(71, 'CONSTRUCCIÓN ', 7),
(72, 'VENTA DE VEHÍCULOS AUTOMOTORES ', 8),
(73, 'MANTENIMIENTO Y REPARACIÓN DE VEHÍCULOS AUTOMOTORES ', 8),
(74, 'VENTA DE PARTES, PIEZAS Y ACCESORIOS DE VEHÍCULOS AUTOMOTORES ', 8),
(75, 'VENTA, MANTENIMIENTO Y REPARACIÓN DE MOTOCICLETAS Y SUS PARTES ', 8),
(76, 'VENTA AL POR MENOR DE COMBUSTIBLE PARA AUTOMOTORES ', 8),
(77, 'VENTA AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA ', 8),
(78, 'VENTA AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS ', 8),
(79, 'VENTA AL POR MAYOR DE ENSERES DOMÉSTICOS ', 8),
(80, 'VENTA AL POR MAYOR DE PRODUCTOS INTERMEDIOS, DESECHOS NO AGROPECUARIOS ', 8),
(81, 'VENTA AL POR MAYOR DE MAQUINARIA, EQUIPO Y MATERIALES CONEXOS ', 8),
(82, 'VENTA AL POR MAYOR DE OTROS PRODUCTOS ', 8),
(83, 'COMERCIO AL POR MENOR NO ESPECIALIZADO EN ALMACENES ', 8),
(84, 'VENTA POR MENOR DE ALIMENTOS, BEBIDAS, TABACOS EN ALMC. ESPECIALIZADOS ', 8),
(85, 'COMERCIO AL POR MENOR DE OTROS PROD. NUEVOS EN ALMC. ESPECIALIZADOS ', 8),
(86, 'VENTA AL POR MENOR EN ALMACENES DE ARTÍCULOS USADOS ', 8),
(87, 'COMERCIO AL POR MENOR NO REALIZADO EN ALMACENES ', 8),
(88, 'REPARACIÓN DE EFECTOS PERSONALES Y ENSERES DOMÉSTICOS ', 8),
(89, 'HOTELES; CAMPAMENTOS Y OTROS TIPOS DE HOSPEDAJE TEMPORAL ', 9),
(90, 'RESTAURANTES, BARES Y CANTINAS ', 9),
(91, 'TRANSPORTE POR FERROCARRILES ', 10),
(92, 'OTROS TIPOS DE TRANSPORTE POR VÍA TERRESTRE ', 10),
(93, 'TRANSPORTE POR TUBERÍAS ', 10),
(94, 'TRANSPORTE MARÍTIMO Y DE CABOTAJE ', 10),
(95, 'TRANSPORTE POR VÍAS DE NAVEGACIÓN INTERIORES ', 10),
(96, 'TRANSPORTE POR VÍA AÉREA ', 10),
(97, 'ACT. DE TRANSPORTE COMPLEMENTARIAS Y AUXILIARES; AGENCIAS DE VIAJE ', 10),
(98, 'ACTIVIDADES POSTALES Y DE CORREO ', 10),
(99, 'TELECOMUNICACIONES ', 10),
(100, 'INTERMEDIACIÓN MONETARIA ', 11),
(101, 'OTROS TIPOS DE INTERMEDIACIÓN FINANCIERA ', 11),
(102, 'FINANCIACIÓN PLANES DE SEG. Y DE PENSIONES, EXCEPTO AFILIACIÓN OBLIG. ', 11),
(103, 'ACT. AUX. DE LA INTERMEDIACIÓN FINANCIERA, EXCEPTO PLANES DE SEGUROS ', 11),
(104, 'ACT. AUXILIARES DE FINANCIACIÓN DE PLANES DE SEGUROS Y DE PENSIONES ', 11),
(105, 'ACTIVIDADES INMOBILIARIAS REALIZADAS CON BIENES PROPIOS O ARRENDADOS ', 12),
(106, 'ACT. INMOBILIARIAS REALIZADAS A CAMBIO DE RETRIBUCIÓN O POR CONTRATA ', 12),
(107, 'ALQUILER EQUIPO DE TRANSPORTE ', 12),
(108, 'ALQUILER DE OTROS TIPOS DE MAQUINARIA Y EQUIPO ', 12),
(109, 'ALQUILER DE EFECTOS PERSONALES Y ENSERES DOMÉSTICOS N.C.P. ', 12),
(110, 'SERVICIOS INFORMÁTICOS ', 12),
(111, 'MANTENIMIENTO Y REPARACIÓN DE MAQUINARIA DE OFICINA ', 12),
(112, 'ACTIVIDADES DE INVESTIGACIONES Y DESARROLLO EXPERIMENTAL ', 12),
(113, 'ACTIVIDADES JURÍDICAS Y DE ASESORAMIENTO EMPRESARIAL EN GENERAL ', 12),
(114, 'ACTIVIDADES DE ARQUITECTURA E INGENIERÍA Y OTRAS ACTIVIDADES TÉCNICAS ', 12),
(115, 'PUBLICIDAD ', 12),
(116, 'ACT. EMPRESARIALES Y DE PROFESIONALES PRESTADAS A EMPRESAS N.C.P. ', 12),
(117, 'GOBIERNO CENTRAL Y ADMINISTRACIÓN PÚBLICA ', 13),
(118, 'ACTIVIDADES DE PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA ', 13),
(119, 'ENSEÑANZA PREESCOLAR, PRIMARIA, SECUNDARIA Y SUPERIOR ; PROFESORES ', 14),
(120, 'ACTIVIDADES RELACIONADAS CON LA SALUD HUMANA ', 15),
(121, 'ACTIVIDADES VETERINARIAS ', 15),
(122, 'ACTIVIDADES DE SERVICIOS SOCIALES ', 15),
(123, 'ELIMINACIÓN DE DESPERDICIOS Y AGUAS RESIDUALES, SANEAMIENTO ', 16),
(124, 'ACT. DE ORGANIZACIONES EMPRESARIALES, PROFESIONALES Y DE EMPLEADORES ', 16),
(125, 'ACTIVIDADES DE SINDICATOS Y DE OTRAS ORGANIZACIONES ', 16),
(126, 'ACT. DE CINEMATOGRAFÍA, RADIO Y TV Y OTRAS ACT. DE ENTRETENIMIENTO ', 16),
(127, 'ACTIVIDADES DE AGENCIAS DE NOTICIAS Y SERVICIOS PERIODÍSTICOS ', 16),
(128, 'ACTIVIDADES DE BIBLIOTECAS, ARCHIVOS Y MUSEOS Y OTRAS ACT. CULTURALES ', 16),
(129, 'ACTIVIDADES DEPORTIVAS Y OTRAS ACTIVIDADES DE ESPARCIMIENTO ', 16),
(130, 'OTRAS ACTIVIDADES DE SERVICIOS ', 16),
(131, 'CONSEJO DE ADMINISTRACIÓN DE EDIFICIOS Y CONDOMINIOS ', 17),
(132, 'ORGANIZACIONES Y ÓRGANOS EXTRATERRITORIALES ', 18),
(133, 'CULTIVOS EN GENERAL, CULTIVO DE PRODUCTOS DE MERCADO, HORTICULTURA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE IF NOT EXISTS `mensaje` (
  `ID_MENSAJE` int(11) NOT NULL AUTO_INCREMENT,
  `PARA` varchar(100) NOT NULL,
  `DE` varchar(100) NOT NULL,
  `ASUNTO` varchar(300) DEFAULT NULL,
  `MENSAJE` varchar(2000) DEFAULT NULL,
  `NOMBRE_U_ANUNCIANTE` varchar(100) DEFAULT NULL,
  `CODIGO_ADMINISTRADOR` int(11) DEFAULT NULL,
  `FECHA` datetime NOT NULL,
  `TIPO_REMITENTE` varchar(100) NOT NULL,
  `ESTADO` varchar(1) NOT NULL,
  PRIMARY KEY (`ID_MENSAJE`),
  KEY `FK_ANUNCIANTE_MENSAJE` (`NOMBRE_U_ANUNCIANTE`),
  KEY `FK_ADMINISTRADOR_MENSAJE` (`CODIGO_ADMINISTRADOR`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`ID_MENSAJE`, `PARA`, `DE`, `ASUNTO`, `MENSAJE`, `NOMBRE_U_ANUNCIANTE`, `CODIGO_ADMINISTRADOR`, `FECHA`, `TIPO_REMITENTE`, `ESTADO`) VALUES
(36, 'administrador@anunciosgorup.cl', 'empresabebidas@gmail.com', 'Aun no se sube el anuncio', 'Estamos listos', 'Empresa2', NULL, '2015-07-08 21:09:39', 'E', 'N'),
(37, 'Empresa2', 'Ruben', 'Aun no se sube el anuncio', 'Funciona', 'Empresa2', 1, '2015-07-08 21:10:00', 'A', 'N'),
(38, 'Empresa2', 'administrador@anunciosgorup.cl', 'No contiene toda la informacion o esta inconclusa', 'Codigo anuncio: 20 \r\nNombre anuncio: Segundo Anuncio\r\n                                \r\n            ', 'Empresa2', NULL, '2015-07-08 21:12:23', 'A', 'N'),
(39, 'comidarapida', 'administrador@anunciosgorup.cl', 'Otros.', 'Codigo anuncio: 45 \r\nNombre anuncio: todas las variedades de otras marcas\r\n                         ', 'comidarapida', NULL, '2015-07-11 00:47:50', 'A', 'N'),
(40, 'administrador@anunciosgorup.cl', 'poleras.pro@mail.com', 'consejo publicidad de variedades', ' placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem ', 'poleraspro', NULL, '2015-07-11 00:52:27', 'E', 'N'),
(41, 'administrador@anunciosgorup.cl', 'poleras.pro@mail.com', 'Este es un asunto de prueba', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptatdsfsfsdfsdf', 'poleraspro', NULL, '2015-07-11 00:52:51', 'E', 'N'),
(42, 'administrador@anunciosgorup.cl', 'poleras.pro@mail.com', 'ayuda con anuncio de poleras', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'poleraspro', NULL, '2015-07-11 00:53:24', 'E', 'N'),
(43, 'administrador@anunciosgorup.cl', 'poleras.pro@mail.com', 'necesito me validen mis ShareCoins', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'poleraspro', NULL, '2015-07-11 00:53:29', 'E', 'N'),
(44, 'administrador@anunciosgorup.cl', 'javier@calzados.cl', 'Termino de ShareCoins', 'Favor Informar cuando no queden sharecoins de un anuncio', 'Javoru', NULL, '2015-07-11 00:53:38', 'E', 'N'),
(45, 'administrador@anunciosgorup.cl', 'kioskoDeLaEsquina@kioskos.cl', 'anuncios en estado raro', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'Kiosko de la Esquina', NULL, '2015-07-11 00:54:02', 'E', 'N'),
(46, 'administrador@anunciosgorup.cl', 'kioskoDeLaEsquina@kioskos.cl', 'album no se ve', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'Kiosko de la Esquina', NULL, '2015-07-11 00:54:09', 'E', 'N'),
(47, 'administrador@anunciosgorup.cl', 'kioskoDeLaEsquina@kioskos.cl', 'no tengo respuesta', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'Kiosko de la Esquina', NULL, '2015-07-11 00:54:20', 'E', 'N'),
(48, 'administrador@anunciosgorup.cl', 'kioskoDeLaEsquina@kioskos.cl', 'problema al ver imagen', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'Kiosko de la Esquina', NULL, '2015-07-11 00:54:27', 'E', 'N'),
(49, 'administrador@anunciosgorup.cl', 'juegos.retro@juegosretro.cl', 'favor validar sharecoins', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'JuegosRetro', NULL, '2015-07-11 00:54:55', 'E', 'N'),
(50, 'administrador@anunciosgorup.cl', 'juegos.retro@juegosretro.cl', 'error en paypal', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'JuegosRetro', NULL, '2015-07-11 00:55:02', 'E', 'N'),
(51, 'administrador@anunciosgorup.cl', 'comida.rapida@comidas.cl', 'papas no se ven', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'comidarapida', NULL, '2015-07-11 00:59:26', 'E', 'N'),
(52, 'administrador@anunciosgorup.cl', 'comida.rapida@comidas.cl', 'mas ayuda', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'comidarapida', NULL, '2015-07-11 00:59:31', 'E', 'N'),
(53, 'administrador@anunciosgorup.cl', 'comida.rapida@comidas.cl', 'problemas paypal', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'comidarapida', NULL, '2015-07-11 00:59:39', 'E', 'N'),
(54, 'administrador@anunciosgorup.cl', 'comida.rapida@comidas.cl', 'como te encuentro?', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'comidarapida', NULL, '2015-07-11 00:59:49', 'E', 'N'),
(55, 'administrador@anunciosgorup.cl', 'comida.rapida@comidas.cl', 'necesito me validen mis ShareCoins', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'comidarapida', NULL, '2015-07-11 01:00:38', 'E', 'N'),
(56, 'administrador@anunciosgorup.cl', 'comida.rapida@comidas.cl', 'problema al ver imagen', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'comidarapida', NULL, '2015-07-11 01:00:45', 'E', 'N'),
(57, 'administrador@anunciosgorup.cl', 'comida.rapida@comidas.cl', 'error en paypal', 'quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptat', 'comidarapida', NULL, '2015-07-11 01:00:52', 'E', 'N'),
(58, 'comidarapida', 'Ruben', 'problemas paypal', 'Cuentame mas sobre tu problemas para poder ayudarte.', 'comidarapida', 1, '2015-07-11 01:01:11', 'A', 'N'),
(59, 'comidarapida', 'Ruben', 'problema al ver imagen', 'Quizas el formato de la imagen no es el correcto prueba con uno jpeg.', 'comidarapida', 1, '2015-07-11 01:01:44', 'A', 'N'),
(60, 'comidarapida', 'Ruben', 'necesito me validen mis ShareCoins', 'Estimado, no ha llegado el pago de su solicitud por eso esta pendiente el anuncio.', 'comidarapida', 1, '2015-07-11 01:02:05', 'A', 'N'),
(61, 'Kiosko de la Esquina', 'administrador@anunciosgorup.cl', 'No cumple con politicas de AnunciosGroup.', 'Codigo anuncio: 26 \r\nNombre anuncio: Cigarros Malboro\r\n                                \r\n           ', 'Kiosko de la Esquina', NULL, '2015-07-11 09:15:21', 'A', 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE IF NOT EXISTS `provincia` (
  `ID_PROVINCIA` int(11) NOT NULL,
  `REGION_ID` int(11) NOT NULL,
  `NOMBRE_PROVINCIA` text,
  PRIMARY KEY (`ID_PROVINCIA`),
  KEY `FK_REGION_PROVINCIA_R` (`REGION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`ID_PROVINCIA`, `REGION_ID`, `NOMBRE_PROVINCIA`) VALUES
(11, 1, 'Iquique'),
(14, 1, 'Tamarugal'),
(21, 2, 'Antofagasta'),
(22, 2, 'El Loa'),
(23, 2, 'Tocopilla'),
(31, 3, 'Copiapó'),
(32, 3, 'Chañaral'),
(33, 3, 'Huasco'),
(41, 4, 'Elqui'),
(42, 4, 'Choapa'),
(43, 4, 'Limarí'),
(51, 5, 'Valparaíso'),
(52, 5, 'Isla de Pascua'),
(53, 5, 'Los Andes'),
(54, 5, 'Petorca'),
(55, 5, 'Quillota'),
(56, 5, 'San Antonio'),
(57, 5, 'San Felipe de Aconcagua'),
(58, 5, 'Marga Marga'),
(61, 6, 'Cachapoal'),
(62, 6, 'Cardenal Caro'),
(63, 6, 'Colchagua'),
(71, 7, 'Talca'),
(72, 7, 'Cauquenes'),
(73, 7, 'Curicó'),
(74, 7, 'Linares'),
(81, 8, 'Concepción'),
(82, 8, 'Arauco'),
(83, 8, 'Biobío'),
(84, 8, 'Ñuble'),
(91, 9, 'Cautín'),
(92, 9, 'Malleco'),
(101, 10, 'Llanquihue'),
(102, 10, 'Chiloé'),
(103, 10, 'Osorno'),
(104, 10, 'Palena'),
(111, 11, 'Coihaique'),
(112, 11, 'Aisén'),
(113, 11, 'Capitán Prat'),
(114, 11, 'General Carrera'),
(121, 12, 'Magallanes'),
(122, 12, 'Antártica Chilena'),
(123, 12, 'Tierra del Fuego'),
(124, 12, 'Última Esperanza'),
(131, 13, 'Santiago'),
(132, 13, 'Cordillera'),
(133, 13, 'Chacabuco'),
(134, 13, 'Maipo'),
(135, 13, 'Melipilla'),
(136, 13, 'Talagante'),
(141, 14, 'Valdivia'),
(142, 14, 'Ranco'),
(151, 15, 'ARICA'),
(152, 15, 'Parinacota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicar`
--

CREATE TABLE IF NOT EXISTS `publicar` (
  `ID_PUBLICAR` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_ANUNCIO` int(11) NOT NULL,
  `NOMBRE_U_DIFUSOR` varchar(100) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` time DEFAULT NULL,
  `ESTADO` varchar(1) NOT NULL,
  PRIMARY KEY (`ID_PUBLICAR`),
  KEY `FK_PUBLICAR_ANUNCIO` (`CODIGO_ANUNCIO`),
  KEY `FK_PUBLICAR_DIFUSOR` (`NOMBRE_U_DIFUSOR`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Volcado de datos para la tabla `publicar`
--

INSERT INTO `publicar` (`ID_PUBLICAR`, `CODIGO_ANUNCIO`, `NOMBRE_U_DIFUSOR`, `FECHA`, `HORA`, `ESTADO`) VALUES
(18, 21, 'rubenqs', '2015-07-09', '23:29:33', 'V'),
(20, 27, 'rubenqs2', '2015-07-10', '25:44:32', 'F'),
(21, 28, 'rubenqs2', '2015-07-09', '25:10:41', 'F'),
(22, 27, 'rubenqs', '2015-07-09', '00:18:54', 'V'),
(23, 28, 'rubenqs', '2015-07-09', '23:29:58', 'V'),
(24, 28, 'zamorator', '2015-07-13', '15:32:47', 'F'),
(25, 27, 'zamorator', '2015-07-10', '26:08:53', 'V'),
(26, 36, 'zamorator', '2015-07-13', '15:35:24', 'F'),
(27, 34, 'rubenqs', '2015-07-10', '23:10:05', 'V'),
(28, 35, 'rubenqs', '2015-07-12', '23:22:51', 'F'),
(29, 33, 'rubenqs', '2015-07-10', '23:10:13', 'V'),
(30, 32, 'rubenqs', '2015-07-11', '03:44:16', 'F'),
(31, 21, 'zamorator', '2015-07-10', '26:10:35', 'F'),
(32, 36, 'rubenqs', '2015-07-11', '03:43:45', 'F'),
(33, 35, 'zamorator', '2015-07-10', '23:12:05', 'V'),
(35, 34, 'zamorator', '2015-07-10', '26:14:28', 'V'),
(36, 37, 'rubenqs', '2015-07-11', '00:37:00', 'V'),
(37, 51, 'rubenqs', '2015-07-11', '00:59:34', 'V'),
(38, 30, 'Javier', '2015-07-11', '01:00:04', 'V'),
(39, 30, 'rubenqs', '2015-07-11', '11:02:31', 'F'),
(40, 51, 'zamorator', '2015-07-11', '01:01:59', 'V'),
(41, 38, 'zamorator', '2015-07-12', '22:54:09', 'F'),
(42, 49, 'Javier', '2015-07-11', '04:05:00', 'F'),
(43, 29, 'zamorator', '2015-07-11', '11:31:03', 'F'),
(44, 32, 'zamorator', '2015-07-11', '11:34:45', 'F'),
(45, 37, 'zamorator', '2015-07-11', '12:06:51', 'F'),
(46, 37, 'Mclio', '2015-07-11', '13:38:26', 'F'),
(47, 51, 'Mclio', '2015-07-11', '13:39:02', 'F'),
(48, 28, 'Mclio', '2015-07-11', '13:40:03', 'F'),
(49, 27, 'Mclio', '2015-07-11', '13:40:28', 'F'),
(50, 49, 'Mclio', '2015-07-11', '13:40:42', 'F'),
(51, 29, 'Mclio', '2015-07-11', '13:43:41', 'F'),
(52, 30, 'zamorator', '2015-07-12', '22:55:16', 'F'),
(53, 48, 'rubenqs', '2015-07-12', '20:22:21', 'V');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_social`
--

CREATE TABLE IF NOT EXISTS `red_social` (
  `ID_RED_SOCIAL` int(11) NOT NULL,
  `NOMBRE_RED_SOCIAL` text,
  PRIMARY KEY (`ID_RED_SOCIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `red_social`
--

INSERT INTO `red_social` (`ID_RED_SOCIAL`, `NOMBRE_RED_SOCIAL`) VALUES
(1, 'FACEBOOK'),
(2, 'TWITTER'),
(3, 'GOOGLE+');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `REGION_ID` int(11) NOT NULL,
  `NOMBRE_REGION` text,
  PRIMARY KEY (`REGION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`REGION_ID`, `NOMBRE_REGION`) VALUES
(1, 'Tarapacá'),
(2, 'Antofagasta'),
(3, 'Atacama'),
(4, 'Coquimbo'),
(5, 'Valparaíso'),
(6, 'Región del Libertador Gral. Bernardo O’Higgins'),
(7, 'Región del Maule'),
(8, 'Región del Biobío'),
(9, 'Región de la Araucanía'),
(10, 'Región de Los Lagos'),
(11, 'Región Aisén del Gral. Carlos Ibáñez del Campo'),
(12, 'Región de Magallanes y de la Antártica Chilena'),
(13, 'Región Metropolitana de Santiago'),
(14, 'Región de Los Ríos'),
(15, 'Arica y Parinacota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segmento_edad`
--

CREATE TABLE IF NOT EXISTS `segmento_edad` (
  `ID_SEGMENTO_EDAD` int(11) NOT NULL DEFAULT '0',
  `SEGMENTO_EDAD` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_SEGMENTO_EDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `segmento_edad`
--

INSERT INTO `segmento_edad` (`ID_SEGMENTO_EDAD`, `SEGMENTO_EDAD`) VALUES
(1, '15 a 18'),
(2, '19 a 29'),
(3, '30 a 39'),
(4, '40 a 49'),
(5, '50 a 59'),
(6, 'Todos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segmento_sexo`
--

CREATE TABLE IF NOT EXISTS `segmento_sexo` (
  `ID_SEGMENTO_SEXO` int(11) NOT NULL DEFAULT '0',
  `SEGMENTO_SEXO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_SEGMENTO_SEXO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `segmento_sexo`
--

INSERT INTO `segmento_sexo` (`ID_SEGMENTO_SEXO`, `SEGMENTO_SEXO`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Ambos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `share_coin`
--

CREATE TABLE IF NOT EXISTS `share_coin` (
  `ID_SHARE_COIN` int(100) NOT NULL AUTO_INCREMENT,
  `CODIGO_ANUNCIO` int(100) NOT NULL,
  `CANTIDAD_COMPARTIR` int(100) DEFAULT NULL,
  `CANTIDAD_EXTRA_COMPARTIR` int(100) DEFAULT NULL,
  `ID_VALOR_COIN` int(11) NOT NULL,
  `ESTADO` varchar(1) NOT NULL,
  PRIMARY KEY (`ID_SHARE_COIN`),
  KEY `FK_ANUNCIO_SHARE_POINT_R` (`CODIGO_ANUNCIO`),
  KEY `FK_VALOR_COIN_SHARE_COIN_R` (`ID_VALOR_COIN`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Volcado de datos para la tabla `share_coin`
--

INSERT INTO `share_coin` (`ID_SHARE_COIN`, `CODIGO_ANUNCIO`, `CANTIDAD_COMPARTIR`, `CANTIDAD_EXTRA_COMPARTIR`, `ID_VALOR_COIN`, `ESTADO`) VALUES
(37, 21, 316, 13, 1, 'L'),
(38, 22, 125, 0, 1, 'P'),
(39, 23, 125, 0, 1, 'L'),
(40, 24, 125, 0, 1, 'P'),
(41, 25, 125, 0, 1, 'L'),
(42, 26, 125, 0, 1, 'P'),
(43, 30, 197, 13, 1, 'L'),
(44, 27, 195, 13, 1, 'L'),
(45, 28, 193, 13, 1, 'L'),
(46, 29, 123, 0, 1, 'L'),
(47, 21, 200, 13, 1, 'A'),
(48, 32, 297, 50, 1, 'L'),
(49, 33, 125, 0, 1, 'L'),
(50, 34, 199, 13, 1, 'L'),
(51, 35, 123, 0, 1, 'L'),
(52, 36, 296, 50, 1, 'L'),
(53, 37, 123, 0, 1, 'L'),
(54, 38, 198, 13, 1, 'L'),
(55, 39, 300, 50, 1, 'L'),
(56, 40, 125, 0, 1, 'L'),
(57, 41, 200, 13, 1, 'R'),
(58, 42, 300, 50, 1, 'L'),
(59, 46, 125, 0, 1, 'P'),
(60, 47, 200, 13, 1, 'P'),
(61, 48, 300, 50, 1, 'L'),
(62, 50, 200, 13, 1, 'L'),
(63, 51, 299, 50, 1, 'L'),
(64, 49, 198, 13, 1, 'L'),
(65, 32, 200, 13, 1, 'P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valor_anuncio`
--

CREATE TABLE IF NOT EXISTS `valor_anuncio` (
  `ID_VALOR_ANUNCIO` int(11) NOT NULL AUTO_INCREMENT,
  `VALOR_REAL` int(100) NOT NULL,
  `CODIGO_ANUNCIO` int(100) NOT NULL,
  PRIMARY KEY (`ID_VALOR_ANUNCIO`),
  KEY `FK_ANUNCIO_VALOR_ANUNCIO_R` (`CODIGO_ANUNCIO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Volcado de datos para la tabla `valor_anuncio`
--

INSERT INTO `valor_anuncio` (`ID_VALOR_ANUNCIO`, `VALOR_REAL`, `CODIGO_ANUNCIO`) VALUES
(21, 1000, 22),
(22, 500, 23),
(23, 100, 24),
(24, 10000, 25),
(25, 3000, 26),
(26, 15000, 27),
(27, 20000, 28),
(28, 15000, 29),
(29, 100000, 30),
(30, 30000, 31),
(31, 3290, 32),
(32, 3490, 33),
(33, 1990, 34),
(34, 8990, 35),
(35, 890, 36),
(36, 15900, 37),
(37, 19990, 38),
(38, 15890, 39),
(39, 12990, 40),
(40, 15000, 41),
(41, 12980, 42),
(42, 50000, 43),
(43, 45000, 44),
(44, 7865, 45),
(45, 9000, 46),
(46, 10000, 47),
(47, 9800, 48),
(48, 150000, 49),
(49, 14500, 50),
(50, 25000, 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valor_coin`
--

CREATE TABLE IF NOT EXISTS `valor_coin` (
  `ID_VALOR_COIN` int(11) NOT NULL,
  `VALOR_COIN` int(11) NOT NULL,
  `DESCRIPCION_COIN` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_VALOR_COIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `valor_coin`
--

INSERT INTO `valor_coin` (`ID_VALOR_COIN`, `VALOR_COIN`, `DESCRIPCION_COIN`) VALUES
(1, 80, 'ANUNCIANTES'),
(2, 40, 'DIFUSOR');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador_giro_r`
--
ALTER TABLE `administrador_giro_r`
  ADD CONSTRAINT `FK_ADMINISTRADOR_GIRO_R` FOREIGN KEY (`CODIGO_GIRO`) REFERENCES `giro` (`CODIGO_GIRO`),
  ADD CONSTRAINT `FK_ADMINISTRADOR_GIRO_R2` FOREIGN KEY (`CODIGO_ADMINISTRADOR`) REFERENCES `administrador` (`CODIGO_ADMINISTRADOR`);

--
-- Filtros para la tabla `anunciante`
--
ALTER TABLE `anunciante`
  ADD CONSTRAINT `FK_COMUNA_ANUNCIANTE_R` FOREIGN KEY (`ID_COMUNA`) REFERENCES `comuna` (`ID_COMUNA`);

--
-- Filtros para la tabla `anunciante_giro`
--
ALTER TABLE `anunciante_giro`
  ADD CONSTRAINT `FK_ANUNCIANTE_GIRO` FOREIGN KEY (`CODIGO_GIRO`) REFERENCES `giro` (`CODIGO_GIRO`),
  ADD CONSTRAINT `FK_ANUNCIANTE_GIRO2` FOREIGN KEY (`NOMBRE_U_ANUNCIANTE`) REFERENCES `anunciante` (`NOMBRE_U_ANUNCIANTE`);

--
-- Filtros para la tabla `anuncio`
--
ALTER TABLE `anuncio`
  ADD CONSTRAINT `FK_ANUNCIANTE_ANUNCIO_R` FOREIGN KEY (`NOMBRE_U_ANUNCIANTE`) REFERENCES `anunciante` (`NOMBRE_U_ANUNCIANTE`),
  ADD CONSTRAINT `FK_CATEGORIA_ANUNCIO_R` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID_CATEGORIA`),
  ADD CONSTRAINT `FK_SEGMENTO_EDAD_ANUNCIO_R` FOREIGN KEY (`ID_SEGMENTO_EDAD`) REFERENCES `segmento_edad` (`ID_SEGMENTO_EDAD`),
  ADD CONSTRAINT `FK_SEGMENTO_SEXO_ANUNCIO_R` FOREIGN KEY (`ID_SEGMENTO_SEXO`) REFERENCES `segmento_sexo` (`ID_SEGMENTO_SEXO`);

--
-- Filtros para la tabla `coin`
--
ALTER TABLE `coin`
  ADD CONSTRAINT `FK_DIFUSOR_AG_PUNTO` FOREIGN KEY (`NOMBRE_U_DIFUSOR`) REFERENCES `difusor` (`NOMBRE_U_DIFUSOR`),
  ADD CONSTRAINT `FK_VALOR_COIN_COIN_R` FOREIGN KEY (`ID_VALOR_COIN`) REFERENCES `valor_coin` (`ID_VALOR_COIN`);

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `FK_PROVINCIA_COMUNA_R` FOREIGN KEY (`ID_PROVINCIA`) REFERENCES `provincia` (`ID_PROVINCIA`);

--
-- Filtros para la tabla `cupon`
--
ALTER TABLE `cupon`
  ADD CONSTRAINT `FK_ANUNCIO_CUPON_R` FOREIGN KEY (`CODIGO_ANUNCIO`) REFERENCES `anuncio` (`CODIGO_ANUNCIO`),
  ADD CONSTRAINT `FK_DIFUSOR_CUPON_R` FOREIGN KEY (`NOMBRE_U_DIFUSOR`) REFERENCES `difusor` (`NOMBRE_U_DIFUSOR`);

--
-- Filtros para la tabla `difusor`
--
ALTER TABLE `difusor`
  ADD CONSTRAINT `FK_AVATAR_DIFUSOR_R` FOREIGN KEY (`ID_AVATAR`) REFERENCES `avatar` (`ID_AVATAR`),
  ADD CONSTRAINT `FK_SEGMENTO_EDAD_DIFUSOR_R` FOREIGN KEY (`ID_SEGMENTO_EDAD`) REFERENCES `segmento_edad` (`ID_SEGMENTO_EDAD`),
  ADD CONSTRAINT `FK_SEGMENTO_SEXO_DIFUSOR_R` FOREIGN KEY (`ID_SEGMENTO_SEXO`) REFERENCES `segmento_sexo` (`ID_SEGMENTO_SEXO`);

--
-- Filtros para la tabla `difusor_anuncio_r`
--
ALTER TABLE `difusor_anuncio_r`
  ADD CONSTRAINT `FK_DIFUSOR_ANUNCIO_R` FOREIGN KEY (`NOMBRE_U_DIFUSOR`) REFERENCES `difusor` (`NOMBRE_U_DIFUSOR`),
  ADD CONSTRAINT `FK_DIFUSOR_ANUNCIO_R2` FOREIGN KEY (`CODIGO_ANUNCIO`) REFERENCES `anuncio` (`CODIGO_ANUNCIO`);

--
-- Filtros para la tabla `difusor_redsocial_r`
--
ALTER TABLE `difusor_redsocial_r`
  ADD CONSTRAINT `FK_DIFUSOR_REDSOCIAL_R` FOREIGN KEY (`ID_RED_SOCIAL`) REFERENCES `red_social` (`ID_RED_SOCIAL`),
  ADD CONSTRAINT `FK_DIFUSOR_REDSOCIAL_R2` FOREIGN KEY (`NOMBRE_U_DIFUSOR`) REFERENCES `difusor` (`NOMBRE_U_DIFUSOR`);

--
-- Filtros para la tabla `favorito`
--
ALTER TABLE `favorito`
  ADD CONSTRAINT `FK_ANUNCIO_FAVORITO` FOREIGN KEY (`CODIGO_ANUNCIO`) REFERENCES `anuncio` (`CODIGO_ANUNCIO`),
  ADD CONSTRAINT `FK_DIFUSOR_FAVORITO` FOREIGN KEY (`NOMBRE_U_DIFUSOR`) REFERENCES `difusor` (`NOMBRE_U_DIFUSOR`);

--
-- Filtros para la tabla `giro`
--
ALTER TABLE `giro`
  ADD CONSTRAINT `FK_GIRO_GIRO_DETALLE_R` FOREIGN KEY (`ID_GIRO_DETALLE`) REFERENCES `giro_detalle` (`ID_GIRO_DETALLE`);

--
-- Filtros para la tabla `giro_detalle`
--
ALTER TABLE `giro_detalle`
  ADD CONSTRAINT `FK_GIRO_DETALLE_GIRO_CABECERA_R` FOREIGN KEY (`ID_GIRO_CABECERA`) REFERENCES `giro_cabecera` (`ID_GIRO_CABECERA`);

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `FK_ADMINISTRADOR_MENSAJE` FOREIGN KEY (`CODIGO_ADMINISTRADOR`) REFERENCES `administrador` (`CODIGO_ADMINISTRADOR`),
  ADD CONSTRAINT `FK_ANUNCIANTE_MENSAJE` FOREIGN KEY (`NOMBRE_U_ANUNCIANTE`) REFERENCES `anunciante` (`NOMBRE_U_ANUNCIANTE`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `FK_REGION_PROVINCIA_R` FOREIGN KEY (`REGION_ID`) REFERENCES `region` (`REGION_ID`);

--
-- Filtros para la tabla `publicar`
--
ALTER TABLE `publicar`
  ADD CONSTRAINT `FK_PUBLICAR_ANUNCIO` FOREIGN KEY (`CODIGO_ANUNCIO`) REFERENCES `anuncio` (`CODIGO_ANUNCIO`),
  ADD CONSTRAINT `FK_PUBLICAR_DIFUSOR` FOREIGN KEY (`NOMBRE_U_DIFUSOR`) REFERENCES `difusor` (`NOMBRE_U_DIFUSOR`);

--
-- Filtros para la tabla `share_coin`
--
ALTER TABLE `share_coin`
  ADD CONSTRAINT `FK_ANUNCIO_SHARE_POINT_R` FOREIGN KEY (`CODIGO_ANUNCIO`) REFERENCES `anuncio` (`CODIGO_ANUNCIO`),
  ADD CONSTRAINT `FK_VALOR_COIN_SHARE_COIN_R` FOREIGN KEY (`ID_VALOR_COIN`) REFERENCES `valor_coin` (`ID_VALOR_COIN`);

--
-- Filtros para la tabla `valor_anuncio`
--
ALTER TABLE `valor_anuncio`
  ADD CONSTRAINT `FK_ANUNCIO_VALOR_ANUNCIO_R` FOREIGN KEY (`CODIGO_ANUNCIO`) REFERENCES `anuncio` (`CODIGO_ANUNCIO`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
