SELECT
EE.tipo_documento||'-'||EE.anio||'-'||EE.numero||'- -'||
   EE.codigo_reparticion_actuacion||'-'||EE.codigo_reparticion_usuario AS nro_expediente,
T.assignee_,
EE.id AS id_expediente,
H.id,

CASE 
   WHEN H.codigo_sector_destino IS NULL 
      THEN H.sector_usuario_origen
      ELSE H.codigo_sector_destino
END AS codigo_sector_destino,

CASE
   WHEN H.codigo_reparticion_destino IS NULL
      THEN H.reparticion_usuario
      ELSE H.codigo_reparticion_destino
END AS codigo_reparticion_destino,

H.ord_hist,
H.fecha_operacion,
H.reparticion_usuario,
H.sector_usuario_origen
 
FROM EE_GED.jbpm4_task T

INNER JOIN EE_GED.ee_expediente_electronico EE 
ON T.execution_id_ = EE.id_workflow

INNER JOIN EE_GED.historialoperacion H
ON EE.id = H.id_expediente 
AND H.ord_hist = (SELECT MAX(ord_hist) FROM EE_GED.historialoperacion
             WHERE id_expediente = EE.id)

WHERE T.assignee_ IS NOT NULL
;
