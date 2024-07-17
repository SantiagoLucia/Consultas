select 
surh.nombre_usuario,
du.apellido_nombre as nombre_apellido,
c.cargo,
sr2.codigo_reparticion,
sr2.nombre_reparticion,
sr3.codigo_reparticion as codigo_organismo,
sr3.nombre_reparticion as nombre_organismo,
ssi.codigo_sector_interno as codigo_sector_habilitado,
ssi.nombre_sector_interno as nombre_sector_habilitado,
sr.codigo_reparticion as codigo_reparticion_habilitada,
sr.nombre_reparticion as nombre_reparticion_habilitada

from track_ged.sade_usr_repa_habilitada surh  
inner join track_ged.sade_sector_interno ssi on surh.id_sector_interno = ssi.id_sector_interno
inner join track_ged.sade_reparticion sr on ssi.codigo_reparticion = sr.id_reparticion
inner join co_ged.datos_usuario du on surh.nombre_usuario = du.usuario 
inner join co_ged.cargos c on c.id = du.cargo 
inner join track_ged.sade_sector_usuario ssu on surh.nombre_usuario = ssu.nombre_usuario 
inner join track_ged.sade_sector_interno ssi2 on ssu.id_sector_interno = ssi2.id_sector_interno
inner join track_ged.sade_reparticion sr2 on ssi2.codigo_reparticion = sr2.id_reparticion
inner join track_ged.sade_reparticion sr3 on sr2.ministerio = sr3.id_reparticion 

where sr.ministerio = 2696829 -- IVMHYDUGP
and not exists (
    select ssu.nombre_usuario
    from track_ged.sade_sector_usuario ssu 
    inner join track_ged.sade_sector_interno ssi on ssu.id_sector_interno = ssi.id_sector_interno
    inner join track_ged.sade_reparticion sr on ssi.codigo_reparticion = sr.id_reparticion 
    where
    ssu.nombre_usuario = surh.nombre_usuario and
    ssu.estado_registro = 1 and
    ssi.estado_registro = 1 and 
    sr.estado_registro = 1 and 
    sr.ministerio = 2696829
)

order by surh.nombre_usuario asc;

