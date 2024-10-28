DECLARE
    -- Definimos el tipo de tabla para almacenar los registros
    TYPE t_empleado_tab IS TABLE OF empleados%ROWTYPE;
    v_empleados t_empleado_tab; -- Colección para almacenar los empleados
    v_limit NUMBER := 100; -- Número de filas a recuperar en cada iteración
    v_total NUMBER; -- Variable para contar el total de empleados procesados
    CURSOR c_empleados IS SELECT empleado_id, nombre, salario FROM empleados; -- Cursor explícito
BEGIN
    -- Inicializamos el contador
    v_total := 0;

    -- Abrimos el cursor para la consulta
    OPEN c_empleados;
    LOOP
        -- Cargamos filas en la colección usando BULK COLLECT con LIMIT
        FETCH c_empleados BULK COLLECT INTO v_empleados LIMIT v_limit;
        
        -- Si no se recuperaron filas, salimos del bucle
        EXIT WHEN v_empleados.COUNT = 0;

        -- Procesamos cada fila recuperada
        FOR i IN 1..v_empleados.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Empleado ID: ' || v_empleados(i).empleado_id || 
                                 ', Nombre: ' || v_empleados(i).nombre || 
                                 ', Salario: ' || v_empleados(i).salario);
        END LOOP;

        -- Incrementamos el contador total de empleados procesados
        v_total := v_total + v_empleados.COUNT;

        -- Limpiamos la colección para la siguiente iteración
        v_empleados.DELETE;
    END LOOP;
    CLOSE c_empleados;

    DBMS_OUTPUT.PUT_LINE('Total de empleados procesados: ' || v_total);
END;
/
