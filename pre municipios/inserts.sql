declare
	hex raw(32767);
	
	cursor c_jbpm4_lob is
		select l.* 
		from gedo_ged.jbpm4_lob l
		inner join gedo_ged.jbpm4_deployment d
		on l.deployment_ = d.dbid_
		fetch first 2 row only;

begin
	
	for r in c_jbpm4_lob loop
		hex := rawtohex(r.blob_value_);
		dbms_output.put_line('buf := hextoraw('''||hex||''');');
		dbms_output.put_line('insert into gedo_ged.jbpm4_lob (dbid_,dbversion_,blob_value_,deployment_,name_) values');
		dbms_output.put_line('('||r.dbid_||','||r.dbversion_||',buf,'||r.deployment_||',to_clob('''||r.name_||'''));');
		dbms_output.put_line(' ');
	end loop;
	
end;


---------------------------------------------


declare
	hex raw(32767);
	cursor c_gedo_tipodocumento_template is
		select * from gedo_ged.gedo_tipodocumento_template
		where id_tipodocumento in (25275,25276,25280,25274,25277,25279);

begin
	for r in c_gedo_tipodocumento_template loop
		hex := rawtohex(r.template);
		dbms_output.put_line('buf := hextoraw('''||hex||''');');
		dbms_output.put_line('insert into gedo_ged.gedo_tipodocumento_template (id_tipodocumento,version,template,descripcion,fecha_creacion,usuario_alta,id_formulario) values');
		dbms_output.put_line('('||r.id_tipodocumento||','||r.version||',buf,'''||r.descripcion||''',to_date('''||to_char(r.fecha_creacion,'yyyy/mm/dd hh24:mi:ss')||''',''yyyy/mm/dd hh24:mi:ss''),'''||r.usuario_alta||''','''||r.id_formulario||''');');
		dbms_output.put_line(' ');
	end loop;
end;