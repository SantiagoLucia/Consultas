select
ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||
   ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario as nro_expediente,
t.assignee_,
ee.id as id_expediente,
h.id,

case 
   when h.codigo_sector_destino is null 
      then h.sector_usuario_origen
      else h.codigo_sector_destino
end as codigo_sector_destino,

case
   when h.codigo_reparticion_destino is null
      then h.reparticion_usuario
      else h.codigo_reparticion_destino
end as codigo_reparticion_destino,

h.ord_hist,
h.fecha_operacion,
h.reparticion_usuario,
h.sector_usuario_origen
 
from ee_ged.jbpm4_task t

inner join ee_ged.ee_expediente_electronico ee 
on t.execution_id_ = ee.id_workflow

inner join ee_ged.historialoperacion h
on ee.id = h.id_expediente 
and h.ord_hist = (select max(ord_hist) from ee_ged.historialoperacion
             where id_expediente = ee.id)

where t.assignee_ is not null
;
