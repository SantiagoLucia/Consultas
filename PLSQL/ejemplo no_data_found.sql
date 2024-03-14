SET SERVEROUTPUT ON
SET DEFINE OFF

DECLARE
    v_registros_modificados   NUMBER (30) := 0;
    v_numero_esperado         NUMBER (30) := 1;
    r_rce_registro            rce_ged.rce_registro%ROWTYPE;
    REG_ACT_EXCEPTION         EXCEPTION;

BEGIN
   DBMS_OUTPUT.put_line ('*** COMIENZA SCRIPT ***');
   DBMS_OUTPUT.put_line ('Se espera modificar ' || v_numero_esperado || ' registros');

   SELECT * INTO r_rce_registro FROM rce_ged.rce_registro WHERE id_registro = 7255017;

   UPDATE rce_ged.rce_registro 
   SET FECHA_BLOQUEO = sysdate, USUARIO_BLOQUEO = 'GZIEGLER'
   WHERE id_registro = r_rce_registro.id_registro;

   v_registros_modificados := v_registros_modificados + SQL%ROWCOUNT;

   IF (v_registros_modificados != v_numero_esperado) THEN
      RAISE REG_ACT_EXCEPTION;
   END IF;

   ROLLBACK;
   DBMS_OUTPUT.put_line ('Se modificaron ' || v_registros_modificados || ' registros');
   DBMS_OUTPUT.put_line ('*** COMMIT REALIZADO ***');


EXCEPTION

   WHEN NO_DATA_FOUND THEN
      BEGIN
         ROLLBACK;
         DBMS_OUTPUT.put_line ('SE REALIZA ROLLBACK DE TRANSACCION:');
         DBMS_OUTPUT.put_line ('NO EXISTE EL REGISTRO');
      END;
      
   WHEN REG_ACT_EXCEPTION THEN
      BEGIN
         ROLLBACK;
         DBMS_OUTPUT.put_line ('SE REALIZA ROLLBACK DE TRANSACCION:');
         DBMS_OUTPUT.put_line ('LA CANTIDAD DE REGISTROS A ACTUALIZAR NO COINCIDE CON LA ESPERADA');
      END;
    
   WHEN OTHERS THEN
      BEGIN
         ROLLBACK;
         DBMS_OUTPUT.put_line ('SE REALIZA ROLLBACK DE TRANSACCION');
      END;
END;

