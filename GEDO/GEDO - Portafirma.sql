SELECT
	SUM(
		CASE 
			WHEN gd.SISTEMAINICIADOR IN ('RCE','ws_gdeba_prod_dimggp_pol','ws_gdeba_prod_dimggp_certdi') 
			THEN 1 
			ELSE 0
		END 
		) AS "RCE+CERTDI+POL",
	SUM(
		CASE 
			WHEN gd.SISTEMAINICIADOR NOT IN ('RCE','ws_gdeba_prod_dimggp_pol','ws_gdeba_prod_dimggp_certdi') 
			THEN 1 
			ELSE 0
		END 
		) AS "OTROS"		
FROM 
	GEDO_GED.PF_TAREAS_FINALIZADAS ptf
INNER JOIN 
	GEDO_GED.GEDO_DOCUMENTO gd ON gd.WORKFLOWORIGEN = ptf.WORKFLOWORIGEN 
WHERE
	ptf.FECHA_FIN > TRUNC(SYSDATE) AND 
	ptf.ESTADO = 'FIRMADA'
;