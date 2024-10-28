SELECT 
    REPARTICION_USUARIO,
    SUM(TIEMPO_PERMANENCIA) / SUM(SUM(TIEMPO_PERMANENCIA)) OVER () * 100 AS PORCENTAJE_PERMANENCIA
FROM (	
    SELECT
        REPARTICION_USUARIO,
        NVL(FECHA_OPERACION - LAG(FECHA_OPERACION) OVER (PARTITION BY ID_EXPEDIENTE ORDER BY FECHA_OPERACION), 0) AS TIEMPO_PERMANENCIA
    FROM EE_GED.HISTORIALOPERACION H
    WHERE ID_EXPEDIENTE = 5617562
)
GROUP BY REPARTICION_USUARIO
ORDER BY SUM(TIEMPO_PERMANENCIA) / SUM(SUM(TIEMPO_PERMANENCIA)) OVER () * 100 DESC
;