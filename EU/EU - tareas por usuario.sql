--tareas GEDO--
SELECT
   s.nombre_usuario as usuario,
   du.apellido_nombre AS nombre_apellido,
   c.cargo,
   r.codigo_reparticion AS codigo_reparticion,
   r.nombre_reparticion AS nombre_reparticion,
   r1.codigo_reparticion AS codigo_ministerio,
   r1.nombre_reparticion AS nombre_ministerio,
   
   COUNT(
      CASE 
         WHEN task.name_ = 'Revisar Documento' 
           OR task.name_ = 'Revisar Documento con Firma Conjunta' 
         THEN 1 
      END) AS revisar_documento,
   
   COUNT( 
      CASE 
         WHEN task.name_ = 'Confeccionar Documento' 
         THEN 1 
      END) AS confeccionar_documento,
   
   COUNT( 
      CASE 
         WHEN task.name_ = 'Rechazado' 
         THEN 1 
      END) AS rechazar_documento,
   
   COUNT( 
      CASE 
         WHEN task.name_ = 'Firmar Documento' 
         THEN 1 
      END) AS firmar_documento,
   
   COUNT(
      CASE 
         WHEN task.name_ = 'Revisar Documento' 
           OR task.name_ = 'Revisar Documento con Firma Conjunta'
           OR task.name_ = 'Confeccionar Documento' 
           OR task.name_ = 'Firmar Documento' 
           OR task.name_ = 'Rechazado' 
         THEN 1 
      END) AS total

FROM gedo_ged.jbpm4_task task
LEFT OUTER JOIN co_ged.datos_usuario du 
   ON du.usuario = task.assignee_
LEFT OUTER JOIN co_ged.cargos c 
   ON du.cargo = c.id
LEFT OUTER JOIN track_ged.sade_sector_usuario s 
   ON s.nombre_usuario = du.usuario
LEFT OUTER JOIN track_ged.sade_sector_interno si 
   ON si.id_sector_interno = S.id_sector_interno
LEFT OUTER JOIN track_ged.sade_reparticion r 
   ON r.id_reparticion = si.codigo_reparticion
LEFT OUTER JOIN  track_ged.sade_reparticion r1 
   ON r1.id_reparticion = R.ministerio

WHERE r.codigo_reparticion = 'DIPMJGM'
  AND s.estado_registro = 1

GROUP BY 
   s.nombre_usuario,
   du.apellido_nombre,
   c.cargo,
   r.codigo_reparticion,
   r.nombre_reparticion,
   r1.codigo_reparticion,
   r1.nombre_reparticion

ORDER BY 
   s.nombre_usuario
;