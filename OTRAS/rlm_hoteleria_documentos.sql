select  
r.letra||'-'||r.anio||'-'||r.numero||'-'||r.reparticion_actuacion||'-'||
   r.reparticion_usuario as numero_registro,
dv.numero_gedo,
dv.fecha_vinculacion,
dv.referencia,
decode(dv.es_dato_adicional,0,'NO',1,'SI') as es_dato_adicional,
decode(dv.es_historico,0,'NO',1,'SI') as es_historico

from rlm_ged.registros r
left join rlm_ged.rlm_doc_vin_registro dv on r.id = dv.fk_registro
where r.tipo_registro = 12516;