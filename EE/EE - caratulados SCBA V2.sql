with cantidad_intentos as (
select 
id_notificacion, 
count(*) as cantidad_intentos 
from ee_ged.ee_notificacion_recibida
where id_notificacion in (select id_notificacion
from ee_ged.ee_notificacion_recibida where fecha_creacion > trunc(sysdate,'YEAR'))
group by id_notificacion
),

notificacion_intentos as (
select 
nr.domicilio_electronico,
nr.id_notificacion,
nr.id_causa,
nr.usuario_caratulador,
nr.estado_notificacion,
nr.motivo as motivo_reintento,
nr.id_organismo,
to_char(nr.fecha_envio, 'dd/mm/yyyy hh24:mi:ss') as fecha_envio,
ci.cantidad_intentos
from ee_ged.ee_notificacion_recibida nr
inner join cantidad_intentos ci on nr.id_notificacion = ci.id_notificacion
where 
nr.id_notificacion_recibida = (
select max(id_notificacion_recibida) from ee_ged.ee_notificacion_recibida
where id_notificacion = nr.id_notificacion)
)

select
ni.id_notificacion,
ni.id_causa,
ni.usuario_caratulador,
ni.estado_notificacion,
ni.motivo_reintento,
ni.cantidad_intentos,
ni.fecha_envio,
ni.id_organismo,
case ee.tipo_documento when 'EX' then 
    ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||ee.codigo_reparticion_actuacion||
    '-'||ee.codigo_reparticion_usuario end as nro_expediente, 
ee.codigo_reparticion_usuario as cod_reparticion_caratulacion, 
rep_caratula.nombre_reparticion as reparticion_caratulacion, 
min_caratula.codigo_reparticion as cod_organismo_caratulacion, 
min_caratula.nombre_reparticion as organismo_caratulacion, 
to_char(ee.fecha_creacion, 'dd/mm/yyyy') as fecha_caratulacion, 
to_char(ee.fecha_creacion, 'hh24:mi:ss') as hora_caratulacion,
tratas.codigo_trata,
tratas.descripcion as descripcion_trata,  
ee.descripcion as descripcion, 
solex.motivo, 
ee.estado as estado_expediente

from notificacion_intentos ni
left join ee_ged.ee_expediente_electronico ee on ee.id_externo = ni.id_notificacion
left join ee_ged.solicitud_expediente solex on solex.id = ee.solicitud_iniciadora
left join ee_ged.trata tratas on tratas.id = ee.id_trata
--caratulacion--
left join track_ged.sade_reparticion rep_caratula on ee.codigo_reparticion_usuario = rep_caratula.codigo_reparticion
left join track_ged.sade_reparticion min_caratula on rep_caratula.ministerio = min_caratula.id_reparticion

order by id_notificacion desc;