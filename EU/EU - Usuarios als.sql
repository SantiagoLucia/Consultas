select
su.nombre_usuario,
du.apellido_nombre apellido_nombre,
du.numero_cuit cuit,
du.mail,
c.cargo,
sr.codigo_reparticion codigo_reparticion,
sr.nombre_reparticion  nombre_reparticion

from co_ged.datos_usuario du
inner join track_ged.sade_sector_usuario su 
   on du.usuario = su.nombre_usuario
inner join track_ged.sade_sector_interno ssi 
   on su.id_sector_interno = ssi.id_sector_interno
inner join track_ged.sade_reparticion sr 
   on ssi.codigo_reparticion = sr.id_reparticion
inner join track_ged.sade_reparticion sr1 
   on sr.ministerio = sr1.id_reparticion
inner join co_ged.cargos c 
    on du.cargo = c.id
inner join track_ged.sade_admin_reparticion rad
   on sr.id_reparticion = rad.id_reparticion
where rad.nombre_usuario = 'SROSER'