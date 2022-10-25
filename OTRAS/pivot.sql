SELECT * FROM
(
    SELECT TRUNC(CREATE_) AS FECHA, NAME_ FROM GEDO_GED.JBPM4_TASK
)
    PIVOT
(
    COUNT(NAME_)
    FOR NAME_ IN (
        'Confeccionar Documento'
        ,'Revisar Documento'
        ,'Revisar Documento con Firma Conjunta'
        ,'Rechazado'
        ,'Revisar Documento de Firma Unica'
        ,'Firmar Documento'
    )    
)
ORDER BY FECHA DESC;

SELECT * FROM 
(
SELECT USUARIO, ACTIVIDAD 
FROM GEDO_GED.GEDO_HISTORIAL 
WHERE FECHA_FIN BETWEEN TO_DATE('04/05/2022','DD/MM/YYYY') AND TO_DATE('05/05/2022','DD/MM/YYYY')
)
PIVOT
(
COUNT(ACTIVIDAD)
FOR ACTIVIDAD IN (
    'Confeccionar Documento' AS CONFECCIONAR, 
    'Firmar Documento' AS FIRMAR, 
    'Firmar Documento (Portafirma)' AS FIRMAR_PORTAFIRMA
    )
)
ORDER BY FIRMAR, FIRMAR_PORTAFIRMA DESC
;