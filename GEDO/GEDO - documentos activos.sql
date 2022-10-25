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
    round(tamano/1024/1024,2) tamaño_mb

FROM ( 
    SELECT
        td.acronimo,
        td.nombre,
        td.version,
        td.tipoproduccion,
        MAX (td.version) OVER (PARTITION BY td.acronimo) AS ultima_version,
        td.esespecial,
        td.tienetoken,
        f.nombre familia,
        td.tamano
        
    FROM
        gedo_ged.gedo_tipodocumento td
        inner join gedo_ged.gedo_tipodocumento_familia f on td.familia = f.id 
    WHERE
        estado = 'ALTA'
    )

WHERE
    version = ultima_version 
    
ORDER BY
    tamaño desc;