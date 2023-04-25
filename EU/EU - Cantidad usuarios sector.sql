SELECT
   --su.nombre_usuario,
   --su.fecha_creacion,
   si.codigo_sector_interno AS sector,
   r1.codigo_reparticion AS reparticion,
   r2.codigo_reparticion AS ministerio,
   count(*) AS cantidad_usuarios

FROM track_ged.sade_sector_usuario su
INNER JOIN track_ged.sade_sector_interno si 
   ON si.id_sector_interno = su.id_sector_interno 
INNER JOIN track_ged.sade_reparticion r1 
   ON si.codigo_reparticion = r1.id_reparticion
INNER JOIN track_ged.sade_reparticion r2 
   ON r1.ministerio = r2.id_reparticion

WHERE 
   r1.codigo_reparticion = 'DIPMJGM'
   AND su.estado_registro = 1

GROUP BY 
   si.codigo_sector_interno, 
   r1.codigo_reparticion, 
   r2.codigo_reparticion;