select 
   'EX-'||regexp_substr(h.expediente,'[0-9]{4}',1)||'-'|| 
      regexp_substr(h.expediente,'[0-9]+',7)||'-GDEBA-'||
      regexp_substr(h.expediente,'[^-]+',1,2) as numero_expediente,
   h.tipo_operacion as ultima_operacion,
   to_char(h.fecha_operacion,'DD-MON-RR') as fecha_ultima_operacion,
   h.usuario as usuario_ultima_operacion,
   h.reparticion_usuario as reparticion_ultima_operacion,
   h.sector_usuario_origen as sector_ultima_operacion,
   h.motivo,
   h.estado,
   h.destinatario,
   h.codigo_sector_destino,
   h.codigo_reparticion_destino,
   'REDIP00007' as codigo_trata,
   'Registro Civil - Programa de Identidad de la Niñez' as trata

from ee_ged.historialoperacion h
inner join ee_ged.ee_expediente_electronico ee on
   h.id_expediente = ee.id and ee.id_trata = 321
left join ee_ged.historialoperacion haux on
   h.id_expediente = haux.id_expediente and
   h.ord_hist < haux.ord_hist
where haux.id_expediente is null;