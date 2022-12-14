SELECT  
rce_ddw.ID,
rce_ddw.fecha_de_carga,
rce_ddw.id_persona_renaper,
rce_ddw.tipo_documento,
rce_ddw.numero_documento,
rce_ddw.primer_nombre,
rce_ddw.segundo_nombre,
rce_ddw.tercer_nombre,
rce_ddw.primer_apellido,
rce_ddw.segundo_apellido,
rce_ddw.tercer_apellido,
rce_ddw.fecha_nacimiento,
rce_ddw.sexo,
rce_ddw.estado_civil,
rce_ddw.nacionalidad,
rce_ddw.pais_domicilio,
rce_ddw.provincia_domicilio,
rce_ddw.municipio_domicilio,
rce_ddw.ciudad_domicilio,
rce_ddw.calle_domicilio,
rce_ddw.numero_domicilio,
rce_ddw.piso_domicilio,
rce_ddw.depto_domicilio,
dbms_lob.substr(rce_ddw.observaciones_domicilio, 4000, 1 ) AS observaciones_domicilio,
rce_ddw.pais_fallecimiento,
rce_ddw.provincia_fallecimiento,
rce_ddw.municipio_fallecimiento,
rce_ddw.ciudad_fallecimiento,
rce_ddw.fecha_fallecido,
rce_ddw.hora_fallecido,
rce_ddw.minutos_fallecido,
rce_ddw.delegacion_dato_topografico,
rce_ddw.tomo_dato_topografico,
rce_ddw.acta_dato_topografico,
rce_ddw.anio_dato_topografico,
dbms_lob.substr(rce_ddw.observaciones_tramite, 4000, 1 ) AS observaciones_tramite,
rce_ddw.entrega_dni,
dbms_lob.substr(rce_ddw.adjunto_acta, 4000, 1 ) AS adjunto_acta,
dbms_lob.substr(rce_ddw.adjunto_boleta_de_pago, 4000, 1 ) AS adjunto_boleta_de_pago,
dbms_lob.substr(rce_ddw.adjunto_cupon_de_pago, 4000, 1 ) AS adjunto_cupon_de_pago,
rce_ddw.fecha_informado_renaper,
rce_ddw.id_tramite_renaper,
rce_ddw.fk_registro

FROM  rce_ged.rce_defuncion_dw rce_ddw
INNER JOIN rce_ged.rce_ifaz_defuncion_renaper rce_idr ON rce_idr.fk_registro = rce_ddw.fk_registro
WHERE  rce_idr.id_ciudadano_renaper IS NULL; 