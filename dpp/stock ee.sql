-- STOCK EE

SELECT
    SU.NOMBRE_USUARIO,
    DU.APELLIDO_NOMBRE NOMBRE_APELLIDO,
    DU.MAIL,
    SIU.CODIGO_SECTOR_INTERNO CODIGO_SECTOR_INTERNO,
    SIU.NOMBRE_SECTOR_INTERNO NOMBRE_SECTOR_INTERNO,
    SRU.CODIGO_REPARTICION,
    SRU.NOMBRE_REPARTICION,
    
    CASE WHEN EE.TIPO_DOCUMENTO IS NOT NULL THEN
    (EE.TIPO_DOCUMENTO||'-'||EE.ANIO||'-'||EE.NUMERO||'- -'||EE.CODIGO_REPARTICION_ACTUACION||'-'||EE.CODIGO_REPARTICION_USUARIO)
    ELSE NULL END NRO_EXPEDIENTE,
    
    COALESCE(TO_CHAR(
    (SELECT 
    MAX(FECHA_OPERACION)
    FROM EE_GED.HISTORIALOPERACION HIST
    WHERE HIST.ID_EXPEDIENTE = EE.ID AND
    HIST.TIPO_OPERACION = 'Pase' AND
    REGEXP_REPLACE(HIST.CODIGO_REPARTICION_DESTINO,'[^A-Z0-9-#-]','')
        IN ('DPPSGG','DALABSGG','DAPSGG','DSADSGG','DALABSGG')
    AND
    HIST.REPARTICION_USUARIO
    NOT IN ('DPPSGG','DALABSGG','DAPSGG','DSADSGG','DALABSGG')
    ),'DD/MM/YYYY'),TO_CHAR(T.CREATE_,'DD/MM/YYYY')) AS FECHA_INGRESO,
    
    TO_CHAR(T.CREATE_,'DD/MM/YYYY') AS FECHA_ADQUISICION,
    TO_CHAR(T.CREATE_, 'HH24:MI:SS') AS HORA_ADQUISICION,
    ROUND(SYSDATE - T.CREATE_) AS DIAS_PERMANENCIA_USUARIO,
    
    EE.CODIGO_REPARTICION_USUARIO AS COD_REPARTICION_CARATULACION, 
    REP_CARATULA.NOMBRE_REPARTICION AS REPARTICION_CARATULACION, 
    MIN_CARATULA.CODIGO_REPARTICION AS COD_ORGANISMO_CARATULACION, 
    MIN_CARATULA.NOMBRE_REPARTICION AS ORGANISMO_CARATULACION, 
	TO_CHAR(EE.FECHA_CREACION, 'DD/MM/YYYY') AS FECHA_CARATULACION, 
	TO_CHAR(EE.FECHA_CREACION, 'HH24:MI:SS') AS HORA_CARATULACION,
    EE.ESTADO,
    TRATAS.CODIGO_TRATA,
    TRATAS.DESCRIPCION AS TRATA

FROM 
    --INFORMACION DE LOS USUARIOS
    TRACK_GED.SADE_SECTOR_USUARIO SU 
    LEFT JOIN TRACK_GED.SADE_SECTOR_INTERNO SIU ON (SU.ID_SECTOR_INTERNO = SIU.ID_SECTOR_INTERNO) 
    LEFT JOIN CO_GED.DATOS_USUARIO DU ON (DU.USUARIO = SU.NOMBRE_USUARIO)
    LEFT JOIN TRACK_GED.SADE_REPARTICION SRU ON (SIU.CODIGO_REPARTICION = SRU.ID_REPARTICION)

    --INFORMACION DE LOS EXPEDIENTES
    LEFT JOIN EE_GED.JBPM4_TASK T ON REGEXP_SUBSTR(T.ASSIGNEE_, '[^.]+') = SU.NOMBRE_USUARIO
    LEFT JOIN EE_GED.EE_EXPEDIENTE_ELECTRONICO EE ON EE.ID_WORKFLOW = T.EXECUTION_ID_
    LEFT JOIN TRACK_GED.SADE_REPARTICION REP_CARATULA ON EE.CODIGO_REPARTICION_USUARIO = REP_CARATULA.CODIGO_REPARTICION
    LEFT JOIN TRACK_GED.SADE_REPARTICION MIN_CARATULA ON REP_CARATULA.MINISTERIO = MIN_CARATULA.ID_REPARTICION
    LEFT JOIN EE_GED.TRATA TRATAS ON TRATAS.ID = EE.ID_TRATA
    
WHERE
    SRU.CODIGO_REPARTICION IN (
        'DPPSGG',
        'DALABSGG',
        'DAPSGG',
        'DSADSGG',
        'DALABSGG'
    )
    
    AND SU.ESTADO_REGISTRO = 1
    
ORDER BY
    (SYSDATE - T.CREATE_) DESC NULLS LAST