select 
    fecha_operacion,
    movimiento,
    nro_expediente,
    descripcion,
    cod_reparticion_caratulacion,
    reparticion_caratulacion,
    cod_organismo_caratulacion,
    organismo_caratulacion,
    fecha_caratulacion,
    codigo_trata,
    trata,
    cod_sector_origen,
    cod_reparticion_origen,
    reparticion_origen,
    cod_organismo_origen,
    organismo_origen,
    cod_sector_destino,
    cod_reparticion_destino,
    cod_organismo_destino,
    organismo_destino
from (

select
    h.id,
    to_char(h.fecha_operacion,'dd/mm/yyyy hh24:mi:ss') as fecha_operacion,
    'egreso' as movimiento,
    ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario as nro_expediente,
    ee.descripcion as descripcion, 
    ee.codigo_reparticion_usuario as cod_reparticion_caratulacion,
    sr.nombre_reparticion as reparticion_caratulacion, 
    sr2.codigo_reparticion as cod_organismo_caratulacion, 
    sr2.nombre_reparticion as organismo_caratulacion, 
    to_char(ee.fecha_creacion,'dd/mm/yyyy') as fecha_caratulacion,
    t.codigo_trata,
    t.descripcion as trata,
    h.sector_usuario_origen as cod_sector_origen,
    h.reparticion_usuario as cod_reparticion_origen,
    h.descripcion_reparticion_origen as reparticion_origen,
    h.codigo_jurisdiccion_origen as cod_organismo_origen,
    sr3.nombre_reparticion as organismo_origen,
    h.codigo_sector_destino as cod_sector_destino,
    h.codigo_reparticion_destino as cod_reparticion_destino,
    h.descripcion_reparticion_destin as reparticion_destino,
    h.codigo_jurisdiccion_destino as cod_organismo_destino,
    sr4.nombre_reparticion as organismo_destino
from 
    ee_ged.historialoperacion h 
    inner join ee_ged.ee_expediente_electronico ee on h.id_expediente = ee.id
    inner join ee_ged.trata t on ee.id_trata = t.id
    inner join track_ged.sade_reparticion sr on ee.codigo_reparticion_usuario = sr.codigo_reparticion 
    inner join track_ged.sade_reparticion sr2 on sr.ministerio = sr2.id_reparticion  
    inner join track_ged.sade_reparticion sr3 on h.codigo_jurisdiccion_origen = sr3.codigo_reparticion
    inner join track_ged.sade_reparticion sr4 on h.codigo_jurisdiccion_destino = sr4.codigo_reparticion
where 
    h.fecha_operacion between
    (case when to_char(sysdate, 'D') = 1 then trunc(sysdate-3) else trunc(sysdate-1) end)
        and  trunc(sysdate) and
    h.tipo_operacion = 'Pase' and
    h.reparticion_usuario = 'DPPSGG' and 
    h.sector_usuario_origen = 'MAYS' and 
    h.codigo_sector_destino != 'MAYS'

union all

select 
    h.id,
    to_char(h.fecha_operacion,'dd/mm/yyyy hh24:mi:ss') as fecha_operacion,
    'ingreso' as movimiento,
    ee.tipo_documento||'-'||ee.anio||'-'||ee.numero||'- -'||ee.codigo_reparticion_actuacion||'-'||ee.codigo_reparticion_usuario as nro_expediente,
    ee.descripcion as descripcion, 
    ee.codigo_reparticion_usuario as cod_reparticion_caratulacion,
    sr.nombre_reparticion as reparticion_caratulacion, 
    sr2.codigo_reparticion as cod_organismo_caratulacion, 
    sr2.nombre_reparticion as organismo_caratulacion, 
    to_char(ee.fecha_creacion,'dd/mm/yyyy') as fecha_caratulacion,
    t.codigo_trata,
    t.descripcion as trata,
    h.sector_usuario_origen as cod_sector_origen,
    h.reparticion_usuario as cod_reparticion_origen,
    h.descripcion_reparticion_origen as reparticion_origen,
    h.codigo_jurisdiccion_origen as cod_organismo_origen,
    sr3.nombre_reparticion as organismo_origen,
    h.codigo_sector_destino as cod_sector_destino,
    h.codigo_reparticion_destino as cod_reparticion_destino,
    h.descripcion_reparticion_destin as reparticion_destino,
    h.codigo_jurisdiccion_destino as cod_organismo_destino,
    sr4.nombre_reparticion as organismo_destino
from 
    ee_ged.historialoperacion h 
    inner join ee_ged.ee_expediente_electronico ee on h.id_expediente = ee.id
    inner join ee_ged.trata t on ee.id_trata = t.id
    inner join track_ged.sade_reparticion sr on ee.codigo_reparticion_usuario = sr.codigo_reparticion 
    inner join track_ged.sade_reparticion sr2 on sr.ministerio = sr2.id_reparticion  
    inner join track_ged.sade_reparticion sr3 on h.codigo_jurisdiccion_origen = sr3.codigo_reparticion
    inner join track_ged.sade_reparticion sr4 on h.codigo_jurisdiccion_destino = sr4.codigo_reparticion
where 
    h.fecha_operacion between
    (case when to_char(sysdate, 'D') = 1 then trunc(sysdate-3) else trunc(sysdate-1) end)
        and  trunc(sysdate) and
    h.tipo_operacion = 'Pase' and
    h.codigo_reparticion_destino = 'DPPSGG' and 
    h.codigo_sector_destino = 'MGEYS' and
    h.sector_usuario_origen != 'MGEYS'
)
order by id desc;