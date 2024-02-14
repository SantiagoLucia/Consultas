select * from (
select 
    eedoc.numero_sade, 
    eedoc.nombre_usuario_generador,
    to_char(eedoc.fecha_creacion, 'yyyy/mm/dd') as fecha_creacion,
    to_char(eedoc.fecha_creacion, 'hh24:mm') as hora_creacion,
    ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'-'||
        ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario as expediente,
    ee.usuario_creador,
    dfvalue.input_name,
    dfvalue.value_str || dfvalue.value_int as input_value

from 
ee_ged.ee_expediente_electronico ee
inner join ee_ged.trata eetrata on eetrata.id = ee.id_trata
inner join ee_ged.ee_expediente_documentos eedocs on ee.id = eedocs.id
inner join ee_ged.documento eedoc on eedocs.id_documento = eedoc.id
inner join gedo_ged.df_form_comp_value dfvalue on dfvalue.id_transaction = eedoc.id_transaccion_fc

where  
    eetrata.codigo_trata = 'SLYT0006'
    and eetrata.acronimo_doc_gedo = 'CVOJU'
	and ee.fecha_creacion > trunc(sysdate)
)
pivot(max(input_value) for input_name in (
    'tematicadelacausa' as tematicadelacausa,
    'nombreactor' as nombreactor,
    'nombredemandado' as nombredemandado,
    'tematica' as tematica,
    'ndeexpedientejudicial' as ndeexpedientejudicial,
    'Sseparador' as Sseparador,
    'tribunalojuzgado' as tribunalojuzgado,
    'Scaratula' as Scaratula
));