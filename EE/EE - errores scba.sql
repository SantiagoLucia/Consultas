select
fecha_creacion as fecha_recepcion,
id_notificacion_recibida as id_interno,
domicilio_electronico,
id_causa as id_causa_scba,
id_aviso,
motivo

from ee_ged.ee_notificacion_recibida 
where fecha_creacion > trunc(sysdate,'YEAR')
order by fecha_creacion desc;