SET SERVEROUTPUT ON
SET DEFINE OFF

DECLARE

	v_registros_modificados NUMBER(30) := 0;
	v_tipodoc_origen NUMBER(10) := 23383; -- TESTL
	v_tipodoc_destino NUMBER(10) := 22887; -- TEST
   
	CURSOR c_tipodoc IS
	   SELECT * FROM gedo_ged.gedo_tipodocumento_reparticion 
	   WHERE tipodocumento = v_tipodoc_origen;

	PROCEDURE UPDATE_INSERT_TIPODOCUMENTO (
	   p_registros_modificados IN OUT NUMBER,
	   p_codigoreparticion VARCHAR2,
	   p_permisoiniciar CHAR,
	   p_permisofirmar CHAR,
	   p_estado CHAR,
	   p_nombre_reparticion VARCHAR2
	) IS
	   l_id NUMBER;   

	BEGIN

	   SELECT id INTO l_id FROM gedo_ged.gedo_tipodocumento_reparticion
		  WHERE tipodocumento = v_tipodoc_destino AND
		  codigoreparticion = p_codigoreparticion;
	   
	   UPDATE gedo_ged.gedo_tipodocumento_reparticion SET
		  permisoiniciar = p_permisoiniciar,
		  permisofirmar = p_permisofirmar,
		  estado = p_estado
	   WHERE id = l_id;
	  
	   p_registros_modificados := p_registros_modificados + SQL%ROWCOUNT;
	   
	   
	EXCEPTION

	   WHEN NO_DATA_FOUND THEN
		  BEGIN
			 INSERT INTO gedo_ged.gedo_tipodocumento_reparticion
				(id, codigoreparticion, permisoiniciar, permisofirmar, estado,
				   tipodocumento, nombre_reparticion) VALUES
				(gedo_ged.gedo_tipodocumento_rep_seq.NEXTVAL, p_codigoreparticion,
				   p_permisoiniciar, p_permisofirmar, p_estado, v_tipodoc_destino, 
				   p_nombre_reparticion);
			 
			 p_registros_modificados := p_registros_modificados + SQL%ROWCOUNT;
		  
		  END;
	   
	END UPDATE_INSERT_TIPODOCUMENTO;   


BEGIN
   DBMS_OUTPUT.put_line('***COMIENZA SCRIPT***');
   
   FOR r_tipodoc IN c_tipodoc LOOP
      UPDATE_INSERT_TIPODOCUMENTO(
         v_registros_modificados,
         r_tipodoc.codigoreparticion,
         r_tipodoc.permisoiniciar,
         r_tipodoc.permisofirmar,
         r_tipodoc.estado,
         r_tipodoc.nombre_reparticion
      );
   END LOOP;

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