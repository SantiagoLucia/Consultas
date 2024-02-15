select
    ee.id id_exp,
    ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||
		ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario as nro_expediente,
    gd.id id_gedo,
    gd.numero gedos_asociados,
    tr.reserva tipo_reserva
from
    ee_ged.ee_expediente_electronico ee
    inner join ee_ged.ee_expediente_documentos ed on ee.id = ed.id
    inner join ee_ged.documento d on ed.id_documento = d.id
    inner join gedo_ged.gedo_documento gd on d.numero_sade = gd.numero
    inner join gedo_ged.gedo_tipo_reserva tr on gd.tiporeserva = tr.id
where
    ee.id = 1569742;