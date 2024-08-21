SELECT 
	jp.REPARTICION,
	jp.SECTOR,
	'EX'||'-'||ee.ANIO||'-'||ee.NUMERO||'- -'||
	        'GDEBA'||'-'||ee.CODIGO_REPARTICION_USUARIO as NRO_EXPEDIENTE,
	TO_CHAR(ee.FECHA_CREACION, 'dd/mm/yyyy') as FECHA_CARATULACION,
	ee.DESCRIPCION        	

FROM 
	(SELECT
		regexp_substr(groupid_, '[^-]+') as REPARTICION,
		regexp_substr(groupid_, '[^-]+', 1, 2) as SECTOR,
		TASK_
	FROM
		EE_GED.JBPM4_PARTICIPATION
	WHERE
		regexp_substr(groupid_, '[^-]+') IN (
    		'DESIV','DPTEIV','DPTCAYOIV','DPTRYCIV',
    		'DACIV','DSOIV','DPTSAIV','DPTOCIV')	
	) jp

LEFT JOIN
	EE_GED.JBPM4_TASK jt ON jt.DBID_ = jp.TASK_
	
LEFT JOIN 
	EE_GED.EE_EXPEDIENTE_ELECTRONICO ee ON ee.ID_WORKFLOW = jt.EXECUTION_ID_ 

ORDER BY
	jp.REPARTICION,
	jp.SECTOR	
;