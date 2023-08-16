SET SERVEROUTPUT ON
SET DEFINE OFF

DECLARE
	v_registros_modificados NUMBER (30);
	v_numero_esperado NUMBER (30);
	REG_ACT_EXCEPTION EXCEPTION;
	
BEGIN

	v_numero_esperado := 7;
	v_registros_modificados := 0;
		
	DBMS_OUTPUT.put_line ('***COMIENZA SCRIPT***');
	DBMS_OUTPUT.put_line ('Se esperan modificar '||v_numero_esperado ||' registros');

-- bloque update
		
	UPDATE RCE_GED.SYS_CIRCUNSCRIPCION SET NOMBRE = 'Servicio Penitenciario y Patronato 3301'
	WHERE NOMBRE = 'La Plata 3301';
	v_registros_modificados := v_registros_modificados + SQL%ROWCOUNT;

-- bloque update

	IF (v_registros_modificados != v_numero_esperado) THEN
		RAISE REG_ACT_EXCEPTION;
	END IF;

   COMMIT;
   DBMS_OUTPUT.put_line ('Se modificaron '||v_registros_modificados||' registros');
   DBMS_OUTPUT.put_line ('***COMMIT REALIZADO***');
EXCEPTION
	WHEN REG_ACT_EXCEPTION 
	THEN
		BEGIN
			ROLLBACK;
      DBMS_OUTPUT.put_line ('SE REALIZA ROLLBACK DE TRANSACCIÓN: ');
			DBMS_OUTPUT.put_line ('LA CANTIDAD DE REGISTROS MODIFICADOS NO COINCIDE CON LA ESPERADA ' || v_registros_modificados);
		END;
		
   WHEN OTHERS
   THEN
		BEGIN
			ROLLBACK;
			DBMS_OUTPUT.put_line ('SE REALIZA ROLLBACK DE TRANSACCIÓN: ');
			DBMS_OUTPUT.put_line ('    ' || SUBSTR (SQLERRM,1, 200));
		END;
END;
/
