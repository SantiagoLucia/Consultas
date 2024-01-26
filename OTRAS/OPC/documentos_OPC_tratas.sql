with tabla_expedientes as (
select 
ee.id as id_expediente
from ee_ged.ee_expediente_electronico ee
inner join ee_ged.trata t on ee.id_trata = t.id
where t.codigo_trata in ('COMP0012','COMP0018')
)
select
te.id_expediente,
d.numero_sade as numero,
ed.posicion as orden,
d.fecha_asociacion,
d.fecha_creacion,
d.tipo_doc_acronimo as acronimo,
d.motivo
    
from tabla_expedientes te
inner join ee_ged.ee_expediente_documentos ed on ed.id = te.id_expediente
inner join ee_ged.documento d on ed.id_documento = d.id
where d.definitivo = 1
and d.tipo_doc_acronimo != 'PV'
order by te.id_expediente, d.fecha_asociacion desc;