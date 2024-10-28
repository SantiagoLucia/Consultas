CREATE OR REPLACE PROCEDURE Procesar_Empleados(p_departamento_id IN NUMBER) IS
    -- Declaración del cursor con un parámetro
    CURSOR c_empleados IS
        SELECT empleado_id, nombre, salario
        FROM empleados
        WHERE departamento_id = p_departamento_id;
BEGIN
    -- Bucle para recorrer cada registro en el cursor
    FOR empleado IN c_empleados LOOP
        -- Accede a los valores de cada columna como empleado.empleado_id, empleado.nombre, etc.
        DBMS_OUTPUT.PUT_LINE('Empleado ID: ' || empleado.empleado_id || ', Nombre: ' || empleado.nombre || ', Salario: ' || empleado.salario);

        -- Ejemplo: Incrementar el salario de cada empleado en un 10%
        UPDATE empleados
        SET salario = salario * 1.1
        WHERE empleado_id = empleado.empleado_id;
    END LOOP;

    -- Confirmar los cambios
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salarios actualizados para el departamento ' || p_departamento_id);

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END Procesar_Empleados;
