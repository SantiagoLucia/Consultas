SELECT 
  	COALESCE(sr1.codigo_reparticion, gtr.codigoreparticion) AS codigo_reparticion,
   	sr1.nombre_reparticion,
   	NVL(sr2.codigo_reparticion, '--TODAS--') AS codigo_ministerio,
   	sr2.nombre_reparticion AS nombre_ministerio,
   	gt.acronimo,
   	gt.nombre,
   	DECODE(gtr.permisoiniciar, 1, 'SI', 0, 'NO') AS permiso_iniciar,
   	DECODE(gtr.permisofirmar, 1, 'SI', 0, 'NO') AS permiso_firmar,
   	gt.version AS ultima_version,
   	DECODE(gt.tipoproduccion, 1, 'LIBRE', 2, 'IMPORTADO', 3, 'TEMPLATE', 4, 'IMPORTADO-TEMPLATE') AS tipo_produccion,
   	DECODE(gt.esespecial, 0, 'NO', 'SI') AS es_especial,
   	DECODE(gt.tienetoken, 0, 'NO', 'SI') AS tiene_token

FROM 
   	gedo_ged.gedo_tipodocumento_reparticion gtr
   	LEFT JOIN track_ged.sade_reparticion sr1 ON gtr.codigoreparticion = sr1.codigo_reparticion
   	LEFT JOIN track_ged.sade_reparticion sr2 ON sr1.ministerio = sr2.id_reparticion
   	LEFT JOIN (
   		SELECT 
			gt.*,
			ROW_NUMBER() OVER(PARTITION BY gt.ACRONIMO ORDER BY gt.FECHA_CREACION desc) AS rn
		FROM GEDO_GED.GEDO_TIPODOCUMENTO gt
		) gt ON gtr.tipodocumento = gt.id AND gt.rn = 1

WHERE
	gtr.estado = 1 
	AND gt.estado  = 'ALTA'
   	
ORDER BY 
   sr1.codigo_reparticion ASC, 
   sr2.codigo_reparticion ASC, 
   gt.acronimo;
