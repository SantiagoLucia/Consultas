DECLARE
	TYPE empleado IS RECORD (
        apellido_nombre VARCHAR2(100),
        mail VARCHAR2(100),
        cargo VARCHAR2(100)
    ); 
    -- Definimos el tipo de tabla para almacenar los registros
    TYPE t_empleado_tab IS TABLE OF empleado;
    v_empleados t_empleado_tab; -- Colección para almacenar los empleados
    v_limit NUMBER := 100; -- Número de filas a recuperar en cada iteración
    v_total NUMBER; -- Variable para contar el total de empleados procesados
    CURSOR c_empleados IS 
	    SELECT
	    	DU.APELLIDO_NOMBRE APELLIDO_NOMBRE,
		    DU.MAIL,
		    C.CARGO
		FROM 
		    TRACK_GED.SADE_SECTOR_USUARIO SU 
		    LEFT JOIN TRACK_GED.SADE_SECTOR_INTERNO SSI ON (SU.ID_SECTOR_INTERNO = SSI.ID_SECTOR_INTERNO) 
		    LEFT JOIN TRACK_GED.SADE_REPARTICION SR ON (SSI.CODIGO_REPARTICION = SR.ID_REPARTICION) 
		    LEFT JOIN TRACK_GED.SADE_REPARTICION SR1 ON (SR.MINISTERIO = SR1.ID_REPARTICION)
		    LEFT JOIN CO_GED.DATOS_USUARIO DU ON (DU.USUARIO = SU.NOMBRE_USUARIO)
			LEFT JOIN CO_GED.CARGOS C ON (DU.CARGO = C.ID) 
		WHERE SR1.CODIGO_REPARTICION = 'MGGP'
		AND SU.ESTADO_REGISTRO = 1; -- Cursor explícito
		
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
            DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_empleados(i).apellido_nombre || 
                                 ', Mail: ' || v_empleados(i).mail || 
                                 ', Cargo: ' || v_empleados(i).cargo);
        END LOOP;

        -- Incrementamos el contador total de empleados procesados
        v_total := v_total + v_empleados.COUNT;

        -- Limpiamos la colección para la siguiente iteración
        v_empleados.DELETE;
    END LOOP;
    CLOSE c_empleados;

    DBMS_OUTPUT.PUT_LINE('Total de empleados procesados: ' || v_total);
END;
