SELECT
FECHA_CREACION AS FECHA_RECEPCION,
ID_NOTIFICACION_RECIBIDA AS ID_INTERNO,
DOMICILIO_ELECTRONICO,
ID_CAUSA AS ID_CAUSA_SCBA,
ID_AVISO,
MOTIVO

FROM EE_GED.EE_NOTIFICACION_RECIBIDA 
WHERE TRUNC(FECHA_CREACION) >= TO_DATE('01/09/2021','DD/MM/YYYY')
ORDER BY FECHA_CREACION DESC;