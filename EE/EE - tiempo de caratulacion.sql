SELECT 
    t.codigo_trata,
    COUNT(t.codigo_trata) AS CANTIDAD_EXPEDIENTES,
    ROUND(SUM(ee.fecha_modificacion - ee.fecha_creacion)) AS CANTIDAD_DIAS,
    ROUND(AVG(ee.fecha_modificacion - ee.fecha_creacion)) AS PROMEDIO_DIAS

FROM 
	EE_GED.ee_expediente_electronico ee

INNER JOIN 
	EE_GED.trata t ON ee.id_trata = t.id

WHERE 
	ee.FECHA_CREACION > TRUNC(SYSDATE-365) 
    AND ee.codigo_reparticion_usuario = 'TESTGDEBA'
    AND ee.estado = 'Guarda Temporal'

GROUP BY 
	t.codigo_trata
;