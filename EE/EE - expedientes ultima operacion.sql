SELECT 
    e.tipo_documento || '-' || e.anio || '-' || e.numero || '- -' ||
    e.codigo_reparticion_actuacion || '-' || e.codigo_reparticion_usuario AS "número de expediente",
    h.tipo_operacion AS "última operación",
    TO_CHAR(h.fecha_operacion) AS "fecha última operación",
    h.usuario AS "usuario última operación",
    h.reparticion_usuario AS "repartición última operación",
    h.sector_usuario_origen AS "sector última operación",
    h.motivo AS "motivo",
    h.estado AS "estado",
    h.destinatario AS "destinatario",
    h.codigo_sector_destino AS "código sector destino",
    h.codigo_reparticion_destino AS "código repatición destino",
    t.codigo_trata AS "cod trata",
    t.descripcion AS "trata"
FROM  
    ee_ged.ee_expediente_electronico e
LEFT JOIN 
    ee_ged.trata t ON t.id = e.id_trata
LEFT JOIN (
    SELECT 
        h.*,
        ROW_NUMBER() OVER (PARTITION BY h.id_expediente ORDER BY h.fecha_operacion DESC) AS rn
    FROM 
        ee_ged.historialoperacion h 
     
) h ON e.id = h.id_expediente AND h.rn = 1
WHERE 
	e.id = 7971847

ORDER BY 
    h.fecha_operacion DESC;
