-- consulta actas digitales (MEJORA)
select * from (
select 
   c.nombre as delegacion,
   l.nombre as localidad,
   d.nombre as departamento,
   r.fk_tipo_registro as tipo_registro

from rce_ged.rce_acta_registro r 
inner join rce_ged.sys_circunscripcion c
   on r.circunscripcion = c.nombre 
      and r.fk_tipo_registro = c.fk_tipo_registro
inner join eu_ged.eu_localidad l 
   on c.fk_localidad = l.id
inner join eu_ged.eu_departamento d
   on l.id_departamento = d.id
-- fetch first 1000000 rows only
)
pivot (count(*) for tipo_registro in (
   2 as defunciones,
   4 as matrimonios,
   8 as nacimientos
   )
); 
