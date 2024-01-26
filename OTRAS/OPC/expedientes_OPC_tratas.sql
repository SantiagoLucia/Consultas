with tabla_expedientes as (
select 
ee.id as id_expediente,
t.codigo_trata,
t.descripcion as descripcion_trata
from ee_ged.ee_expediente_electronico ee
inner join ee_ged.trata t on ee.id_trata = t.id
where t.codigo_trata in ('COMP0012','COMP0018')
)
select
h.id_expediente,
CASE WHEN h.expediente IS NOT NULL THEN
   'EX'||'-'||REGEXP_SUBSTR(h.expediente,'[0-9]{4}',3)||'-'||
   REGEXP_SUBSTR(h.expediente,'[0-9]{1,8}',7) ||'- -'||
   'GDEBA' || REGEXP_SUBSTR(h.expediente,'-.+') END AS nro_expediente,
te.codigo_trata,
te.descripcion_trata,
h.tipo_operacion,
h.fecha_operacion,
h.motivo,
sr.nombre_reparticion as jurisdiccion_destino,
h.descripcion_reparticion_destin as reparticion_destino,
h.descripcion_sector_destino as sector_destino

from tabla_expedientes te
inner join ee_ged.historialoperacion h on te.id_expediente = h.id_expediente
inner join track_ged.sade_reparticion sr on h.codigo_jurisdiccion_destino
   = sr.codigo_reparticion
where h.fecha_operacion > trunc(sysdate)-7
order by h.id_expediente, h.fecha_operacion desc;