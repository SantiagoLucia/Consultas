select
ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario as nro_expediente,
ee.codigo_reparticion_usuario as cod_reparticion_caratulacion,
sr.nombre_reparticion as reparticion_caratulacion, 
sr2.codigo_reparticion as cod_organismo_caratulacion, 
sr2.nombre_reparticion as organismo_caratulacion, 
to_char(ee.fecha_creacion,'dd/mm/yyyy') as fecha_caratulacion, 
to_char(ee.fecha_creacion,'hh24:mi:ss') as hora_caratulacion,
t.codigo_trata,
t.descripcion as trata,  
ee.descripcion as descripcion,    
solex.motivo,
ee.estado as estado_expediente,
case 
	when jt.assignee_ is not null then
		nvl(regexp_substr(jt.assignee_,'[^.]+', 1, 2),'simple')	
	when jp.groupid_ is not null then
		nvl(regexp_substr(jp.groupid_,'[^.]+', 1, 2),'simple')
end as tipo_tramitacion,
regexp_substr(jt.assignee_,'[^.]+') as usuario_asignado,
du.apellido_nombre as nombre_apellido,
coalesce(ssi.codigo_sector_interno,regexp_substr(jp.groupid_,'[A-Z0-9#]+', 1, 2)) as sector_actual,
coalesce(sr3.codigo_reparticion, sr5.codigo_reparticion) as cod_reparticion_actual,
coalesce(sr3.nombre_reparticion, sr5.nombre_reparticion) as reparticion_actual,
coalesce(sr4.codigo_reparticion, sr6.codigo_reparticion) as cod_organismo_actual,
coalesce(sr4.nombre_reparticion, sr6.nombre_reparticion) as organismo_actual,
ee.usuario_modificacion,
to_char(ee.fecha_modificacion,'dd/mm/yyyy') as fecha_ultima_modificacion, 
to_char(ee.fecha_modificacion,'hh24:mi:ss') as hora_ultima_modificacion,
round(sysdate - ee.fecha_creacion) as dias_abierto

from 
-- expedientes caratulados
ee_ged.ee_expediente_electronico ee 
-- solicitud inciadora
left join ee_ged.solicitud_expediente solex on solex.id = ee.solicitud_iniciadora
-- ubicacion actual
left join ee_ged.jbpm4_task jt on ee.id_workflow = jt.execution_id_ 
left join ee_ged.jbpm4_participation jp on jt.dbid_ = jp.task_ 
-- trata
left join ee_ged.trata t on ee.id_trata = t.id 
-- reparticion caratulacion
left join track_ged.sade_reparticion sr on ee.codigo_reparticion_usuario = sr.codigo_reparticion 
left join track_ged.sade_reparticion sr2 on sr.ministerio = sr2.id_reparticion  
-- informacion de usuario asignado
left join track_ged.sade_sector_usuario ssu on regexp_substr(jt.assignee_,'[^.]+') = ssu.nombre_usuario 
	and ssu.estado_registro = 1
left join track_ged.sade_sector_interno ssi on ssu.id_sector_interno = ssi.id_sector_interno 
left join track_ged.sade_reparticion sr3 on ssi.codigo_reparticion = sr3.id_reparticion 
left join track_ged.sade_reparticion sr4 on sr3.ministerio = sr4.id_reparticion
left join co_ged.datos_usuario du on du.usuario = ssu.nombre_usuario
-- informacion de buzon grupal
left join track_ged.sade_reparticion sr5 on regexp_substr(jp.groupid_,'[^-]+') = sr5.codigo_reparticion
left join track_ged.sade_reparticion sr6 on sr5.ministerio = sr6.id_reparticion 

where
ee.fecha_creacion > trunc(sysdate);