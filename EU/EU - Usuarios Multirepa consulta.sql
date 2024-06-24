select distinct
    su.nombre_usuario,
    du.apellido_nombre apellido_nombre,
    decode(su.estado_registro, 0, 'baja', 1, 'alta') estado,
    du.numero_cuit cuit,
    du.mail,
    c.cargo,
    to_char(su.fecha_creacion,'dd/mm/yyyy') fecha_creacion,
    decode(du.aceptacion_tyc, 0, 'no', 1, 'si') primer_ingreso,
    ssi.codigo_sector_interno codigo_sector_interno,
    ssi.nombre_sector_interno nombre_sector_interno,
    sr.codigo_reparticion codigo_reparticion,
    sr.nombre_reparticion  nombre_reparticion,
    sr1.codigo_reparticion codigo_ministerio,
    sr1.nombre_reparticion  nombre_ministerio,
    srh.codigo_reparticion codigo_rep_habilitada,
    srh.nombre_reparticion  nombre_rep_habilitada,
    sr1h.codigo_reparticion codigo_min_habilitada,
    sr1h.nombre_reparticion  nombre_min_habilitada
from 
    track_ged.sade_sector_usuario su 
    left join track_ged.sade_sector_interno ssi on (su.id_sector_interno = ssi.id_sector_interno) 
    left join track_ged.sade_reparticion sr on (ssi.codigo_reparticion = sr.id_reparticion) 
    left join track_ged.sade_reparticion sr1 on (sr.ministerio = sr1.id_reparticion)
    left join co_ged.datos_usuario du on (du.usuario = su.nombre_usuario)
    left join co_ged.cargos c on (du.cargo = c.id) 
    left join track_ged.sade_usr_repa_habilitada rh on rh.nombre_usuario = su.nombre_usuario    
    left join track_ged.sade_reparticion srh on (rh.id_reparticion = srh.id_reparticion) 
    left join track_ged.sade_reparticion sr1h on (srh.ministerio = sr1h.id_reparticion)

where
    su.estado_registro = 1 and srh.codigo_reparticion is not null
    

order by sr.codigo_reparticion, su.nombre_usuario;