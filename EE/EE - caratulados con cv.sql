SELECT * FROM (
    SELECT  
        ee.tipo_documento || '-' || ee.anio || '-' || ee.numero || '- -' ||
        ee.codigo_reparticion_actuacion || '-' || ee.codigo_reparticion_usuario AS nro_expediente, 
        ee.usuario_creador AS usuario_caratulador,
        ee.codigo_reparticion_usuario AS cod_reparticion_caratulacion, 
        rep_caratula.nombre_reparticion AS reparticion_caratulacion, 
        min_caratula.codigo_reparticion AS cod_organismo_caratulacion, 
        min_caratula.nombre_reparticion AS organismo_caratulacion, 
        ee.fecha_creacion AS fecha_caratulacion,
        tratas.codigo_trata,
        tratas.descripcion AS trata,  
        ee.descripcion AS descripcion, 
        solex.motivo, 
        ee.estado AS estado_expediente,
        NVL(REGEXP_SUBSTR(t.assignee_, '[^.]+'), 'simple') AS tipo_tramitacion,
        REGEXP_SUBSTR(t.assignee_, '[^.]+') AS usuario_asignado,
        du.apellido_nombre AS nombre_apellido,
        COALESCE(
            REGEXP_SUBSTR(REGEXP_SUBSTR(p.groupid_, '[^-]+', 1, 2), '[^.]+'), 
            ssi.codigo_sector_interno
        ) AS sector_actual,
        repfin.codigo_reparticion AS cod_reparticion_actual,
        repfin.nombre_reparticion AS reparticion_actual,
        minfin.codigo_reparticion AS cod_organismo_actual,  
        minfin.nombre_reparticion AS organismo_actual,
        ee.usuario_modificacion,
        ee.fecha_modificacion AS fecha_ultima_modificacion, 
        ROUND(SYSDATE - ee.fecha_creacion) AS dias_abierto,
        dfvalue.input_name,
        dfvalue.value_str
    FROM 
        ee_ged.ee_expediente_electronico ee
    LEFT JOIN ee_ged.solicitud_expediente solex ON solex.id = ee.solicitud_iniciadora
    LEFT JOIN ee_ged.trata tratas ON tratas.id = ee.id_trata
    LEFT JOIN ee_ged.jbpm4_task t ON t.execution_id_ = ee.id_workflow
    LEFT JOIN ee_ged.jbpm4_participation p ON p.task_ = t.dbid_
    
    -- Caratulación
    LEFT JOIN track_ged.sade_reparticion rep_caratula ON ee.codigo_reparticion_usuario = rep_caratula.codigo_reparticion
    LEFT JOIN track_ged.sade_reparticion min_caratula ON rep_caratula.ministerio = min_caratula.id_reparticion
        
    -- Esta asignado a usuario
    LEFT JOIN track_ged.sade_sector_usuario su ON REGEXP_SUBSTR(t.assignee_, '[^.]+') = su.nombre_usuario
        AND su.id_sector_usuario = (
            SELECT MAX(z.id_sector_usuario) 
            FROM track_ged.sade_sector_usuario z 
            WHERE z.nombre_usuario = REGEXP_SUBSTR(t.assignee_, '[^.]+')
        )
    LEFT JOIN co_ged.datos_usuario du ON du.usuario = su.nombre_usuario
    LEFT JOIN track_ged.sade_sector_interno ssi ON su.id_sector_interno = ssi.id_sector_interno
    LEFT JOIN track_ged.sade_reparticion sr ON ssi.codigo_reparticion = sr.id_reparticion
    LEFT JOIN track_ged.sade_reparticion sr1 ON sr1.id_reparticion = sr.ministerio

    -- Sin asignar a usuario
    LEFT JOIN track_ged.sade_reparticion repa ON REGEXP_SUBSTR(p.groupid_, '[^-]+') = repa.codigo_reparticion
    LEFT JOIN track_ged.sade_reparticion ministerio ON ministerio.id_reparticion = repa.ministerio

    -- Repartición/Ministerio Actual
    LEFT JOIN track_ged.sade_reparticion repfin ON repfin.codigo_reparticion = COALESCE(sr.codigo_reparticion, repa.codigo_reparticion)
    LEFT JOIN track_ged.sade_reparticion minfin ON minfin.codigo_reparticion = COALESCE(sr1.codigo_reparticion, ministerio.codigo_reparticion)

    -- Documentos
    LEFT JOIN ee_ged.ee_expediente_documentos eedocs ON eedocs.id = ee.id AND eedocs.posicion = 1
    LEFT JOIN ee_ged.documento eedoc ON eedocs.id_documento = eedoc.id
    LEFT JOIN gedo_ged.df_form_comp_value dfvalue ON dfvalue.id_transaction = eedoc.id_transaccion_fc
   
    WHERE
        tratas.codigo_trata = 'LEG0020' 
        AND ee.codigo_reparticion_usuario != 'TESTGDEBA'
        AND ee.fecha_creacion > TRUNC(SYSDATE, 'YEAR')
)
PIVOT(MAX(value_str) 
      FOR input_name IN (
          'idorganismo' AS idorganismo,
          'organismoorigen' AS organismoorigen,
          'idcausanumero' AS idcausanumero,
          'idnotificacion' AS idnotificacion)
);
