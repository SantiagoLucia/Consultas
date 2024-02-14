select
ee.tipo_documento || '-' || ee.anio || '-' || ee.numero || '-' || ee.codigo_reparticion_actuacion || '-' || ee.codigo_reparticion_usuario as nro_expediente,
to_char(ee.fecha_creacion, 'dd/mm/yyyy') as fecha_caratulacion,
to_char(ee.fecha_creacion, 'hh24:mi:ss') as hora_caratulacion,
ee.codigo_reparticion_usuario as cod_reparticion_caratulacion, 
rep_caratula.nombre_reparticion as reparticion_caratulacion, 
min_caratula.codigo_reparticion as cod_ministerio_caratulacion, 
min_caratula.nombre_reparticion as ministerio_caratulacion, 
hist.tipo_operacion,
hist.ord_hist as orden,
hist.estado,
to_char(hist.fecha_operacion, 'dd/mm/yyyy') as fecha_operacion,
to_char(hist.fecha_operacion, 'hh24:mi:ss') as hora_operacion,
to_char(hist.fecha_operacion, 'month') as mes_operacion,

coalesce(
(select regexp_replace((
trunc((h2.fecha_operacion - hist.fecha_operacion)) || ' dias ' ||
trunc(mod((h2.fecha_operacion - hist.fecha_operacion) * 24, 24)) || ' hs ' ||
trunc(mod((h2.fecha_operacion - hist.fecha_operacion) * 24 * 60, 60)) || ' min'
), '[^A-Z0-9- ]', '')
from ee_ged.historialoperacion h2
where h2.id_expediente = hist.id_expediente and h2.ord_hist = hist.ord_hist -1) 
,
'0 dias 0 hs 0 min'
) tiempo_entre_operaciones,

hist.motivo,

--origen--
hist.usuario as usuario_origen,
hist.sector_usuario_origen,
hist.descripcion_sector_origen,
hist.reparticion_usuario as reparticion_usuario_origen,
hist.descripcion_reparticion_origen,
hist.codigo_jurisdiccion_origen as codigo_ministerio_origen,
min_origen.nombre_reparticion as desc_ministerio_origen,

--destino--
hist.usuario_seleccionado,
hist.grupo_seleccionado,
regexp_replace(hist.destinatario,'[^A-Z0-9-#-]','') as destinatario,
hist.codigo_sector_destino,
hist.descripcion_sector_destino,
regexp_replace(hist.codigo_reparticion_destino,'[^A-Z0-9-#-]','') as codigo_reparticion_destino,
hist.descripcion_reparticion_destin as desc_reparticion_destino,
hist.codigo_jurisdiccion_destino as codigo_ministerio_destino,
min_destino.nombre_reparticion as desc_ministerio_destino,

--trata--
t.codigo_trata as codigo_trata,
t.descripcion as trata

from ee_ged.ee_expediente_electronico ee
left join ee_ged.historialoperacion hist on ee.id = hist.id_expediente
left join ee_ged.trata t on ee.id_trata = t.id
left join track_ged.sade_reparticion min_origen on min_origen.codigo_reparticion = hist.codigo_jurisdiccion_origen
left join track_ged.sade_reparticion min_destino on min_destino.codigo_reparticion = hist.codigo_jurisdiccion_destino
left join track_ged.sade_reparticion rep_caratula on ee.codigo_reparticion_usuario = rep_caratula.codigo_reparticion
left join track_ged.sade_reparticion min_caratula on rep_caratula.ministerio = min_caratula.id_reparticion

where 
extract(year from hist.fecha_operacion) = 2020 and
hist.tipo_operacion = 'Pase' and
hist.codigo_jurisdiccion_origen != 'FDE' and
hist.codigo_jurisdiccion_destino = 'FDE'

order by hist.expediente, hist.ord_hist asc;