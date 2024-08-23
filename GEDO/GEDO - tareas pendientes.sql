SELECT 
	*
FROM (
	SELECT 
		jt.DBID_ AS ID_TAREA ,
		jt.NAME_ AS NOMBRE_TAREA ,
		jt.STATE_ AS ESTADO_TAREA ,
		jt.CREATE_ AS FECHA_CREACION ,
		jt.ASSIGNEE_ AS USUARIO_ASIGNADO ,
		jv.KEY_ AS CLAVE ,
		jv.STRING_VALUE_ AS VALOR
	FROM 
		GEDO_GED.JBPM4_TASK jt 
	INNER JOIN 
		GEDO_GED.JBPM4_VARIABLE jv ON jv.EXECUTION_ = jt.EXECUTION_ 
	WHERE 
		REGEXP_SUBSTR(jt.ASSIGNEE_, '[^.]+') = 'SPRIVITERA'
) 
PIVOT (
	MAX(VALOR) FOR CLAVE IN (
		'acronimoTipoDocumento' AS ACRONIMO_DOCUMENTO ,
		'motivo' AS MOTIVO
	)  
)