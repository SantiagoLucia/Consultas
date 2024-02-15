select
    ea2.id_codigo_caratula as id_expediente_asociado,
    ea1.posicion,
    ea2.fecha_asociacion,
    ea2.tipo_documento||'-'||ea2.anio||'-'||ea2.numero ||'- -GDEBA-'||ea2.codigo_reparticion_usuario as expediente_asociado,
    count(*) cantidad_documentos,
    eea.id_trata,
    eea.id_workflow,
    eea.estado,
    eea.sistema_creador,
    eea.sistema_apoderado,
    t.assignee_
    
    
from ee_ged.ee_expediente_electronico ee
left join ee_ged.ee_expediente_asociado ea1 on ee.id = ea1.id
left join ee_ged.expedienteasociado ea2 on ea1.id_expedienteasociado = ea2.id
left join ee_ged.ee_expediente_documentos ed on ea2.id = ed.id
left join ee_ged.documento d on ed.id_documento = d.id

left join ee_ged.ee_expediente_electronico eea on eea.id = ea2.id_codigo_caratula
left join ee_ged.jbpm4_task t on t.execution_id_ = eea.id_workflow
left join ee_ged.jbpm4_participation p on p.task_ = t.dbid_

where 
--por nro expediente madre
ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -GDEBA-'||ee.codigo_reparticion_usuario = 'EX-2019-15837994- -GDEBA-HZGADIGIMSALGP'
and ee.es_cabecera_tc = 1 and ea2.definitivo = 1

group by
ea2.id_codigo_caratula,
ea2.tipo_documento||'-'||ea2.anio||'-'||ea2.numero ||'- -GDEBA-'||ea2.codigo_reparticion_usuario,
ea1.posicion,
ea2.fecha_asociacion,
eea.id_trata,
eea.id_workflow,
eea.estado,
eea.sistema_creador,
eea.sistema_apoderado,
t.assignee_

order by ea1.posicion

;