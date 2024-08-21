SELECT
    ee.tipo_documento || '-' || ee.anio || '-' || ee.numero || '- -' || ee.codigo_reparticion_actuacion || '-' || ee.codigo_reparticion_usuario AS nro_expediente,
    ee.codigo_reparticion_usuario AS cod_reparticion_caratulacion,
    sr.nombre_reparticion AS reparticion_caratulacion, 
    sr2.codigo_reparticion AS cod_organismo_caratulacion, 
    sr2.nombre_reparticion AS organismo_caratulacion, 
    TO_CHAR(ee.fecha_creacion,'dd/mm/yyyy') AS fecha_caratulacion, 
    TO_CHAR(ee.fecha_creacion,'hh24:mi:ss') AS hora_caratulacion,
    t.codigo_trata,
    t.descripcion AS trata,  
    ee.descripcion AS descripcion,    
    solex.motivo,
    ee.estado AS estado_expediente,
    CASE 
        WHEN jt.assignee_ IS NOT NULL THEN NVL(REGEXP_SUBSTR(jt.assignee_, '[^\.]+', 1, 2), 'simple')	
        WHEN jp.groupid_ IS NOT NULL THEN NVL(REGEXP_SUBSTR(jp.groupid_, '[^\.]+', 1, 2), 'simple')
    END AS tipo_tramitacion,
    REGEXP_SUBSTR(jt.assignee_, '[^\.]+') AS usuario_asignado,
    du.apellido_nombre AS nombre_apellido,
    COALESCE(ssi.codigo_sector_interno, REGEXP_SUBSTR(jp.groupid_, '[A-Z0-9#]+', 1, 2)) AS sector_actual,
    COALESCE(sr3.codigo_reparticion, sr5.codigo_reparticion) AS cod_reparticion_actual,
    COALESCE(sr3.nombre_reparticion, sr5.nombre_reparticion) AS reparticion_actual,
    COALESCE(sr4.codigo_reparticion, sr6.codigo_reparticion) AS cod_organismo_actual,
    COALESCE(sr4.nombre_reparticion, sr6.nombre_reparticion) AS organismo_actual,
    ee.usuario_modificacion,
    TO_CHAR(ee.fecha_modificacion, 'dd/mm/yyyy') AS fecha_ultima_modificacion, 
    TO_CHAR(ee.fecha_modificacion, 'hh24:mi:ss') AS hora_ultima_modificacion,
    ROUND(SYSDATE - ee.fecha_creacion) AS dias_abierto
FROM 
    ee_ged.ee_expediente_electronico ee 
LEFT JOIN ee_ged.solicitud_expediente solex ON solex.id = ee.solicitud_iniciadora
LEFT JOIN ee_ged.jbpm4_task jt ON ee.id_workflow = jt.execution_id_ 
LEFT JOIN ee_ged.jbpm4_participation jp ON jt.dbid_ = jp.task_ 
LEFT JOIN ee_ged.trata t ON ee.id_trata = t.id 
LEFT JOIN track_ged.sade_reparticion sr ON ee.codigo_reparticion_usuario = sr.codigo_reparticion 
LEFT JOIN track_ged.sade_reparticion sr2 ON sr.ministerio = sr2.id_reparticion  
LEFT JOIN track_ged.sade_sector_usuario ssu ON REGEXP_SUBSTR(jt.assignee_, '[^\.]+') = ssu.nombre_usuario AND ssu.estado_registro = 1
LEFT JOIN track_ged.sade_sector_interno ssi ON ssu.id_sector_interno = ssi.id_sector_interno 
LEFT JOIN track_ged.sade_reparticion sr3 ON ssi.codigo_reparticion = sr3.id_reparticion 
LEFT JOIN track_ged.sade_reparticion sr4 ON sr3.ministerio = sr4.id_reparticion
LEFT JOIN co_ged.datos_usuario du ON du.usuario = ssu.nombre_usuario
LEFT JOIN track_ged.sade_reparticion sr5 ON REGEXP_SUBSTR(jp.groupid_, '[^-]+') = sr5.codigo_reparticion
LEFT JOIN track_ged.sade_reparticion sr6 ON sr5.ministerio = sr6.id_reparticion 
WHERE
    ee.fecha_creacion > TRUNC(SYSDATE);
