-- ingresos ministerio origen trata
select
	to_char(sysdate-1,'dd/mm/yyyy') periodo,
	aux.codigo_jurisdiccion_origen as cod_ministerio_origen,
	sr2.nombre_reparticion as ministerio_origen,
	aux.reparticion_usuario as cod_reparticion_origen,
	sr1.nombre_reparticion as reparticion_origen,
	aux.sector_usuario_origen as cod_sector_origen,	
	aux.codigo_trata,
	t.descripcion as trata,
	aux.cantidad as cantidad_ingresos
from (
	select
		aux.codigo_jurisdiccion_origen,
		aux.reparticion_usuario,
		aux.sector_usuario_origen, 
		t.codigo_trata,
		count(*) as cantidad
	from (	
		select distinct
		h.id_expediente,
		h.codigo_jurisdiccion_origen,
		h.reparticion_usuario,
		h.sector_usuario_origen
		from ee_ged.historialoperacion h
		where
		h.fecha_operacion between
		    (case when to_char(sysdate, 'D') = 1 then trunc(sysdate-3) else trunc(sysdate-1) end)
	    and  trunc(sysdate)
	and h.tipo_operacion = 'Pase'
	and h.codigo_jurisdiccion_origen != 'SGG'
	and h.codigo_jurisdiccion_destino = 'SGG'
	) aux
	inner join ee_ged.ee_expediente_electronico ee on aux.id_expediente = ee.id
	inner join ee_ged.trata t on ee.id_trata = t.id 
	group by 
	aux.codigo_jurisdiccion_origen,
	aux.reparticion_usuario,
	aux.sector_usuario_origen,
	t.codigo_trata
) aux
inner join ee_ged.trata t on aux.codigo_trata = t.codigo_trata
inner join track_ged.sade_reparticion sr1 on aux.reparticion_usuario = sr1.codigo_reparticion 
inner join track_ged.sade_reparticion sr2  on aux.codigo_jurisdiccion_origen = sr2.codigo_reparticion 