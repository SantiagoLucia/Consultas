select
ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario as nro_expediente,
to_char(ee.fecha_creacion, 'dd/mm/yyyy hh24:mi:ss') as fecha_caratulacion,
ee.codigo_reparticion_usuario as cod_reparticion_caratulacion, 
min_caratula.codigo_reparticion as cod_ministerio_caratulacion,
hist.tipo_operacion,
hist.ord_hist as orden,
hist.estado,
to_char(hist.fecha_operacion, 'dd/mm/yyyy hh24:mi:ss') as fecha_operacion,
to_char(hist.fecha_operacion, 'month') as mes_operacion,

nvl(trunc(hist.fecha_operacion - lag(hist.fecha_operacion) over (partition by hist.id_expediente order by hist.fecha_operacion)),0) || ' dias ' ||
nvl(trunc(mod((hist.fecha_operacion - lag(hist.fecha_operacion) over (partition by hist.id_expediente order by hist.fecha_operacion)) * 24, 24)),0) || ' hs ' ||
nvl(trunc(mod((hist.fecha_operacion - lag(hist.fecha_operacion) over (partition by hist.id_expediente order by hist.fecha_operacion)) * 24 * 60, 60)),0) || ' min' as tiempo_entre_operaciones,   

hist.motivo,

--origen--
hist.usuario as usuario_origen,
hist.sector_usuario_origen,
hist.reparticion_usuario as reparticion_usuario_origen,
COALESCE(
	hist.codigo_jurisdiccion_origen,
	lag(hist.CODIGO_JURISDICCION_DESTINO) OVER (PARTITION BY hist.id_expediente ORDER BY hist.FECHA_OPERACION)
) AS codigo_ministerio_origen,

--destino--
hist.usuario_seleccionado,
hist.grupo_seleccionado,
regexp_replace(hist.destinatario,'[^A-Z0-9-#-]','') as destinatario,
hist.codigo_sector_destino,
regexp_replace(hist.codigo_reparticion_destino,'[^A-Z0-9-#-]','') as codigo_reparticion_destino,
COALESCE(
	hist.codigo_jurisdiccion_destino,
	lag(hist.CODIGO_JURISDICCION_DESTINO) OVER (PARTITION BY hist.id_expediente ORDER BY hist.FECHA_OPERACION)
) AS codigo_ministerio_destino,

--trata--
t.codigo_trata,
t.descripcion as trata

from ee_ged.ee_expediente_electronico ee
inner join ee_ged.historialoperacion hist on ee.id = hist.id_expediente
inner join ee_ged.trata t on ee.id_trata = t.id
inner join track_ged.sade_reparticion rep_caratula on ee.codigo_reparticion_usuario = rep_caratula.codigo_reparticion
inner join track_ged.sade_reparticion min_caratula on rep_caratula.ministerio = min_caratula.id_reparticion

where 
ee.id = 5617571

order by hist.expediente, hist.ord_hist asc;