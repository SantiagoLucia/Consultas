SELECT
    EE.ID ID_EXP,
    EE.TIPO_DOCUMENTO || '-' || EE.ANIO || '-' || EE.NUMERO || '- -' || EE.CODIGO_REPARTICION_ACTUACION || '-' || EE.CODIGO_REPARTICION_USUARIO AS NRO_EXPEDIENTE,
    GD.ID ID_GEDO,
    GD.NUMERO GEDOS_ASOCIADOS,
    TR.RESERVA TIPO_RESERVA
FROM
    EE_GED.EE_EXPEDIENTE_ELECTRONICO EE
    INNER JOIN EE_GED.EE_EXPEDIENTE_DOCUMENTOS ED ON EE.ID = ED.ID
    INNER JOIN EE_GED.DOCUMENTO D ON ED.ID_DOCUMENTO = D.ID
    INNER JOIN GEDO_GED.GEDO_DOCUMENTO GD ON D.NUMERO_SADE = GD.NUMERO
    INNER JOIN GEDO_GED.GEDO_TIPO_RESERVA TR ON GD.TIPORESERVA = TR.ID
WHERE
    EE.ID = 1569742;