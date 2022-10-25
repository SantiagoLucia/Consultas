WITH ID_EXPEDIENTES_SALIENTES AS (
SELECT
HIST.ID_EXPEDIENTE ID,
COALESCE(R1DR.CODIGO_REPARTICION,R1DU.CODIGO_REPARTICION) COD_MINISTERIO_DESTINO,
COALESCE(R1DR.NOMBRE_REPARTICION,R1DU.NOMBRE_REPARTICION) NOMBRE_MINISTERIO_DESTINO

FROM EE_GED.HISTORIALOPERACION HIST
--origen--
LEFT JOIN TRACK_GED.SADE_SECTOR_USUARIO SO ON SO.NOMBRE_USUARIO = HIST.USUARIO
LEFT JOIN TRACK_GED.SADE_SECTOR_INTERNO SIO ON SIO.ID_SECTOR_INTERNO = SO.ID_SECTOR_INTERNO
LEFT JOIN TRACK_GED.SADE_REPARTICION RO ON RO.ID_REPARTICION = SIO.CODIGO_REPARTICION
LEFT JOIN  TRACK_GED.SADE_REPARTICION R1O ON R1O.ID_REPARTICION = RO.MINISTERIO
--destino es usuario--
LEFT JOIN TRACK_GED.SADE_SECTOR_USUARIO SDU ON SDU.NOMBRE_USUARIO = HIST.DESTINATARIO
LEFT JOIN TRACK_GED.SADE_SECTOR_INTERNO SIDU ON SIDU.ID_SECTOR_INTERNO = SDU.ID_SECTOR_INTERNO
LEFT JOIN TRACK_GED.SADE_REPARTICION RDU ON RDU.ID_REPARTICION = SIDU.CODIGO_REPARTICION
LEFT JOIN  TRACK_GED.SADE_REPARTICION R1DU ON R1DU.ID_REPARTICION = RDU.MINISTERIO
--destino es reparticion--
LEFT JOIN TRACK_GED.SADE_REPARTICION RDR ON RDR.CODIGO_REPARTICION = (REGEXP_SUBSTR(HIST.DESTINATARIO, '[A-z]*'))
LEFT JOIN  TRACK_GED.SADE_REPARTICION R1DR ON R1DR.ID_REPARTICION = RDR.MINISTERIO
WHERE
HIST.TIPO_OPERACION = 'Pase' AND
RO.CODIGO_REPARTICION = 'DPPMJGM' AND
COALESCE(RDR.CODIGO_REPARTICION,RDU.CODIGO_REPARTICION) != 'DPPMJGM' AND

TO_DATE(HIST.FECHA_OPERACION,'DD/MM/YYYY') >=
    (CASE WHEN TO_CHAR(SYSDATE, 'D') = 1 THEN TO_DATE(SYSDATE-3, 'DD/MM/YYYY') ELSE TO_DATE(SYSDATE-1, 'DD/MM/YYYY') END)
    AND  TO_DATE(HIST.FECHA_OPERACION,'DD/MM/YYYY') <= TO_DATE(SYSDATE-1, 'DD/MM/YYYY')
),

ID_EXP_SALIENTES_SIN_REP AS (
    SELECT DISTINCT * FROM ID_EXPEDIENTES_SALIENTES
),

CANTIDAD_EGRESOS AS (
SELECT
SAL.ID,
SAL.COD_MINISTERIO_DESTINO,
SAL.NOMBRE_MINISTERIO_DESTINO,
COUNT(*) CANT_EGRESOS

FROM ID_EXP_SALIENTES_SIN_REP SAL
INNER JOIN EE_GED.HISTORIALOPERACION HIST ON HIST.ID_EXPEDIENTE = SAL.ID
--origen--
LEFT JOIN TRACK_GED.SADE_SECTOR_USUARIO SO ON SO.NOMBRE_USUARIO = HIST.USUARIO
LEFT JOIN TRACK_GED.SADE_SECTOR_INTERNO SIO ON SIO.ID_SECTOR_INTERNO = SO.ID_SECTOR_INTERNO
LEFT JOIN TRACK_GED.SADE_REPARTICION RO ON RO.ID_REPARTICION = SIO.CODIGO_REPARTICION
LEFT JOIN  TRACK_GED.SADE_REPARTICION R1O ON R1O.ID_REPARTICION = RO.MINISTERIO
--destino es usuario--
LEFT JOIN TRACK_GED.SADE_SECTOR_USUARIO SDU ON SDU.NOMBRE_USUARIO = HIST.DESTINATARIO
LEFT JOIN TRACK_GED.SADE_SECTOR_INTERNO SIDU ON SIDU.ID_SECTOR_INTERNO = SDU.ID_SECTOR_INTERNO
LEFT JOIN TRACK_GED.SADE_REPARTICION RDU ON RDU.ID_REPARTICION = SIDU.CODIGO_REPARTICION
LEFT JOIN  TRACK_GED.SADE_REPARTICION R1DU ON R1DU.ID_REPARTICION = RDU.MINISTERIO
--destino es reparticion--
LEFT JOIN TRACK_GED.SADE_REPARTICION RDR ON RDR.CODIGO_REPARTICION = (REGEXP_SUBSTR(HIST.DESTINATARIO, '[A-z]*'))
LEFT JOIN  TRACK_GED.SADE_REPARTICION R1DR ON R1DR.ID_REPARTICION = RDR.MINISTERIO
WHERE
HIST.TIPO_OPERACION = 'Pase' AND
RO.CODIGO_REPARTICION = 'DPPMJGM' AND
COALESCE(RDR.CODIGO_REPARTICION,RDU.CODIGO_REPARTICION) != 'DPPMJGM' AND
TO_DATE(HIST.FECHA_OPERACION,'DD/MM/YYYY') <= TO_DATE(SYSDATE-1,'DD/MM/YYYY')
GROUP BY SAL.ID, SAL.COD_MINISTERIO_DESTINO,SAL.NOMBRE_MINISTERIO_DESTINO
)

SELECT
TO_CHAR(SYSDATE-1,'DD/MM/YYYY') PERIODO,
COD_MINISTERIO_DESTINO,
NOMBRE_MINISTERIO_DESTINO,
NVL(SUM(CASE WHEN CANT_EGRESOS = 1 THEN 1 END),0) NUEVOS,
NVL(SUM(CASE WHEN CANT_EGRESOS > 1 THEN 1 END),0) AS CON_OBSERVACIONES
FROM CANTIDAD_EGRESOS
GROUP BY TO_CHAR(SYSDATE-1,'DD/MM/YYYY'), 
COD_MINISTERIO_DESTINO, NOMBRE_MINISTERIO_DESTINO
ORDER BY COD_MINISTERIO_DESTINO