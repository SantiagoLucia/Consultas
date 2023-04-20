/* CANTIDAD DE COMUNICACIONES EN BANDEJA Y ESTADO */

SELECT
   SUM(CASE WHEN dest.fecha_eliminacion_bandeja IS NULL THEN 1 ELSE 0 END) en_bandeja,
   SUM(CASE WHEN dest.leido IS NULL AND dest.fecha_eliminacion_bandeja IS NULL THEN 1 ELSE 0 END) sin_leer,
   SUM(CASE WHEN dest.leido IS NOT NULL AND dest.fecha_eliminacion_bandeja IS NULL THEN 1 ELSE 0 END) leidas

FROM
   gedo_ged.ccoo_comunicacion_destino dest
   INNER JOIN gedo_ged.ccoo_comunicacion com ON dest.id_comunicacion = com.id

WHERE
dest.nombre_usuario = 'SPRIVITERA';