SELECT 
   u.usuario,
   u.mail AS mail_usuarios_activos

FROM gedo_ged.gedo_historial gh
INNER JOIN co_ged.datos_usuario u 
   ON gh.usuario = u.usuario
INNER JOIN track_ged.sade_sector_usuario s 
   ON s.nombre_usuario = u.usuario

WHERE 
   s.estado_registro = 1 
   AND u.aceptacion_tyc = 1

UNION

SELECT 
   u.usuario,
   u.mail AS mail_usuarios_activos

FROM ee_ged.historialoperacion ho
INNER JOIN co_ged.datos_usuario u 
   ON ho.usuario = u.usuario
INNER JOIN track_ged.sade_sector_usuario s 
   ON s.nombre_usuario = u.usuario

WHERE 
   s.estado_registro = 1 
   AND u.aceptacion_tyc = 1
;   