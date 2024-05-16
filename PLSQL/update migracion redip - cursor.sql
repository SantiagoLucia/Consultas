set serveroutput on 
set define off

declare

-- CURSOR PARA OBTENER REPARTICIONES --
cursor c_reparticiones is
	select 
	sr.codigo_reparticion as codigo_viejo,
	mt.destino_reparticion as codigo_nuevo
	from (
		select distinct 
		regexp_substr(groupid_,'[^.]+') as codigo_repa
		from rce_ged.jbpm4_participation
	) aux
	
	inner join track_ged.sade_reparticion sr 
		on sr.codigo_reparticion = aux.codigo_repa
	inner join eu_ged.mig_tarea mt
		on mt.origen_reparticion = sr.codigo_reparticion 
	where 
	sr.estado_registro = 0
	and sr.vigencia_hasta > to_date('01/01/2024','dd/mm/yyyy')
	and mt.tipo_migracion = 'MIGRACION_REPARTICION'
	and mt.estado = 'FINALIZADA'
	and mt.modulo = 'EU';

-- PROCEDIMIENTO PARA ACTUALIZAR BUZONES --
procedure actualizar_buzon(
	p_cod_reparticion_origen in varchar2,
	p_cod_reparticion_destino in varchar2) 
is l_registros_modificados number := 0;
begin
	dbms_output.put_line('ACTUALIZANDO: '||p_cod_reparticion_origen||' -> '
         ||p_cod_reparticion_destino);
	
	-- inicio bloque update: jbpm4_participation
	update rce_ged.jbpm4_participation
	set groupid_ = replace(groupid_, p_cod_reparticion_origen,
									 p_cod_reparticion_destino)
	where groupid_ like p_cod_reparticion_origen||'.%';
	l_registros_modificados := l_registros_modificados + sql%rowcount;
	-- fin bloque update

	-- inicio bloque update: jbpm4_variable
	update rce_ged.jbpm4_variable
	set string_value_ = replace(string_value_, p_cod_reparticion_origen,
									 p_cod_reparticion_destino)
	where key_ = 'grupoAsignado' and
	string_value_ like p_cod_reparticion_origen||'.%';
	l_registros_modificados := l_registros_modificados + sql%rowcount;
	-- fin bloque update

	commit; 
	dbms_output.put_line('Se modificaron '||l_registros_modificados||' registros');
	dbms_output.put_line('COMMIT REALIZADO');
	dbms_output.new_line;

exception		
	when others then
	begin
		rollback;
		dbms_output.put_line('SE REALIZA ROLLBACK DE TRANSACCION: ');
		dbms_output.put_line('    ' || substr(sqlerrm,1, 200));
		dbms_output.new_line;
	end;   
end actualizar_buzon;


-- MODULO PRINCIPAL --
begin
	dbms_output.put_line('***COMIENZA SCRIPT***');
	dbms_output.new_line;

	for r_reparticion in c_reparticiones loop
		actualizar_buzon(r_reparticion.codigo_viejo, r_reparticion.codigo_nuevo);		
	end loop;

	dbms_output.put_line('***SCRIPT FINALIZADO***');

exception		
	when others then
	begin
		rollback;
		dbms_output.put_line('SE REALIZA ROLLBACK DE TRANSACCION: ');
		dbms_output.put_line('    ' || substr(sqlerrm,1, 200));
	end;
end;

