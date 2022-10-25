SELECT 
    --ee.tipo_documento || '-' || ee.anio || '-' || ee.numero || '- -GDEBA-' || ee.codigo_reparticion_usuario AS EXPEDIENTE,
    t.codigo_trata AS "CODIGO TRATA",
    t.descripcion AS "DESCRIPCION",
    --TO_CHAR(ee.fecha_creacion, 'YYYY/MM/DD') AS "FECHA CREACION",
    --TO_CHAR(ee.fecha_modificacion, 'YYYY/MM/DD') AS "FECHA PASE A GUARDA",
    COUNT(t.codigo_trata) AS "CANTIDAD EXPEDIENTES",
    SUM(TRUNC(ee.fecha_modificacion - ee.fecha_creacion)) AS "TOTAL DIAS",
    TRUNC(SUM(TRUNC(ee.fecha_modificacion - ee.fecha_creacion)) / COUNT(t.codigo_trata)) AS "PROMEDIO DIAS POR EXPEDIENTE" 

FROM EE_GED.ee_expediente_electronico ee
INNER JOIN EE_GED.historialoperacion ho ON ee.id = ho.id_expediente
INNER JOIN EE_GED.trata t ON ee.id_trata = t.id

WHERE 
    ee.codigo_reparticion_usuario LIKE '%TESTGDEBA'
    AND ho.estado = 'Guarda Temporal'
    AND 'FECHA CREACION' is not NULL
    AND 'FECHA PASE A GUARDA' is not NULL

GROUP BY t.codigo_trata, t.descripcion
ORDER BY t.codigo_trata ASC;