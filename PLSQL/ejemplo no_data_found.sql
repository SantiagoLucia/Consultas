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

    -- Seleccionar el registro específico
    SELECT * INTO r_rce_registro 
    FROM rce_ged.rce_registro 
    WHERE id_registro = 7255017;

    -- Actualizar el registro seleccionado
    UPDATE rce_ged.rce_registro 
    SET FECHA_BLOQUEO = sysdate, USUARIO_BLOQUEO = 'GZIEGLER'
    WHERE id_registro = r_rce_registro.id_registro;

    -- Contar los registros modificados
    v_registros_modificados := v_registros_modificados + SQL%ROWCOUNT;

    -- Verificar si el número de registros modificados es el esperado
    IF (v_registros_modificados != v_numero_esperado) THEN
        RAISE REG_ACT_EXCEPTION;
    END IF;

    -- Confirmar las transacciones
    COMMIT;
    DBMS_OUTPUT.put_line ('Se modificaron ' || v_registros_modificados || ' registros');
    DBMS_OUTPUT.put_line ('*** COMMIT REALIZADO ***');

EXCEPTION
    -- Manejar la excepción cuando no se encuentra el registro
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.put_line ('SE REALIZA ROLLBACK DE TRANSACCION:');
        DBMS_OUTPUT.put_line ('NO EXISTE EL REGISTRO');

    -- Manejar la excepción cuando el número de registros modificados no coincide con el esperado
    WHEN REG_ACT_EXCEPTION THEN
        ROLLBACK;
        DBMS_OUTPUT.put_line ('SE REALIZA ROLLBACK DE TRANSACCION:');
        DBMS_OUTPUT.put_line ('LA CANTIDAD DE REGISTROS A ACTUALIZAR NO COINCIDE CON LA ESPERADA');

    -- Manejar cualquier otra excepción
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.put_line ('SE REALIZA ROLLBACK DE TRANSACCION:');
        DBMS_OUTPUT.put_line ('ERROR: ' || SUBSTR(SQLERRM, 1, 200));
END;
/
