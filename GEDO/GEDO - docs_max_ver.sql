SELECT
  ti.acronimo,
  ti.estado,
  ti.nombre,
  ti.version
  
FROM gedo_ged.gedo_tipodocumento ti
WHERE
  ti.estado = 'ALTA'           AND
  ti.acronimo NOT LIKE 'TEST%' AND
  TO_NUMBER(ti.version,'99.9') = (SELECT MAX(TO_NUMBER(version,'99.9'))
                                    FROM gedo_ged.gedo_tipodocumento
                                   WHERE acronimo = ti.acronimo) 
order by ti.acronimo;