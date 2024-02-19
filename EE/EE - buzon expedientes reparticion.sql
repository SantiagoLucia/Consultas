select
regexp_substr(p.groupid_, '[^-]+') as reparticion,
regexp_substr(p.groupid_, '[A-Z0-9#]+', 1, 2) as sector,
ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||
        ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario as nro_expediente,
to_char(ee.fecha_creacion, 'dd/mm/yyyy') as fecha_caratulacion,
ee.descripcion as descripcion        

from ee_ged.jbpm4_participation p
inner join ee_ged.jbpm4_task t on p.task_ = t.dbid_
inner join ee_ged.ee_expediente_electronico ee on t.execution_id_ = ee.id_workflow

where regexp_substr(p.groupid_, '[^-]+') in (
    'DESIV','DPTEIV','DPTCAYOIV','DPTRYCIV',
    'DACIV','DSOIV','DPTSAIV','DPTOCIV'
)

order by regexp_substr(p.groupid_, '[^-]+'),
    regexp_substr(p.groupid_, '[A-Z0-9#]+', 1, 2),
    ee.fecha_creacion asc