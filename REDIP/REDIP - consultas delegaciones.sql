-----------------------------------------------------------------------------------------------------------------------------

-- SELECCIONAR DELEGACIONES --

SELECT * FROM RCE_GED.SYS_CIRCUNSCRIPCION 
WHERE id_circunscripcion BETWEEN 5528 AND 5536
ORDER BY ID_CIRCUNSCRIPCION ASC;

SELECT * FROM RCE_GED.SYS_CIRCUNSCRIPCION WHERE nombre LIKE '%Blanca%';

SELECT *
FROM (SELECT * FROM RCE_GED.SYS_CIRCUNSCRIPCION ORDER BY ID_CIRCUNSCRIPCION DESC) CIR
WHERE ROWNUM <= 9
ORDER BY ROWNUM DESC;

-----------------------------------------------------------------------------------------------------------------------------

-- SELECCIONAR LOCALIDAD, DEPARTAMENTO Y PROVINCIA QUE COINCIDA CON EL NOMBRE DE LA LOCALIDAD Y PROVINCIA DE BUENOS AIRES --

SELECT loc.id      AS "ID LOCALIDAD",
       loc.nombre  AS "LOCALIDAD",
       dep.id      AS "ID DEPARTAMENTO",
       dep.nombre  AS "DEPARTAMENTO",
       PROV.id     AS "ID PROVINCIA",
       prov.nombre AS "PROVINCIA"

FROM Eu_Ged.Eu_Localidad  LOC
INNER JOIN eu_ged.eu_departamento dep ON loc.id_departamento = dep.id
INNER JOIN eu_ged.eu_provincia prov   ON dep.id_provincia = prov.id

WHERE   loc.nombre LIKE  '%CORONEL SUAREZ%' AND loc.id_provincia = 97 ;

-----------------------------------------------------------------------------------------------------------------------------

-- INFORME DE DELEGACIONES INSERTADAS EN RANGO DE ID --

SELECT cir.id_circunscripcion        AS "ID CIRCUNSCRIPCION",
       cir.nombre                    AS "NOMBRE CIRCUNSCRIPCION", 
       cir.codigo_delegacion_renaper AS "CODIGO RENAPER", 
       loc.nombre                    AS "LOCALIDAD", 
       dep.nombre                    AS "DEPARTAMENTO", 
       tr.id_tipo_registro           AS "TIPO REGISTRO", 
       tr.descripcion                AS "DESCRIPCION TIPO REGISTRO",
       k.id_kodak_circunscripcion    AS "ID KODAK"
       
FROM rce_ged.sys_circunscripcion cir
INNER JOIN rce_ged.sys_tipo_registro tr       ON cir.fk_tipo_registro = tr.id_tipo_registro
INNER JOIN eu_ged.eu_localidad loc            ON cir.fk_localidad = loc.id
INNER JOIN eu_ged.eu_departamento dep         ON loc.id_departamento = dep.id
LEFT JOIN rce_ged.sys_kodak_circunscripcion k ON k.fk_circunscripcion = cir.id_circunscripcion

--WHERE id_circunscripcion BETWEEN 5500 AND 5536

ORDER BY cir.id_circunscripcion DESC;

-----------------------------------------------------------------------------------------------------------------------------

-- DELEGACIONES HISTORICAS (TABLA KODAK)

SELECT k.id_kodak_circunscripcion AS "ID KODAK",
       k.fk_tipo_registro         AS "TIPO REGISTRO",
       r.descripcion,
       k.nombre                   AS "CODIGO RENAPER",
       k.fk_circunscripcion       AS "ID CIRCUNSCRIPCION",
       c.nombre

FROM rce_ged.sys_kodak_circunscripcion k
INNER JOIN rce_ged.sys_tipo_registro r   ON k.fk_tipo_registro = r.id_tipo_registro
INNER JOIN rce_ged.sys_circunscripcion c ON k.fk_circunscripcion = c.id_circunscripcion
ORDER BY id_kodak_circunscripcion DESC;

-----------------------------------------------------------------------------------------------------------------------------
-- TIPOS DE DELEGACIONES --
--+--------------------------------+
4 | Matrimonio                     |
--+--------------------------------+
5 | Digitalización de Matrimonios  |
--+--------------------------------+
1 | Certificado                    |
--+--------------------------------+
2 | Defunción                      |
--+--------------------------------+
6 | Digitalización de Defunciones  |
--+--------------------------------+
8 | Nacimiento                     |
--+--------------------------------+
3 | Digitalización de Nacimientos  |
--+--------------------------------+