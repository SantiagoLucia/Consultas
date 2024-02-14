set serveroutput on
set define off

declare

-- TABLA CON VALORES A ACTUALIZAR --
type rec_codigos is record (
	cod_origen varchar2(100),
	cod_destino varchar2(100)
);

type table_codigos is table of rec_codigos;

t_codigos table_codigos;

-- FUNCION PARA INICIALIZAR RECORD
function init_rec(cod_origen varchar2, cod_destino varchar2)
return rec_codigos
is r rec_codigos;
begin
	r.cod_origen := cod_origen;
	r.cod_destino := cod_destino;
	return r;
end init_rec;

-- PROCEDIMIENTO PARA ACTUALIZAR BUZONES --
procedure actualizar_buzones(
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
end actualizar_buzones;


-- MODULO PRINCIPAL --	
begin		
	dbms_output.put_line('***COMIENZA SCRIPT***');
	dbms_output.new_line;
   
	-- codigos de reparticiones a actualizar --
	t_codigos := table_codigos(
		init_rec('DL7664MGGP','DL7664JAGGP'),
		init_rec('DL7665MGGP','DL7665JAGGP'),
		init_rec('DL2609MGGP','DL2609JAGGP')
	);
	
	for i in 1..t_codigos.count
	loop
		actualizar_buzones(
			t_codigos(i).cod_origen, 
			t_codigos(i).cod_destino
			);
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