-- Redmine: 3868
-- Descripción: Actualización de filas en tabla ee_ged.ee_expediente_electronico.
-- Autor: [Tu nombre o identificación]
-- Fecha: [Fecha de creación]

SET SERVEROUTPUT ON;
SET DEFINE OFF;

DECLARE
    e_unexpected_rowcount EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_unexpected_rowcount, -20001);
    
    expected_rowcount NUMBER := 1; -- Variable para la cantidad de filas esperadas
    actual_rowcount   NUMBER := 0;
    
BEGIN
    -- Mensaje de inicio del script
    DBMS_OUTPUT.PUT_LINE('*** COMIENZO DE EJECUCION ***');
    
    -- Bloque de actualización
    UPDATE ee_ged.ee_expediente_electronico
    SET estado = 'Guarda Temporal'
    WHERE id = 7737;
    
    -- Obtener cantidad de filas modificadas
    actual_rowcount := actual_rowcount + SQL%ROWCOUNT;
    
    -- Verifica si la cantidad de filas actualizadas es la esperada
    IF actual_rowcount != expected_rowcount THEN
        -- Lanza una excepción si la cantidad de filas actualizadas no es la esperada
        RAISE e_unexpected_rowcount;
    END IF;

    -- Confirmar los cambios
    COMMIT;
    
    -- Mensaje de éxito
    DBMS_OUTPUT.PUT_LINE(actual_rowcount || ' fila(s) actualizada(s)');
    DBMS_OUTPUT.PUT_LINE('*** COMMIT REALIZADO ***');

EXCEPTION
    WHEN e_unexpected_rowcount THEN
        -- Manejo de excepción personalizada
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: La cantidad de filas actualizadas (' || actual_rowcount || ') no coincide con la esperada (' || expected_rowcount || ').');
        DBMS_OUTPUT.PUT_LINE('*** ROLLBACK REALIZADO ***');
    
    WHEN OTHERS THEN
        -- Captura de errores generales
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SUBSTR(SQLERRM, 1, 200));
        DBMS_OUTPUT.PUT_LINE('*** ROLLBACK REALIZADO ***');
END;