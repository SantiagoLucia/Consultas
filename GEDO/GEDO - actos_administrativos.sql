select 
    g.numero numero_gedo,
    g.numeroespecial numero_especial,
    g.reparticion codigo_reparticion,
    sr.nombre_reparticion nombre_reparticion,
    sr1.codigo_reparticion codigo_ministerio,
    sr1.nombre_reparticion nombre_ministerio,
    to_char(g.fechacreacion, 'dd/mm/yyyy') fecha_creacion,
    t.acronimo tipo_gedo,
    t.nombre nombre_gedo
    
from gedo_ged.gedo_documento g
inner join gedo_ged.gedo_tipodocumento t on t.id = g.tipo
inner join track_ged.sade_reparticion sr on g.reparticion = sr.codigo_reparticion  
inner join track_ged.sade_reparticion sr1 on sr.ministerio = sr1.id_reparticion

where
    t.acronimo in ('DECRE','DECRI','DECTO','DI','DISFC','DISPC','DISPO','RESFC',
                    'RESFO','RESO','RESOL','RESOC') and
    g.fechacreacion > trunc(sysdate)
order by g.fechacreacion desc;