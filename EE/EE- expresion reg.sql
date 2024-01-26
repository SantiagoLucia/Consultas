SELECT
   CASE WHEN expediente IS NOT NULL THEN
   'EX'||'-'||REGEXP_SUBSTR(expediente,'[0-9]{4}',3)||'-'||
   REGEXP_SUBSTR(expediente,'[0-9]{1,8}',7) ||'- -'||
   'GDEBA' || REGEXP_SUBSTR(expediente,'-.+') END AS nro_expediente

FROM ee_ged.historialoperacion;