select * from (
   select 
      ar.circunscripcion as delegacion,
      l.nombre as localidad,
      d.nombre as departamento,
      c.fk_localidad,
      ar.fk_tipo_registro 
   from rce_ged.rce_acta_registro ar
   inner join rce_ged.sys_circunscripcion c 
      on ar.circunscripcion = c.nombre and ar.fk_tipo_registro = c.fk_tipo_registro
   inner join eu_ged.eu_localidad l 
      on l.id = c.fk_localidad
   inner join eu_ged.eu_departamento d 
      on l.id_departamento = d.id

) pivot (
  count(*) for fk_tipo_registro in (
  2 defunciones, 4 matrimonios, 8 nacimientos
  )
);