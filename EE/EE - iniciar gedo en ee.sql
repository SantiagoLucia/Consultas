SELECT 

A.ID AS ID_ACTIVIDAD,
A.FECHA_ALTA, 
A.USUARIO_ACTUAL,
AP.VALOR,
GD.NUMERO,
A.ID_OBJETIVO,
EE.TIPO_DOCUMENTO||'-'||EE.ANIO||'-'||EE.NUMERO||'- -'||EE.CODIGO_REPARTICION_ACTUACION||'-'||EE.CODIGO_REPARTICION_USUARIO AS NRO_EXPEDIENTE,
T.ASSIGNEE_

FROM EE_GED.ACTIVIDAD A
INNER JOIN EE_GED.ACTIVIDAD_PARAM AP ON A.ID = AP.ID_ACTIVIDAD
INNER JOIN EE_GED.TIPO_ACTIVIDAD TP ON A.ID_TIPO_ACTIVIDAD = TP.ID
INNER JOIN EE_GED.JBPM4_TASK T ON A.ID_OBJETIVO = T.EXECUTION_ID_
INNER JOIN EE_GED.EE_EXPEDIENTE_ELECTRONICO EE ON EE.ID_WORKFLOW = T.EXECUTION_ID_
LEFT JOIN GEDO_GED.GEDO_DOCUMENTO GD ON GD.WORKFLOWORIGEN = AP.VALOR

WHERE 
A.ESTADO = 'ABIERTA' AND TP.NOMBRE = 'PETICION_PENDIENTE_GEDO' AND AP.CAMPO = 'PEDIDO_GEDO'
ORDER BY A.FECHA_ALTA DESC;