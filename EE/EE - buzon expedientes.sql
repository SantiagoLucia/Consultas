select
t.assignee_ as usuario,
du.apellido_nombre as nombre_apellido,
ee.tipo_documento || '-' || ee.anio || '-' || ee.numero || '-' || 
	ee.codigo_reparticion_actuacion || '-' || ee.codigo_reparticion_usuario as nro_expediente,
to_char(ee.fecha_creacion,'dd/mm/yyyy') as fecha_caratulacion,
to_char(ee.fecha_modificacion,'dd/mm/yyyy') as ultima_modificacion,
ee.estado

from ee_ged.jbpm4_task t
inner join ee_ged.ee_expediente_electronico ee on ee.id_workflow = t.execution_id_
left join co_ged.datos_usuario du on du.usuario = regexp_substr(assignee_, '[^.]+')
where
regexp_substr(assignee_, '[^.]+') in ('CBARRETO')

order by t.assignee_;