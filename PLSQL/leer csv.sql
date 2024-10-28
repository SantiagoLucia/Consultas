DECLARE
    archivo UTL_FILE.FILE_TYPE;
    linea VARCHAR2(1000);
    v_empleado_id NUMBER;
    v_nombre VARCHAR2(100);
    v_salario NUMBER;

    -- Función para dividir una cadena en partes usando un delimitador
    FUNCTION dividir_cadena(cadena VARCHAR2, delimitador VARCHAR2, posicion NUMBER) RETURN VARCHAR2 IS
        v_posicion_start NUMBER;
        v_posicion_end NUMBER;
    BEGIN
        v_posicion_start := INSTR(cadena, delimitador, 1, posicion - 1) + 1;
        v_posicion_end := INSTR(cadena, delimitador, 1, posicion);
        
        IF v_posicion_start > 0 THEN
            IF v_posicion_end > 0 THEN
                RETURN SUBSTR(cadena, v_posicion_start, v_posicion_end - v_posicion_start);
            ELSE
                RETURN SUBSTR(cadena, v_posicion_start);
            END IF;
        ELSE
            RETURN NULL;
        END IF;
    END dividir_cadena;

BEGIN
    -- Abrir el archivo en modo lectura
    archivo := UTL_FILE.FOPEN('MI_DIRECTORIO', 'datos.csv', 'R');

    -- Leer cada línea del archivo y procesarla
    LOOP
        BEGIN
            -- Leer una línea
            UTL_FILE.GET_LINE(archivo, linea);

            -- Dividir la línea en columnas usando comas como delimitador
            v_empleado_id := TO_NUMBER(dividir_cadena(linea, ',', 1));
            v_nombre := dividir_cadena(linea, ',', 2);
            v_salario := TO_NUMBER(dividir_cadena(linea, ',', 3));

            -- Procesar los datos (ejemplo: actualizar la tabla empleados)
            BEGIN
                UPDATE empleados
                SET nombre = v_nombre,
                    salario = v_salario
                WHERE empleado_id = v_empleado_id;
                
                IF SQL%ROWCOUNT = 0 THEN
                    -- Si no existe, insertar el registro
                    INSERT INTO empleados (empleado_id, nombre, salario)
                    VALUES (v_empleado_id, v_nombre, v_salario);
                END IF;

                DBMS_OUTPUT.PUT_LINE('Procesado empleado ID: ' || v_empleado_id || ', Nombre: ' || v_nombre || ', Salario: ' || v_salario);
            EXCEPTION
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE('Error al procesar empleado ID: ' || v_empleado_id || ' - ' || SQLERRM);
            END;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                EXIT;  -- Sale del bucle cuando no hay más líneas
        END;
    END LOOP;

    -- Cerrar el archivo
    UTL_FILE.FCLOSE(archivo);

    -- Confirmar los cambios
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Archivo CSV procesado exitosamente.');

EXCEPTION
    WHEN UTL_FILE.INVALID_PATH THEN
        DBMS_OUTPUT.PUT_LINE('Error: Ruta del archivo no válida.');
    WHEN UTL_FILE.READ_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: No se pudo leer el archivo.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error desconocido: ' || SQLERRM);
        UTL_FILE.FCLOSE(archivo);
END;
