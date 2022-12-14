WITH TRATAS_SUMARIO AS (
SELECT ID, CODIGO_TRATA, ESTADO, DESCRIPCION, GRUPO
FROM EE_GED.TRATA
WHERE (CODIGO_TRATA LIKE 'SUM%' OR UPPER(DESCRIPCION) LIKE '%SUMARIO%') AND ESTADO = 'ALTA'
)
SELECT 
    TS.CODIGO_TRATA
    ,TS.ESTADO
    ,TS.DESCRIPCION
    ,TS.GRUPO
    ,TR.CODIGOREPARTICION AS CODIGO_REPARTICION
    ,NVL(RE.NOMBRE_REPARTICION,'--TODAS--')  AS NOMBRE_REPARTICION
    ,NVL(MI.CODIGO_REPARTICION,'--TODAS--') AS CODIGO_ORGANISMO
    ,NVL(MI.NOMBRE_REPARTICION,'--TODAS--') AS NOMBRE_ORGANISMO
    ,DECODE(TR.HABILITACION,0,'NO',1,'SI') AS HABILITADA
    ,DECODE(TR.RESERVA,0,'NO',1,'SI') AS PERMISO_RESERVA
    
FROM TRATAS_SUMARIO TS
INNER JOIN EE_GED.TRATA_REPARTICION TR ON TR.ID_TRATA = TS.ID
LEFT JOIN  TRACK_GED.SADE_REPARTICION RE ON REGEXP_REPLACE(TR.CODIGOREPARTICION, '[^A-Z0-9-]', '') = RE.CODIGO_REPARTICION
LEFT JOIN  TRACK_GED.SADE_REPARTICION MI ON RE.MINISTERIO = MI.ID_REPARTICION
ORDER BY TS.CODIGO_TRATA ASC
;