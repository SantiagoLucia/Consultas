-- ingresos ministerio caratulador trata
select
	to_char(sysdate-1,'dd/mm/yyyy') periodo,
	sr2.codigo_reparticion as cod_ministerio_caratulacion,
	sr2.nombre_reparticion as ministerio_caratulacion,
	aux.codigo_reparticion_usuario as cod_reparticion_caratulacion,
	sr.nombre_reparticion as reparticion_caratulacion,
	aux.codigo_trata,
	t.descripcion as trata,
	aux.cantidad as cantidad_egresos
from (
	select
		ee.codigo_reparticion_usuario,
		t.codigo_trata,
		count(*) as cantidad
	from (	
		select distinct
		h.id_expediente
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
	group by ee.codigo_reparticion_usuario, t.codigo_trata 
) aux
inner join ee_ged.trata t on aux.codigo_trata = t.codigo_trata
inner join track_ged.sade_reparticion sr on aux.codigo_reparticion_usuario = sr.codigo_reparticion 
inner join track_ged.sade_reparticion sr2 on sr.ministerio = sr2.id_reparticion  