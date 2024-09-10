select * from ee_ged.ee_expediente_electronico
where numero = 00631710 and codigo_reparticion_usuario = 'DSTAMJYDHGP';
-- id 2910140, es reservado

select
    ee.id id_exp,
    ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||
		ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario as nro_expediente,
    gd.id id_gedo,
    gd.numero gedo_asociado,
    gd.motivo,
    tr.reserva tipo_reserva
from
    ee_ged.ee_expediente_electronico ee
    inner join ee_ged.ee_expediente_documentos ed on ee.id = ed.id
    inner join ee_ged.documento d on ed.id_documento = d.id
    inner join gedo_ged.gedo_documento gd on d.numero_sade = gd.numero
    inner join gedo_ged.gedo_tipo_reserva tr on gd.tiporeserva = tr.id
where
    ee.id = 2910140
;