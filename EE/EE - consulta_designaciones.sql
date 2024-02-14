select
t.descripcion as trata,
ee.tipo_documento||'-'|| ee.anio||'-'||ee.numero||'- -'||ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario as nro_expediente,
to_char(ee.fecha_creacion, 'dd/mm/yyyy') as fecha_caratulacion,
hist.motivo,
hist.ord_hist as orden,
to_char(hist.fecha_operacion, 'dd/mm/yyyy') as fecha_operacion,
hist.usuario as usuario_origen,
hist.descripcion_reparticion_origen,
regexp_replace(hist.destinatario,'[^a-z0-9-#-]','') as destinatario,
hist.descripcion_reparticion_destin as desc_reparticion_destino,
hist.descripcion_sector_destino as desc_sector_destino,
min_destino.nombre_reparticion as desc_ministerio_destino,
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
	) tiempo_entre_operaciones


from ee_ged.ee_expediente_electronico ee
left join ee_ged.historialoperacion hist on ee.id = hist.id_expediente
left join ee_ged.trata t on ee.id_trata = t.id
left join track_ged.sade_reparticion min_origen on min_origen.codigo_reparticion = hist.codigo_jurisdiccion_origen
left join track_ged.sade_reparticion min_destino on min_destino.codigo_reparticion = hist.codigo_jurisdiccion_destino
left join track_ged.sade_reparticion rep_caratula on ee.codigo_reparticion_usuario = rep_caratula.codigo_reparticion
left join track_ged.sade_reparticion min_caratula on rep_caratula.ministerio = min_caratula.id_reparticion

where 
hist.fecha_operacion > trunc(sysdate,'YEAR') and
hist.tipo_operacion = 'Pase' and
t.codigo_trata in ('PER0022','PER0085') and
ee.estado = 'Guarda Temporal' and
ee.codigo_reparticion_usuario in ('DMGESYAMJGM','DSTAMJGM')

order by hist.expediente, hist.ord_hist asc;