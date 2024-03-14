SET SERVEROUTPUT ON
SET DEFINE OFF

DECLARE

	v_registros_modificados NUMBER(30) := 0;
	v_tipodoc_origen NUMBER(10) := 24791; -- DECRB
   
BEGIN

   DBMS_OUTPUT.put_line('***COMIENZA SCRIPT***');

   UPDATE gedo_ged.gedo_tipodocumento_reparticion 
   SET permisoiniciar = 0, permisofirmar = 0
   WHERE tipodocumento = v_tipodoc_origen;   

   v_registros_modificados := v_registros_modificados + SQL%ROWCOUNT;

   COMMIT;
   
   DBMS_OUTPUT.put_line('LA CANTIDAD DE REGISTROS MODIFICADOS ES: '||v_registros_modificados);
   
EXCEPTION
   WHEN OTHERS THEN
		BEGIN
			ROLLBACK;
			DBMS_OUTPUT.put_line ('SE REALIZA ROLLBACK DE TRANSACCION: ');
			DBMS_OUTPUT.put_line ('    ' || SUBSTR (SQLERRM,1, 200));
		END;
END;