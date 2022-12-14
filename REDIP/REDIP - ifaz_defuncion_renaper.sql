SELECT * FROM RCE_GED.RCE_IFAZ_DEFUNCION_RENAPER IFAZ
LEFT JOIN RCE_GED.RCE_PERSONA PERS ON PERS.ID_PERSONA = IFAZ.FK_PERSONA

WHERE (id_tramite_renaper = 0 OR id_tramite_renaper IS NULL)
AND IFAZ.FECHA_INICIO_IFAZ >= TO_DATE('01/01/2020','DD/MM/YYYY')
AND IFAZ.INFORME_FALLECIMIENTO_CODIGO != 99;
