WITH usuarios AS (
select usuario 
from gedo_ged.gedo_historial 
where fecha_inicio > trunc(sysdate) - 90
UNION
select usuario
from ee_ged.historialoperacion
where fecha_operacion > trunc(sysdate) - 90
)
select 
u.usuario,
du.mail, 
du.numero_cuit,
sr1.codigo_reparticion as codigo_ministerio,
sr1.nombre_reparticion as nombre_ministerio
from usuarios u
inner join co_ged.datos_usuario du on du.usuario = u.usuario
inner join track_ged.sade_sector_usuario su on du.usuario = su.nombre_usuario 
inner join track_ged.sade_sector_interno ssi on su.id_sector_interno = ssi.id_sector_interno
inner join track_ged.sade_reparticion sr on ssi.codigo_reparticion = sr.id_reparticion
inner join track_ged.sade_reparticion sr1 on sr.ministerio = sr1.id_reparticion
where su.estado_registro = 1 and sr.codigo_reparticion != 'TESTGDEBA'
and du.apellido_nombre NOT LIKE 'Usuario%'
order by sr1.codigo_reparticion asc, u.usuario asc;