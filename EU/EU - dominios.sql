SELECT DISTINCT 
   LOWER(
      REGEXP_REPLACE(
         REGEXP_SUBSTR(du.mail, '[^@]+', 1, 2),
         '[^A-Z0-9-.]', 
         ''
      )
   ) AS DOMINIOS

FROM track_ged.sade_sector_usuario su
INNER JOIN co_ged.datos_usuario du 
   ON du.usuario = su.nombre_usuario

WHERE 
   du.aceptacion_tyc = 1 
   AND su.estado_registro = 1

ORDER BY DOMINIOS ASC;