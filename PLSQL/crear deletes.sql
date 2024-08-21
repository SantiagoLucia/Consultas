DECLARE
    -- Parámetros para el esquema, la tabla y la condición WHERE
    v_schema_name VARCHAR2(30) := 'TRACK_GED';  -- Reemplaza con el esquema deseado
    v_table_name VARCHAR2(30) := 'SADE_REPARTICION';  -- Reemplaza con la tabla deseada
    v_where_condition VARCHAR2(4000) := 'CODIGO_REPARTICION = ''TESTGDEBA''';  -- Reemplaza con la condición del WHERE deseada

    -- Estructura para almacenar las tablas procesadas
    TYPE processed_tables_type IS TABLE OF VARCHAR2(100) INDEX BY VARCHAR2(100);
    v_processed_tables processed_tables_type;

    -- Función para verificar si existen filas que coinciden con la condición WHERE
    FUNCTION rows_exist(p_schema_name IN VARCHAR2, p_table_name IN VARCHAR2, p_where_condition IN VARCHAR2) RETURN BOOLEAN IS
        v_count NUMBER;
    BEGIN
        EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || p_schema_name || '.' || p_table_name || ' WHERE ' || p_where_condition INTO v_count;
        RETURN v_count > 0;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN FALSE; -- Manejo de errores o excepciones según sea necesario
    END rows_exist;

    -- Procedimiento para generar los comandos DELETE recursivamente
    PROCEDURE generate_delete_statements(p_schema_name IN VARCHAR2, p_table_name IN VARCHAR2, p_where_condition IN VARCHAR2) IS
        CURSOR c_child_tables(p_owner VARCHAR2, p_table VARCHAR2) IS
            SELECT 
                acc.table_name, 
                acc.column_name,
                acc.owner
            FROM 
                all_constraints ac
                JOIN all_cons_columns acc ON ac.constraint_name = acc.constraint_name AND ac.owner = acc.owner
            WHERE 
                ac.r_constraint_name IN (SELECT constraint_name 
                                         FROM all_cons_columns 
                                         WHERE table_name = p_table 
                                         AND owner = p_owner)
                AND ac.constraint_type = 'R';

        v_sql VARCHAR2(4000);
        v_table_name VARCHAR2(30);
        v_column_name VARCHAR2(30);
        v_owner VARCHAR2(30);
        v_rows_exist BOOLEAN;
    BEGIN
        FOR rec IN c_child_tables(p_schema_name, p_table_name) LOOP
            v_table_name := rec.table_name;
            v_column_name := rec.column_name;
            v_owner := rec.owner;

            v_rows_exist := rows_exist(p_schema_name, p_table_name, p_where_condition);

            IF v_rows_exist THEN
                v_sql := 'DELETE FROM ' || v_owner || '.' || v_table_name || ' WHERE ' || v_column_name || ' IN (SELECT ' || v_column_name || ' FROM ' || p_schema_name || '.' || p_table_name || ' WHERE ' || p_where_condition || ')';
                DBMS_OUTPUT.PUT_LINE(v_sql);
            END IF;

            -- Verifica si la tabla ya ha sido procesada para evitar bucles infinitos
            IF NOT v_processed_tables.EXISTS(v_owner || '.' || v_table_name) THEN
                v_processed_tables(v_owner || '.' || v_table_name) := 'Y';

                -- Llama recursivamente a este procedimiento para las tablas hijas
                generate_delete_statements(v_owner, v_table_name, p_where_condition);
            END IF;
        END LOOP;
    END generate_delete_statements;

BEGIN
    -- Inicializa la estructura de tablas procesadas
    v_processed_tables.DELETE;

    -- Procesa las claves foráneas para la tabla inicial
    FOR rec IN (SELECT 
                    ac.constraint_name, 
                    acc.table_name child_table, 
                    acc.column_name child_column, 
                    acc.owner child_owner, 
                    acp.table_name parent_table, 
                    acp.column_name parent_column,
                    acp.owner parent_owner
                FROM 
                    all_constraints ac
                    JOIN all_cons_columns acc ON ac.constraint_name = acc.constraint_name AND ac.owner = acc.owner
                    JOIN all_cons_columns acp ON ac.r_constraint_name = acp.constraint_name AND ac.r_owner = acp.owner
                WHERE 
                    ac.constraint_type = 'R'
                    AND acp.table_name = v_table_name
                    AND acp.owner = v_schema_name
                ORDER BY 
                    ac.constraint_name) LOOP
        DECLARE
            v_sql VARCHAR2(4000);
            v_rows_exist BOOLEAN;
        BEGIN
            v_rows_exist := rows_exist(v_schema_name, v_table_name, v_where_condition);

            IF v_rows_exist THEN
                v_sql := 'DELETE FROM ' || rec.child_owner || '.' || rec.child_table || ' WHERE ' || rec.child_column || ' IN (SELECT ' || rec.child_column || ' FROM ' || v_schema_name || '.' || v_table_name || ' WHERE ' || v_where_condition || ')';
                DBMS_OUTPUT.PUT_LINE(v_sql);
            END IF;

            -- Marca la tabla como procesada
            v_processed_tables(rec.child_owner || '.' || rec.child_table) := 'Y';

            -- Genera los comandos DELETE para las tablas hijas
            generate_delete_statements(rec.child_owner, rec.child_table, v_where_condition);
        END;
    END LOOP;
END;
