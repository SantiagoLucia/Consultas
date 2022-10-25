-- REGISTROS INICIADOS POR DPTMJGM
SELECT
REG.ID,
REG.LETRA||'-'||REG.ANIO||'-'||REG.NUMERO||'-'||REG.REPARTICION_ACTUACION||'-'||REG.REPARTICION_USUARIO AS NUMERO_REGISTRO,
REG.REPARTICION_ASIGNADA,
REG.ESTADO,
ER.CODIGOEE AS EXPEDIENTE,
ER.CUIL,
TR.CODIGO AS TIPO_REGISTRO,
TR.DESCRIPCION AS DESC_TIPO_REGISTRO,
TR.TIPO_DOC_FC,
REG.FECHA_ALTA,
REG.FECHA_REGISTRACION,
REG.FECHA_MODIFICACION,
REG.USUARIO_MODIFICACION,
REG.FORM_CODIGO,
REG.CODIGO_TRATA
FROM 
RLM_GED.REGISTROS REG
INNER JOIN RLM_GED.SIS_TIPO_REGISTRO TR ON REG.TIPO_REGISTRO = TR.ID_TIPO_REGISTRO
LEFT JOIN RLM_GED.RLM_EXPEDIENTE_REGISTRO ER ON REG.ID = ER.FK_REGISTRO 
WHERE 
REG.REPARTICION_USUARIO = 'DPTMJGM';

-- PERMISO CONSULTA
SELECT 
RC.REPARTICION,
TR.CODIGO AS TIPO_REGISTRO,
TR.DESCRIPCION AS DESC_TIPO_REGISTRO
FROM 
RLM_GED.RLM_REPARTICION_CONSULTA RC
INNER JOIN RLM_GED.SIS_TIPO_REGISTRO TR ON RC.FK_TIPO_REGISTRO = TR.ID_TIPO_REGISTRO
WHERE
REPARTICION = 'DPTMJGM';

-- PERMISO HABILITACION
SELECT 
RH.REPARTICION,
TR.CODIGO AS TIPO_REGISTRO,
TR.DESCRIPCION AS DESC_TIPO_REGISTRO
FROM 
RLM_GED.RLM_REPARTICION_HABILITADA RH
INNER JOIN RLM_GED.SIS_TIPO_REGISTRO TR ON RH.FK_TIPO_REGISTRO = TR.ID_TIPO_REGISTRO
WHERE
REPARTICION = 'DPTMJGM';

-- PERMISO INICIAR
SELECT 
RI.REPARTICION,
TR.CODIGO AS TIPO_REGISTRO,
TR.DESCRIPCION AS DESC_TIPO_REGISTRO
FROM 
RLM_GED.RLM_REPARTICION_HABILITADA RI
INNER JOIN RLM_GED.SIS_TIPO_REGISTRO TR ON RI.FK_TIPO_REGISTRO = TR.ID_TIPO_REGISTRO
WHERE
REPARTICION = 'DPTMJGM';