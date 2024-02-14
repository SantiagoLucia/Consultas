select
    count(*)
from ee_ged.ee_expediente_electronico ee
inner join track_ged.sade_reparticion r on 
	r.codigo_reparticion = ee.codigo_reparticion_usuario
inner join track_ged.sade_reparticion r1 on 
	r1.id_reparticion = r.ministerio
where r1.codigo_reparticion = 'IPS';