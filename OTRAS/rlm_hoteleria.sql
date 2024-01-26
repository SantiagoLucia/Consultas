with aux_datos_adicionales as (

select
cv.id_transaction as transaccion,
c.label as dato,
cv.value_str||cv.value_int||cv.value_date||
   cv.value_double||cv.value_boolean as valor

from gedo_ged.df_form_comp_value cv
inner join gedo_ged.df_form_component c on 
   cv.id_form_component = c.id
where cv.id_transaction in (
   select distinct fc_id_transaction from rlm_ged.registros
   where tipo_registro = 12516
   )
),

datos_adicionales as (
select * from aux_datos_adicionales
pivot (max(valor) for dato in (
   'Tipo de persona' as "TIPO DE PERSONA",
   'CUIT' as CUIT,
   'Nombres' as NOMBRES,
   'Apellidos' as APELLIDOS,
   'Apoderado' as APODERADO,
   'Tipo de alojamiento' as "TIPO DE ALOJAMIENTO",
   'Categoría del alojamiento' as "CATEGORIA DEL ALOJAMIENTO",
   'Nombre' as NOMBRE,
   'Localidad/Partido' as "LOCALIDAD/PARTIDO",
   'Calle y altura/Ruta y KM.' as "CALLE Y ALTURA/RUTA Y KM.",
   'Código Postal' as "CODIGO POSTAL",
   'Teléfono (incluir el código de área)' as "TELEFONO (INCLUIR EL CODIGO D",
   'Correo electrónico' as "CORREO ELECTRONICO" 
   )
)
)

select  
r.letra||'-'||r.anio||'-'||r.numero||'-'||r.reparticion_actuacion||'-'||
   r.reparticion_usuario as numero_registro,
r.reparticion_asignada,
r.estado,
r.fecha_alta,
r.fecha_registracion,
r.usuario_modificacion,
r.form_codigo,
r.codigo_trata,
er.codigoee as expediente_asociado, 
da.*

from rlm_ged.registros r
inner join datos_adicionales da on da.transaccion = r.fc_id_transaction
left join rlm_ged.rlm_expediente_registro er on r.id = er.fk_registro
order by r.id desc
;