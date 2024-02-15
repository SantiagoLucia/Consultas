-- tareas gedo
select * from (
select
    s.nombre_usuario as usuario,
    du.apellido_nombre as nombre_apellido,
    c.cargo,
    r.codigo_reparticion as codigo_reparticion,
    task.name_

from gedo_ged.jbpm4_task task
inner join co_ged.datos_usuario du on du.usuario = task.assignee_
inner join co_ged.cargos c on du.cargo = c.id
inner join track_ged.sade_sector_usuario s on s.nombre_usuario = du.usuario
inner join track_ged.sade_sector_interno si on si.id_sector_interno = s.id_sector_interno
inner join track_ged.sade_reparticion r on r.id_reparticion = si.codigo_reparticion

where 
    r.codigo_reparticion = 'DIPROMGGP'
    and s.estado_registro = 1
)
pivot(count(name_) for name_ in (
    'Revisar Documento' as revisar_documento,
    'Revisar Documento con Firma Conjunta' 
        as revisar_documento_firma_c,
    'Rechazado' as rechazado,
    'Firmar Documento' as firmar_documento
));