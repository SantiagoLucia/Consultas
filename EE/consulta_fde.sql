select 
e.tipo_documento||'-'||e.anio||'-'||e.numero||'- -'||
   e.codigo_reparticion_actuacion||'-'||e.codigo_reparticion_usuario as nro_expediente,
to_char(e.fecha_creacion, 'DD/MM/YYYY') as fecha_caratulacion, 
to_char(e.fecha_creacion, 'HH24:MI:SS') as hora_caratulacion,
e.codigo_reparticion_usuario as cod_reparticion_caratulacion,
rep_caratula.nombre_reparticion as reparticion_caratulacion,
h.tipo_operacion,
min_caratula.codigo_reparticion as cod_organismo_caratulacion, 
min_caratula.nombre_reparticion as organismo_caratulacion,
e.estado,
to_char(h.fecha_operacion, 'DD/MM/YYYY') as fecha_operacion, 
to_char(h.fecha_operacion, 'HH24:MI:SS') as hora_operacion,
to_char(h.fecha_operacion, 'MONTH') as mes_operacion,
h.motivo,
h.usuario as usuario_origen,
h.reparticion_usuario as cod_reparticion_origen,
h.descripcion_reparticion_origen as nombre_reparticion_origen,
h.codigo_jurisdiccion_origen as cod_ministerio_origen,
min_origen.nombre_reparticion as nombre_ministerio_origen,
h.usuario_seleccionado,
h.codigo_reparticion_destino as cod_reparticion_destino,
h.descripcion_reparticion_destin as nombre_reparticion_destino,
h.codigo_jurisdiccion_destino as cod_ministerio_destino,
'Fiscalía de Estado' as nombre_ministerio_destino,
t.codigo_trata,
t.descripcion as trata,
gd.reparticion as reparticion_firmante_gedo,
sr1.nombre_reparticion as codigo_organismo_vinculante,
gd.usuarioiniciador,
d.numero_sade as numero_gedo,
to_char(gd.fechacreacion, 'DD/MM/YYYY') as fechacreacion,
to_char(d.fecha_asociacion, 'DD/MM/YYYY') as fecha_asociacion,
gd.usuariogenerador as usuario_firmante,
d.tipo_doc_acronimo as tipo_gedo


from ee_ged.historialoperacion h
inner join ee_ged.ee_expediente_electronico e on e.id = h.id_expediente
inner join ee_ged.trata t on t.id = e.id_trata
inner join track_ged.sade_reparticion rep_caratula on 
   e.codigo_reparticion_usuario = rep_caratula.codigo_reparticion
inner join track_ged.sade_reparticion min_caratula on 
   rep_caratula.ministerio = min_caratula.id_reparticion
inner join track_ged.sade_reparticion min_origen on 
   h.codigo_jurisdiccion_origen = min_origen.codigo_reparticion
   and min_origen.estado_registro = 1
inner join ee_ged.ee_expediente_documentos ed on h.id_expediente = ed.id
inner join ee_ged.documento d on ed.id_documento = d.id
inner join gedo_ged.gedo_documento gd on d.numero_sade = gd.numero
inner join track_ged.sade_sector_usuario su on su.nombre_usuario = d.usuario_asociador
inner join track_ged.sade_sector_interno ssi on su.id_sector_interno = ssi.id_sector_interno
inner join track_ged.sade_reparticion sr on ssi.codigo_reparticion = sr.id_reparticion
inner join track_ged.sade_reparticion sr1 on sr.ministerio = sr1.id_reparticion

where 
h.codigo_jurisdiccion_destino = 'FDE'
and h.codigo_jurisdiccion_origen != 'FDE'
and h.fecha_operacion between to_date('01/01/2023','dd/mm/yyyy')
      and to_date('01/01/2024','dd/mm/yyyy')
and d.tipo_doc_acronimo in ('VSTA','VSITA','NOFES','PREV')

;