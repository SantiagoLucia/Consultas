select
   sum(case when fecha_eliminacion_bandeja is null then 1 end) en_bandeja,
   sum(case when leido is null and fecha_eliminacion_bandeja is null then 1 end) sin_leer,
   sum(case when leido is not null and fecha_eliminacion_bandeja is null then 1 end) leidas
from
   gedo_ged.ccoo_comunicacion_destino
where
   nombre_usuario = 'USERT1';