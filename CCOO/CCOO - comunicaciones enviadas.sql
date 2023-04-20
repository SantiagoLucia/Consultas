SELECT
   com.fecha_creacion,
   doc.anio,
   com_dest.leido,
   com.fecha_eliminacion_bandeja,
   com.mensaje,
   DECODE(com.tiene_adjuntos,1,'SI','NO') AS tiene_adjuntos,
   doc.numero,
   doc.motivo,
   com.usuario_creador AS usuario_origen,
   doc.datos_usuario AS datos_usuario_origen,
   doc.reparticion AS reparticion_origen,
   doc.jurisdiccion AS jurisdiccion_origen,
   com_dest.nombre_usuario AS usuario_destino,
   com_dest.datos_usuario AS datos_usuario_destino,
   com_dest.mesa_destino

FROM 
   gedo_ged.ccoo_comunicacion com
   LEFT JOIN gedo_ged.ccoo_comunicacion_destino com_dest 
      ON com.id = com_dest.id_comunicacion   
   LEFT JOIN gedo_ged.gedo_documento doc 
      ON com.id_documento = doc.id

WHERE
   com.fecha_creacion > trunc(sysdate);