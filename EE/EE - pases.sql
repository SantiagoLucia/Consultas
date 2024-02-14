select
case when h.expediente is not null then
   'ex'||'-'||regexp_substr(h.expediente,'[0-9]{4}',3)||'-'||
   regexp_substr(h.expediente,'[0-9]{1,8}',7) ||'- -'||
   'GDEBA' || regexp_substr(h.expediente,'-.+') end as nro_expediente,
h.tipo_operacion,
h.fecha_operacion,
h.motivo,
h.usuario as usuario_origen,
h.reparticion_usuario as cod_reparticion_origen,
h.descripcion_reparticion_origen as nombre_reparticion_origen,
h.codigo_jurisdiccion_origen as cod_ministerio_origen,
h.destinatario as usuario_repa_destino,
h.codigo_reparticion_destino as cod_reparticion_destino,
h.descripcion_reparticion_destin as nombre_reparticion_destino,
h.codigo_jurisdiccion_destino as cod_ministerio_destino

from
ee_ged.historialoperacion h

where 
h.fecha_operacion >= trunc(sysdate, 'MONTH')
and h.tipo_operacion = 'Pase'
and h.codigo_jurisdiccion_destino = 'CGP'

order by h.fecha_operacion asc
;