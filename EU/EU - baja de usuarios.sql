SET serveroutput on
SET define off

DECLARE
	v_registros_modificados NUMBER (30);
	v_numero_esperado       NUMBER (30);
	reg_act_exception EXCEPTION;

BEGIN
	v_numero_esperado := 1;
	v_registros_modificados := 0;
	dbms_output.put_line ('***COMIENZA SCRIPT***');
	dbms_output.put_line ('Se esperan modificar '||v_numero_esperado||' registros');
 
 -- bloque update (SI ESTADO_REGISTRO ES 1)
	UPDATE track_ged.sade_sector_usuario
	SET
		estado_registro = 0
	WHERE
		nombre_usuario = 'CSTROMEYER';

	v_registros_modificados := v_registros_modificados + sql%rowcount;
 -- fin bloque update

 -- bloque delete
	DELETE FROM co_ged.datos_usuario
	WHERE
		usuario = 'CSTROMEYER';

	v_registros_modificados := v_registros_modificados + sql%rowcount;
 -- fin bloque delete

	IF (v_registros_modificados != v_numero_esperado) THEN
		RAISE reg_act_exception;
	END IF;

	COMMIT;

	dbms_output.put_line ('Se modificaron '||v_registros_modificados||' registros');
	dbms_output.put_line ('***COMMIT REALIZADO***');

EXCEPTION
	WHEN reg_act_exception THEN
		BEGIN 
			ROLLBACK;
			dbms_output.put_line ('SE REALIZA ROLLBACK DE TRANSACCIÓN: ');
			dbms_output.put_line ('LA CANTIDAD DE REGISTROS MODIFICADOS NO COINCIDE CON LA ESPERADA '
				|| v_registros_modificados);
		END;

	WHEN OTHERS THEN
		BEGIN
			ROLLBACK;
			dbms_output.put_line ('SE REALIZA ROLLBACK DE TRANSACCIÓN: ');
			dbms_output.put_line ('    '
				|| substr (sqlerrm, 1, 200));
		END;

END;