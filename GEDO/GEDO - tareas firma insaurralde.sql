SELECT
T.NAME_ AS NOMBRE_TAREA,
T.CREATE_ AS FECHA_TAREA,
T.ASSIGNEE_ AS USUARIO_ASIGNADO,
SR.CODIGO_REPARTICION AS CODIGO_REPARTICION,
SR1.NOMBRE_REPARTICION,
SR1.CODIGO_REPARTICION AS CODIGO_ORGANISMO,
DECODE(F.ESTADOFIRMA, 0, 'NO', 1, 'SI') FIRMA_INSAURRALDE,
V.STRING_VALUE_ AS ACRONIMO_DOCUMENTO,
( SELECT STRING_VALUE_ FROM GEDO_GED.JBPM4_VARIABLE WHERE EXECUTION_ = V.EXECUTION_ AND KEY_ = 'motivo' ) as MOTIVO,
H.FECHA_INICIO

FROM 
GEDO_GED.GEDO_FIRMANTES F
INNER JOIN GEDO_GED.JBPM4_TASK T ON F.WORKFLOWID = T.EXECUTION_ID_
INNER JOIN GEDO_GED.JBPM4_VARIABLE V ON 
    T.EXECUTION_ = V.EXECUTION_ AND
    V.STRING_VALUE_ IN ('DECRE','RESOL','RESOC','RESO','RESFC')

INNER JOIN GEDO_GED.GEDO_HISTORIAL H ON H.WORKFLOWORIGEN = T.EXECUTION_ID_
    AND H.ID = ( SELECT MIN(ID) FROM GEDO_GED.GEDO_HISTORIAL
    WHERE WORKFLOWORIGEN = T.EXECUTION_ID_ )
    
LEFT JOIN TRACK_GED.SADE_SECTOR_USUARIO SU ON REGEXP_SUBSTR(T.ASSIGNEE_, '[^.]+', 1, 1) = SU.NOMBRE_USUARIO
    AND SU.ID_SECTOR_USUARIO = (
    SELECT MAX(Z.ID_SECTOR_USUARIO) FROM TRACK_GED.SADE_SECTOR_USUARIO Z 
    WHERE Z.NOMBRE_USUARIO = REGEXP_SUBSTR(T.ASSIGNEE_, '[^.]+', 1, 1)
        )
LEFT JOIN CO_GED.DATOS_USUARIO DU ON DU.USUARIO = SU.NOMBRE_USUARIO
LEFT JOIN TRACK_GED.SADE_SECTOR_INTERNO SSI ON SU.ID_SECTOR_INTERNO = SSI.ID_SECTOR_INTERNO
LEFT JOIN TRACK_GED.SADE_REPARTICION SR ON SSI.CODIGO_REPARTICION = SR.ID_REPARTICION
LEFT JOIN TRACK_GED.SADE_REPARTICION SR1 ON SR1.ID_REPARTICION = SR.MINISTERIO

WHERE F.USUARIOFIRMANTE = 'MARINSAURRALDE'
;