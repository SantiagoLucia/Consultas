﻿WITH CANTIDADES_POR_SISTEMA AS (
SELECT
GD.SISTEMAINICIADOR,TO_CHAR(GD.FECHACREACION,'MM-YYYY') FECHA,COUNT(*) CANTIDAD
FROM GEDO_GED.GEDO_DOCUMENTO GD
INNER JOIN GEDO_GED.PF_TAREAS_FINALIZADAS PF ON GD.WORKFLOWORIGEN=PF.WORKFLOWORIGEN
WHERE GD.FECHACREACION BETWEEN 
TO_DATE('01/01/2021 00:00:00','DD/MM/RR HH24:MI:SS') AND 
TO_DATE('01/01/2022 00:00:00','DD/MM/RR HH24:MI:SS')
GROUP BY GD.SISTEMAINICIADOR,TO_CHAR(GD.FECHACREACION,'MM-YYYY')
)
SELECT
FECHA,
SUM(CASE WHEN SISTEMAINICIADOR NOT IN ('RCE','ws_gdeba_prod_dimggp_pol','ws_gdeba_prod_dimggp_certdi') 
    THEN CANTIDAD ELSE 0 END) "GEDO+CCOO+EE+OTROS WS",
SUM(CASE WHEN SISTEMAINICIADOR IN ('RCE','ws_gdeba_prod_dimggp_pol','ws_gdeba_prod_dimggp_certdi') 
    THEN CANTIDAD ELSE 0 END) "RCE+CERTDI+POL",
SUM(CANTIDAD) AS TOTAL
FROM CANTIDADES_POR_SISTEMA
GROUP BY FECHA
ORDER BY FECHA ASC
;