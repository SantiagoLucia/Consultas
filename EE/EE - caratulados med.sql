select 
ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||
	ee.codigo_reparticion_actuacion||'-' ||ee.codigo_reparticion_usuario as nro_expediente,
ee.fecha_creacion,
ee.usuario_modificacion,
ee.fecha_modificacion,
trata.codigo_trata,
trata.descripcion as trata,
ee.estado,
solicitante.apellido_solicitante,
solicitante.nombre_solicitante,
solicitante.cuit_cuil,
solicitante.email,
solicitud.motivo,
rep_caratula.codigo_reparticion as cod_rep_car, 
rep_caratula.nombre_reparticion as nombre_reparticion,
min_caratula.codigo_reparticion as cod_jurisdiccion, 
min_caratula.nombre_reparticion as nombre_jurisdiccion

from ee_ged.ee_expediente_electronico ee
left join ee_ged.solicitud_expediente solicitud on solicitud.id = ee.solicitud_iniciadora
left join ee_ged.solicitante solicitante on solicitante.id_solicitante = solicitud.solicitante
left join ee_ged.trata trata on trata.id = ee.id_trata
left join track_ged.sade_reparticion rep_caratula on ee.codigo_reparticion_usuario = rep_caratula.codigo_reparticion
left join track_ged.sade_reparticion min_caratula on rep_caratula.ministerio = min_caratula.id_reparticion
where ee.sistema_creador in ('ws_gdeba_prod_dpsitmjgm_md','ws_dsi_api_mesa_digital')
and min_caratula.codigo_reparticion = 'DGCYE'
order by ee.fecha_creacion desc