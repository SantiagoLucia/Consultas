with expediente_documentos as (
   select
       ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'-'||
         ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario 
         as nro_expediente,
       gd.numero as documento,  
       gd.peso as peso_bytes
   from
       ee_ged.ee_expediente_electronico ee
       inner join ee_ged.ee_expediente_documentos ed on ee.id = ed.id
       inner join ee_ged.documento d on ed.id_documento = d.id
       inner join gedo_ged.gedo_documento gd on d.numero_sade = gd.numero
   where
       ee.id = 4210814
)

select 
   nro_expediente,
   documento,
   count(*) as cantidad,
   round(sum(peso_bytes/1024/1024),2) as peso_megas

from expediente_documentos
group by rollup(nro_expediente, documento);