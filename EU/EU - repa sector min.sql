SELECT
   minis.codigo_reparticion AS codigo_ministerio,
   minis.nombre_reparticion AS nombre_ministerio,
   repa.codigo_reparticion AS codigo_reparticion,
   repa.nombre_reparticion,    
   si.codigo_sector_interno,
   si.nombre_sector_interno,
   repa.vigencia_desde,
   repa.vigencia_hasta
    
FROM 
track_ged.sade_sector_interno si
INNER JOIN track_ged.sade_reparticion repa 
   ON repa.id_reparticion = si.codigo_reparticion
INNER JOIN track_ged.sade_reparticion minis 
   ON minis.id_reparticion = repa.ministerio

WHERE 
   repa.estado_registro = 1 
   AND minis.estado_registro = 1 
   AND repa.vigencia_hasta > sysdate
   AND minis.vigencia_hasta > sysdate

ORDER BY minis.nombre_reparticion, repa.nombre_reparticion;