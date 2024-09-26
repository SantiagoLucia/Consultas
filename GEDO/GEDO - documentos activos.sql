SELECT
    acronimo,
    nombre,
    familia,
    version AS "ULTIMA VERSION",
    
    CASE tipoproduccion
        WHEN 1 THEN 'LIBRE'
        WHEN 2 THEN 'IMPORTADO'
        WHEN 3 THEN 'TEMPLATE'
        WHEN 4 THEN 'IMPORTADO-TEMPLATE'
    END AS "TIPO PRODUCCION",    
    
    CASE WHEN esespecial = 0 THEN 'NO'
         ELSE 'SI'
    END AS "ES ESPECIAL",
    
    CASE WHEN tienetoken = 0 THEN 'NO'
         ELSE 'SI'
    END AS "TIENE TOKEN",
    
    ROUND(tamano / 1024 / 1024, 2) AS "TAMAÑO_MB"

FROM ( 
    SELECT
        td.acronimo,
        td.nombre,
        td.version,
        td.tipoproduccion,
        ROW_NUMBER() OVER (PARTITION BY td.acronimo ORDER BY td.fecha_creacion DESC) AS rn,
        td.esespecial,
        td.tienetoken,
        f.nombre AS familia,
        td.tamano
        
    FROM
        gedo_ged.gedo_tipodocumento td
        INNER JOIN gedo_ged.gedo_tipodocumento_familia f ON td.familia = f.id 
    WHERE
        td.estado = 'ALTA'
) AS subquery

WHERE
    rn = 1;
