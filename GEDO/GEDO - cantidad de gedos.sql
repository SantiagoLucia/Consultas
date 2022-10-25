SELECT 
TO_CHAR(GD.FECHACREACION,'YYYY/MM') AS FECHA,
SUM(CASE WHEN
    GT.ACRONIMO NOT IN ('NOTA','MEMO')
    AND SR.CODIGO_REPARTICION NOT LIKE 'DL%MGGP'
    AND SR.CODIGO_REPARTICION NOT LIKE 'SDDR%MGGP'
    AND SR.CODIGO_REPARTICION NOT LIKE 'SDSR%MGGP'
    AND SR.CODIGO_REPARTICION NOT LIKE 'SDZ%MGGP'
    AND SR.CODIGO_REPARTICION NOT LIKE '%RDLP'
    THEN 1 ELSE 0 END) AS "TOTAL GEDOS (SIN REDIP)",

SUM(CASE WHEN
    GT.ACRONIMO NOT IN ('NOTA','MEMO')
    AND (SR.CODIGO_REPARTICION LIKE 'DL%MGGP'
    OR SR.CODIGO_REPARTICION LIKE 'SDDR%MGGP'
    OR SR.CODIGO_REPARTICION LIKE 'SDSR%MGGP'
    OR SR.CODIGO_REPARTICION LIKE 'SDZ%MGGP'
    OR SR.CODIGO_REPARTICION LIKE '%RDLP')
    THEN 1 ELSE 0 END) AS "TOTAL GEDOS (SOLO REDIP)",
    
SUM(CASE WHEN
    GT.ACRONIMO IN ('NOTA','MEMO')
    THEN 1 ELSE 0 END) AS "TOTAL CCOO",
    
COUNT(*) AS TOTAL    

FROM 
GEDO_GED.GEDO_DOCUMENTO GD 
INNER JOIN GEDO_GED.GEDO_TIPODOCUMENTO GT ON GD.TIPO = GT.ID
INNER JOIN TRACK_GED.SADE_REPARTICION SR ON GD.REPARTICION = SR.CODIGO_REPARTICION  
INNER JOIN TRACK_GED.SADE_REPARTICION SR1 ON SR.MINISTERIO = SR1.ID_REPARTICION

WHERE
GD.FECHACREACION BETWEEN TO_DATE('2019/01','YYYY/MM') AND TO_DATE('2020/12','YYYY/MM')
AND SR.CODIGO_REPARTICION != 'TESTGDEBA'
GROUP BY TO_CHAR(GD.FECHACREACION,'YYYY/MM')
ORDER BY TO_CHAR(GD.FECHACREACION,'YYYY/MM');
