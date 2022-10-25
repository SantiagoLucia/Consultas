SET SERVEROUTPUT ON
SET DEFINE OFF

DECLARE
    l_registros_modificados NUMBER(30);
    l_numero_esperado NUMBER(30);
    e_cant_modificada EXCEPTION;

    TYPE t_registros_type IS TABLE OF NUMBER(10);
    t_registros t_registros_type;

BEGIN
    l_registros_modificados := 0;
    
    SELECT r.id BULK COLLECT INTO t_registros
    FROM rlm_ged.registros r WHERE reparticion_asignada = 'TESTGDEBA';
    l_numero_esperado := t_registros.COUNT;
    
	DBMS_OUTPUT.PUT_LINE('***COMIENZA SCRIPT***');
	DBMS_OUTPUT.PUT_LINE('SE ESPERAN MODIFICAR ' || l_numero_esperado || ' REGISTROS');    

-- BLOQUE UPDATE

    FOR c_id IN 1..l_numero_esperado 
    LOOP
    /*
        UPDATE rlm_ged.registros
        SET reparticion_asignada = 'TESTGDEBA'
        WHERE id = t_registros(c_id);
        l_registros_modificados := l_registros_modificados + SQL%ROWCOUNT;
    */    
        l_registros_modificados := l_registros_modificados + 1;
    
    END LOOP;    

-- BLOQUE UPDATE END

	IF (l_registros_modificados != l_numero_esperado) THEN
		RAISE e_cant_modificada;
	END IF;

--  COMMIT;
    DBMS_OUTPUT.PUT_LINE('SE MODIFICARON ' || l_registros_modificados || ' REGISTROS');
    DBMS_OUTPUT.PUT_LINE('***COMMIT REALIZADO***');

    EXCEPTION
        WHEN e_cant_modificada THEN
        BEGIN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('SE REALIZA ROLLBACK DE TRANSACCION:');
            DBMS_OUTPUT.PUT_LINE('LA CANTIDAD DE REGISTROS MODIFICADOS NO COINCIDE CON LA ESPERADA ' || l_registros_modificados);
        END;

        WHEN OTHERS THEN
        BEGIN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('SE REALIZA ROLLBACK DE TRANSACCION: ');
            DBMS_OUTPUT.PUT_LINE(' ' || SUBSTR (SQLERRM,1, 200));
        END;
END;