select * from (
select
    su.nombre_usuario,
    du.apellido_nombre nombre_apellido,
    du.mail,
    ssi.codigo_sector_interno as codigo_sector_interno,
    sr.codigo_reparticion as codigo_reparticion,
    sr.nombre_reparticion  as nombre_reparticion,
    case when ee.id is not null then 
    	ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario
    end as nro_expediente,
    
    coalesce(to_char(
    (select 
    max(fecha_operacion)
    from ee_ged.historialoperacion hist
    where hist.id_expediente = ee.id and
    hist.tipo_operacion = 'pase' and
    regexp_replace(hist.codigo_reparticion_destino,'[^A-Z0-9-#-]','')
        in ('DPPSGG','DALABSGG','DAPSGG','DSADSGG')
    and
    hist.reparticion_usuario
    not in ('DPPSGG','DALABSGG','DAPSGG','DSADSGG')
    ),'dd/mm/yyyy'),to_char(jt.create_,'dd/mm/yyyy')) as fecha_ingreso,    
    
    to_char(jt.create_,'dd/mm/yyyy') as fecha_adquisicion,
    to_char(jt.create_,'hh24:mi:ss') as hora_adquisicion,
    round(sysdate - jt.create_) as dias_permanencia,
    ee.codigo_reparticion_usuario as cod_reparticion_caratulacion, 
    sr1.nombre_reparticion as reparticion_caratulacion, 
    sr2.codigo_reparticion as cod_organismo_caratulacion, 
    sr2.nombre_reparticion as organismo_caratulacion, 
	to_char(ee.fecha_creacion,'dd/mm/yyyy') as fecha_caratulacion, 
	to_char(ee.fecha_creacion,'hh24:mi:ss') as hora_caratulacion,
    ee.estado,
    t.codigo_trata,
    t.descripcion as trata
    
from 
    track_ged.sade_sector_usuario su 
    left join track_ged.sade_sector_interno ssi on su.id_sector_interno = ssi.id_sector_interno 
    left join track_ged.sade_reparticion sr on ssi.codigo_reparticion = sr.id_reparticion 
    left join co_ged.datos_usuario du on du.usuario = su.nombre_usuario
    left join ee_ged.jbpm4_task jt on regexp_substr(jt.assignee_,'[^.]+') = su.nombre_usuario
    left join ee_ged.ee_expediente_electronico ee on ee.id_workflow = jt.execution_id_ 
	left join ee_ged.trata t on ee.id_trata = t.id
	left join track_ged.sade_reparticion sr1 on ee.codigo_reparticion_usuario = sr1.codigo_reparticion 
	left join track_ged.sade_reparticion sr2 on sr1.ministerio = sr2.id_reparticion
where sr.codigo_reparticion in ('DPPSGG','DALABSGG','DAPSGG','DSADSGG')
and su.estado_registro = 1

UNION

select
    null as nombre_usuario,
    null as nombre_apellido,
    null as mail,
    si.codigo_sector_interno,
    sr.codigo_reparticion,
    sr.nombre_reparticion as nombre_reparticion,
    case when ee.id is not null then 
    	ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario
    end as nro_expediente,
    to_char(jt.create_,'dd/mm/yyyy') as fecha_ingreso,
    null as fecha_adquisicion,
    null as hora_adquisicion,
    round(sysdate - jt.create_) as dias_permanencia,
    ee.codigo_reparticion_usuario as cod_reparticion_caratulacion, 
    sr1.nombre_reparticion as reparticion_caratulacion, 
    sr2.codigo_reparticion as cod_organismo_caratulacion, 
    sr2.nombre_reparticion as organismo_caratulacion, 
	to_char(ee.fecha_creacion,'dd/mm/yyyy') as fecha_caratulacion, 
	to_char(ee.fecha_creacion,'hh24:mi:ss') as hora_caratulacion,
    ee.estado,
    t.codigo_trata,
    t.descripcion as trata    

from 
	track_ged.sade_reparticion sr
	left join track_ged.sade_sector_interno si on sr.id_reparticion = si.codigo_reparticion 
	left join ee_ged.jbpm4_participation jp on jp.groupid_ = sr.codigo_reparticion||'-'||si.codigo_sector_interno
    left join ee_ged.jbpm4_task jt on jt.dbid_ = jp.task_ 
    left join ee_ged.ee_expediente_electronico ee on ee.id_workflow = jt.execution_id_ 
	left join ee_ged.trata t on ee.id_trata = t.id
	left join track_ged.sade_reparticion sr1 on ee.codigo_reparticion_usuario = sr1.codigo_reparticion 
	left join track_ged.sade_reparticion sr2 on sr1.ministerio = sr2.id_reparticion
where sr.codigo_reparticion in ('DPPSGG','DALABSGG','DAPSGG','DSADSGG')
)
order by dias_permanencia desc nulls last;