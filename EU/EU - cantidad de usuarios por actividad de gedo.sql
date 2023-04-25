SELECT
   gh.actividad,
   COUNT (DISTINCT gh.usuario) AS total_usuarios_activos
FROM
   gedo_ged.gedo_historial       gh
   INNER JOIN co_ged.datos_usuario u
   ON gh.usuario = u.usuario
   LEFT JOIN co_ged.cargos c
   ON c.id = u.cargo
   INNER JOIN track_ged.sade_sector_usuario s
   ON s.nombre_usuario = u.usuario
WHERE
   s.estado_registro = 1
   AND u.aceptacion_tyc = 1
GROUP BY
   gh.actividad;

SELECT
   COUNT(*) AS "CON PRIMER INGRESO"
FROM
   co_ged.datos_usuario          du
   LEFT OUTER JOIN co_ged.cargos c
   ON (du.cargo = c.id)
   LEFT OUTER JOIN track_ged.sade_sector_usuario su
   ON (du.usuario = su.nombre_usuario)
   LEFT OUTER JOIN track_ged.sade_sector_interno ssi
   ON (su.id_sector_interno = ssi.id_sector_interno)
   LEFT OUTER JOIN track_ged.sade_reparticion sr
   ON (ssi.codigo_reparticion = sr.id_reparticion)
   LEFT OUTER JOIN track_ged.sade_reparticion sr1
   ON (sr.ministerio = sr1.id_reparticion)
WHERE
   su.estado_registro = 1
   AND aceptacion_tyc = 1;