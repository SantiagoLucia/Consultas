select
sum(case when dest.fecha_eliminacion_bandeja is null then 1 end) en_bandeja,
sum(case when dest.leido is null and dest.fecha_eliminacion_bandeja is null then 1 end) sin_leer,
sum(case when dest.leido is not null and dest.fecha_eliminacion_bandeja is null then 1 end) leidas
from
gedo_ged.ccoo_comunicacion_destino dest
inner join gedo_ged.ccoo_comunicacion com on dest.id_comunicacion = com.id
where
dest.nombre_usuario = 'SPRIVITERA'