select 
t.id,
to_char(t.fecha_alta,'dd/mm/yyyy hh24:mi:ss') as fecha_alta,
to_char(t.fecha_modificacion,'dd/mm/yyyy hh24:mi:ss') as fecha_modificacion,
to_char(t.fecha_baja,'dd/mm/yyyy hh24:mi:ss') as fecha_baja,
t.ip,
t.con_error,
tipo.nombre as tipo,
estado.descripcion as estado,
estado.automatico as estado_es_automatico,
tipo.trata_ee,
tipo.usuario_iniciador_ee,
tipo.reparticion_iniciadora_ee,
tipo.sector_iniciador_ee,
t.numero_ee,
ee.id_workflow,
ee.estado as estado_ee,
ee.sistema_creador,
ee.sistema_apoderado,
task.assignee_ as usuario_asignado,
p.groupid_ as grupo_asignado,
persona.razon_social as razon_social,
persona.nombres as nombres,
persona.apellidos as apellidos,
persona.cuit as cuit
from tad2_ged.tad_tramite t
inner join tad2_ged.tad_tipo_tramite tipo on t.id_tipo_tramite = tipo.id
inner join tad2_ged.tad_tramite_estado estado on t.id_tramite_estado = estado.id
left join ee_ged.ee_expediente_electronico ee on t.id = ee.id_externo
left join ee_ged.jbpm4_task task on task.execution_id_ = ee.id_workflow
left join ee_ged.jbpm4_participation p on p.task_ = task.dbid_
left join tad2_ged.tad_persona persona on t.id_persona = persona.id
where t.id_tipo_tramite = 1368 -- SAS Libros Digitales
order by t.fecha_alta desc;