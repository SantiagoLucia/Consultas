select * from (
select  
    ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||
		ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario as nro_expediente, 
    ee.usuario_creador as usuario_caratulador,
    ee.codigo_reparticion_usuario as cod_reparticion_caratulacion, 
    rep_caratula.nombre_reparticion as reparticion_caratulacion, 
    min_caratula.codigo_reparticion as cod_organismo_caratulacion, 
    min_caratula.nombre_reparticion as organismo_caratulacion, 
	ee.fecha_creacion as fecha_caratulacion,
    tratas.codigo_trata,
	tratas.descripcion as trata,  
    ee.descripcion as descripcion, 
    solex.motivo, 
    ee.estado as estado_expediente,
    nvl(regexp_substr(t.assignee_, '[^.]+'),'simple') as tipo_tramitacion,
    regexp_substr(t.assignee_, '[^.]+') as usuario_asignado,
	du.apellido_nombre as nombre_apellido,
    coalesce(regexp_substr(regexp_substr(
		p.groupid_, '[^-]+', 1, 2),'[^.]+'),ssi.codigo_sector_interno) as sector_actual,
    repfin.codigo_reparticion as cod_reparticion_actual,
    repfin.nombre_reparticion as reparticion_actual,
    minfin.codigo_reparticion as cod_organismo_actual,  
    minfin.nombre_reparticion as organismo_actual,
    ee.usuario_modificacion,
	ee.fecha_modificacion as fecha_ultima_modificacion, 
	round(sysdate - ee.fecha_creacion) as dias_abierto,
	dfvalue.input_name,
	dfvalue.value_str

from 
    ee_ged.ee_expediente_electronico ee
    left join ee_ged.solicitud_expediente solex on solex.id = ee.solicitud_iniciadora
    left join ee_ged.trata tratas on tratas.id = ee.id_trata
    left join ee_ged.jbpm4_task t on t.execution_id_ = ee.id_workflow
    left join ee_ged.jbpm4_participation p on p.task_ = t.dbid_
    
    --caratulacion--
    left join track_ged.sade_reparticion rep_caratula on ee.codigo_reparticion_usuario = rep_caratula.codigo_reparticion
    left join track_ged.sade_reparticion min_caratula on rep_caratula.ministerio = min_caratula.id_reparticion
        
    --esta asignado a usuario--
    left join track_ged.sade_sector_usuario su on regexp_substr(t.assignee_, '[^.]+') = su.nombre_usuario
        and su.id_sector_usuario = (
            select max(z.id_sector_usuario) from track_ged.sade_sector_usuario z 
            where z.nombre_usuario = regexp_substr(t.assignee_, '[^.]+')
        )
	left join co_ged.datos_usuario du on du.usuario = su.nombre_usuario
	left join track_ged.sade_sector_interno ssi on su.id_sector_interno = ssi.id_sector_interno
    left join track_ged.sade_reparticion sr on ssi.codigo_reparticion = sr.id_reparticion
    left join track_ged.sade_reparticion sr1 on sr1.id_reparticion = sr.ministerio

    --sin asignar a usuario--
    left join track_ged.sade_reparticion repa on regexp_substr(p.groupid_, '[^-]+') = repa.codigo_reparticion
    left join track_ged.sade_reparticion ministerio on ministerio.id_reparticion = repa.ministerio

    --reparticion/ministerio actual
    left join track_ged.sade_reparticion repfin on repfin.codigo_reparticion = coalesce(sr.codigo_reparticion, repa.codigo_reparticion)
    left join track_ged.sade_reparticion minfin on minfin.codigo_reparticion = coalesce(sr1.codigo_reparticion, ministerio.codigo_reparticion)

   --documentos
   left join ee_ged.ee_expediente_documentos eedocs on eedocs.id = ee.id and eedocs.posicion = 1
   left join ee_ged.documento eedoc on eedocs.id_documento = eedoc.id
   left join gedo_ged.df_form_comp_value dfvalue on dfvalue.id_transaction = eedoc.id_transaccion_fc
   
where
    tratas.codigo_trata = 'LEG0020' and 
	ee.codigo_reparticion_usuario != 'TESTGDEBA'
	and ee.fecha_creacion > trunc(sysdate, 'YEAR')
)
   
pivot(max(value_str) 
for input_name in (
   'idorganismo' as idorganismo,
   'organismoorigen'as organismoorigen,
   'idcausanumero' as idcausanumero,
   'idnotificacion' as idnotificacion
   )
);   