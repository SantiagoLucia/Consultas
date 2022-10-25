SELECT
    cir.id_circunscripcion,
    cir.nombre,
    DUMP(cir.nombre) DUMP
FROM 
    rce_ged.sys_circunscripcion cir
WHERE 
    DUMP(cir.nombre) LIKE '%,32' --Espacio en blanco 
    --OR DUMP(cir.nombre) LIKE '%,9' -- Tab
    --DUMP LIKE '%32,32%'
;