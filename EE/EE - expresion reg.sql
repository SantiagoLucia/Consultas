SELECT 
	CASE WHEN expediente IS NOT NULL THEN
	REGEXP_REPLACE(
		expediente, 
		'(EX)([0-9]{4})([0-9]{1,8})(GDEBA)(-.+)', 
        '\1-\2-\3- -\4\5'
    ) END AS nro_expediente,
FROM 
	ee_ged.historialoperacion
WHERE 
	FECHA_OPERACION > TRUNC(SYSDATE);
	
/*	
Explicación:

    (EX): Captura el prefijo EX.
    ([0-9]{4}): Captura los 4 dígitos que siguen a EX (el año).
    ([0-9]{1,8}): Captura el número que sigue al año, que puede tener entre 1 y 8 dígitos.
    (GDEBA): Captura la cadena GDEBA.
    (-.+): Captura el resto de la cadena que comienza con - y contiene el código variable.

REGEXP_REPLACE:

    Cadena de entrada: 'EX202425853766GDEBA-DPAJYCDGCYE'
    Expresión regular: La expresión (EX)([0-9]{4})([0-9]{1,8})(GDEBA)(-.+) captura las diferentes partes de la cadena.
    Cadena de reemplazo: La cadena \1-\2-\3- -\4\5 utiliza las partes capturadas y las organiza con los guiones y espacios necesarios.	
*/