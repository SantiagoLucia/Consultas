TRUNCATE TABLE EE_GED.DATOS_VARIABLES_COMBOS;

-------------------------------------------------

alter table EE_GED.DATOS_VARIABLES_COMBOS disable constraint SYS_C0018821;

TRUNCATE TABLE  EE_GED.DATOS_VARIABLES_COMBO_GRUPOS;

alter table EE_GED.DATOS_VARIABLES_COMBOS enable constraint SYS_C0018821;

-------------------------------------------------

TRUNCATE TABLE  EE_GED.ACTIVIDAD;

-------------------------------------------------

alter table EE_GED.ACTIVIDAD disable constraint FK_ID_TIPO_ACTIVIDAD;

TRUNCATE TABLE  EE_GED.TIPO_ACTIVIDAD;

alter table EE_GED.ACTIVIDAD enable constraint FK_ID_TIPO_ACTIVIDAD;

-------------------------------------------------

alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS_2410 disable constraint FK6959B6584D2F80C;
alter table ARCH_GED.JBPM4_PARTICIPATION disable constraint FK_PART_TASK;
alter table ARCH_GED.JBPM4_TASK disable constraint FK_TASK_SUPERTASK;
alter table ARCH_GED.JBPM4_VARIABLE disable constraint FK_VAR_TASK;
alter table PORTAFIRMA_GED.JBPM4_HIST_DETAIL disable constraint FK_HDETAIL_HPROCI;
alter table PORTAFIRMA_GED.JBPM4_HIST_ACTINST disable constraint FK_HACTI_HPROCI;
alter table PORTAFIRMA_GED.JBPM4_HIST_VAR disable constraint FK_HVAR_HPROCI;
alter table RCE_GED.RCE_ACTA_REGISTRO disable constraint FK_ID_DOCUMENTO_VINCULADO;
alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS_2510 disable constraint C_FK6959B6584D2F80C;
alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS disable constraint C_FK6959B6584D2F80C_0811;

TRUNCATE TABLE  EE_GED.DOCUMENTO;

alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS_2410 enable constraint FK6959B6584D2F80C;
alter table ARCH_GED.JBPM4_PARTICIPATION enable constraint FK_PART_TASK;
alter table ARCH_GED.JBPM4_TASK enable constraint FK_TASK_SUPERTASK;
alter table ARCH_GED.JBPM4_VARIABLE enable constraint FK_VAR_TASK;
alter table PORTAFIRMA_GED.JBPM4_HIST_DETAIL enable constraint FK_HDETAIL_HPROCI;
alter table PORTAFIRMA_GED.JBPM4_HIST_ACTINST enable constraint FK_HACTI_HPROCI;
alter table PORTAFIRMA_GED.JBPM4_HIST_VAR enable constraint FK_HVAR_HPROCI;
alter table RCE_GED.RCE_ACTA_REGISTRO enable constraint FK_ID_DOCUMENTO_VINCULADO;
alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS_2510 enable constraint C_FK6959B6584D2F80C;
alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS enable constraint C_FK6959B6584D2F80C_0811;

-------------------------------------------------

alter table EE_GED.EE_ARCH_TRAB_REPA_PART disable constraint ARCH_TRAB_REP_PART_2;

TRUNCATE TABLE  EE_GED.EE_REPARTICION_PARTICIPANTE;

alter table EE_GED.EE_ARCH_TRAB_REPA_PART enable constraint ARCH_TRAB_REP_PART_2;

-------------------------------------------------

TRUNCATE TABLE  EE_GED.EE_ARCH_TRAB_REPA_PART;

-------------------------------------------------

alter table EE_GED.EE_ARCH_TRAB_REPA_PART disable constraint ARCH_TRAB_REP_PART_1;
alter table PORTAFIRMA_GED.JBPM4_HIST_DETAIL disable constraint FK_HDETAIL_HTASK;
alter table PORTAFIRMA_GED.JBPM4_HIST_ACTINST disable constraint FK_HTI_HTASK;
alter table PORTAFIRMA_GED.JBPM4_HIST_TASK disable constraint FK_HSUPERT_SUB;
alter table PORTAFIRMA_GED.JBPM4_HIST_VAR disable constraint FK_HVAR_HTASK;
alter table EE_GED.EE_EXPEDIENTE_ARCHIVOSTRABAJO disable constraint FKFEA27847FBC4BCB7;
alter table EE_GED.EE_REPARTICION_PARTICIPANTE disable constraint ARCH_TRAB_REP_PART;
alter table GAT_GED.PSOC_PROCESO_LOTE_ENTE disable constraint FK_PRO_LOTE_ENTE_LOTE;
alter table GAT_GED.PSOC_PROCESO_LOTE_VINCULAR disable constraint FK_PRO_LOTE_VINCULAR_LOTE;
alter table GAT_GED.PSOC_BENEFICIO disable constraint FKB9EEB0E4C1020AD5;

TRUNCATE TABLE  EE_GED.EE_ARCHIVO_DE_TRABAJO;

alter table EE_GED.EE_ARCH_TRAB_REPA_PART enable constraint ARCH_TRAB_REP_PART_1;
alter table PORTAFIRMA_GED.JBPM4_HIST_DETAIL enable constraint FK_HDETAIL_HTASK;
alter table PORTAFIRMA_GED.JBPM4_HIST_ACTINST enable constraint FK_HTI_HTASK;
alter table PORTAFIRMA_GED.JBPM4_HIST_TASK enable constraint FK_HSUPERT_SUB;
alter table PORTAFIRMA_GED.JBPM4_HIST_VAR enable constraint FK_HVAR_HTASK;
alter table EE_GED.EE_EXPEDIENTE_ARCHIVOSTRABAJO enable constraint FKFEA27847FBC4BCB7;
alter table EE_GED.EE_REPARTICION_PARTICIPANTE enable constraint ARCH_TRAB_REP_PART;
alter table GAT_GED.PSOC_PROCESO_LOTE_ENTE enable constraint FK_PRO_LOTE_ENTE_LOTE;
alter table GAT_GED.PSOC_PROCESO_LOTE_VINCULAR enable constraint FK_PRO_LOTE_VINCULAR_LOTE;
alter table GAT_GED.PSOC_BENEFICIO enable constraint FKB9EEB0E4C1020AD5;

-------------------------------------------------

alter table CO_GED.JBPM_ACTION disable constraint FK_ACTION_EVENT;
alter table RCE_GED.RCE_PERSONA disable constraint FK_RC_PERSONA_SYS_TIPO_DOCUMEN;

TRUNCATE TABLE  EE_GED.HISTORIALOPERACIONDETALLES;

alter table CO_GED.JBPM_ACTION enable constraint FK_ACTION_EVENT;
alter table RCE_GED.RCE_PERSONA enable constraint FK_RC_PERSONA_SYS_TIPO_DOCUMEN;

-------------------------------------------------

alter table TRACK_GED.JBPM_EVENT disable constraint FK_EVENT_TASK;
alter table ARCH_GED.JBPM4_SWIMLANE disable constraint FK_SWIMLANE_EXEC;
alter table ARCH_GED.JBPM4_VARIABLE disable constraint FK_VAR_EXECUTION;
alter table ARCH_GED.JBPM4_VARIABLE disable constraint FK_VAR_EXESYS;
alter table TRACK_GED.JBPM_MODULEDEFINITION disable constraint FK_TSKDEF_START;
alter table TRACK_GED.JBPM_TASKINSTANCE disable constraint FK_TASKINST_TASK;
alter table ARCH_GED.JBPM4_EXECUTION disable constraint FK_EXEC_INSTANCE;
alter table ARCH_GED.JBPM4_EXECUTION disable constraint FK_EXEC_PARENT;
alter table ARCH_GED.JBPM4_EXECUTION disable constraint FK_EXEC_SUBPI;
alter table ARCH_GED.JBPM4_EXECUTION disable constraint FK_EXEC_SUPEREXEC;
alter table CO_GED.JBPM_NODE disable constraint FK_DECISION_DELEG;
alter table EE_GED.HISTORIALOPERACIONDETALLES disable constraint FK684195257A2D4D7C;
alter table CO_GED.JBPM_ACTION disable constraint FK_ACTION_ACTNDEL;
alter table CO_GED.JBPM_SWIMLANE disable constraint FK_SWL_ASSDEL;
alter table CO_GED.JBPM_TASK disable constraint FK_TASK_ASSDEL;
alter table CO_GED.JBPM_TASKCONTROLLER disable constraint FK_TSKCTRL_DELEG;
alter table RCE_GED.RCE_CERTIFICADO disable constraint RCE_MEDICO_CERTIFICADO_FK1;
alter table RCE_GED.RCE_DEFUNCION disable constraint RCE_DEFUN_RCE_MEDICO_FK;
alter table RCE_GED.RCE_NACIMIENTO disable constraint FK_RCE_DATOS_NACIMIENTO_RCE__1;
alter table RCE_GED.RCE_MATRIMONIO disable constraint SYS_C0028695;

TRUNCATE TABLE  EE_GED.HISTORIALOPERACION;

alter table TRACK_GED.JBPM_EVENT enable constraint FK_EVENT_TASK;
alter table ARCH_GED.JBPM4_SWIMLANE enable constraint FK_SWIMLANE_EXEC;
alter table ARCH_GED.JBPM4_VARIABLE enable constraint FK_VAR_EXECUTION;
alter table ARCH_GED.JBPM4_VARIABLE enable constraint FK_VAR_EXESYS;
alter table TRACK_GED.JBPM_MODULEDEFINITION enable constraint FK_TSKDEF_START;
alter table TRACK_GED.JBPM_TASKINSTANCE enable constraint FK_TASKINST_TASK;
alter table ARCH_GED.JBPM4_EXECUTION enable constraint FK_EXEC_INSTANCE;
alter table ARCH_GED.JBPM4_EXECUTION enable constraint FK_EXEC_PARENT;
alter table ARCH_GED.JBPM4_EXECUTION enable constraint FK_EXEC_SUBPI;
alter table ARCH_GED.JBPM4_EXECUTION enable constraint FK_EXEC_SUPEREXEC;
alter table CO_GED.JBPM_NODE enable constraint FK_DECISION_DELEG;
alter table EE_GED.HISTORIALOPERACIONDETALLES enable constraint FK684195257A2D4D7C;
alter table CO_GED.JBPM_ACTION enable constraint FK_ACTION_ACTNDEL;
alter table CO_GED.JBPM_SWIMLANE enable constraint FK_SWL_ASSDEL;
alter table CO_GED.JBPM_TASK enable constraint FK_TASK_ASSDEL;
alter table CO_GED.JBPM_TASKCONTROLLER enable constraint FK_TSKCTRL_DELEG;
alter table RCE_GED.RCE_CERTIFICADO enable constraint RCE_MEDICO_CERTIFICADO_FK1;
alter table RCE_GED.RCE_DEFUNCION enable constraint RCE_DEFUN_RCE_MEDICO_FK;
alter table RCE_GED.RCE_NACIMIENTO enable constraint FK_RCE_DATOS_NACIMIENTO_RCE__1;
alter table RCE_GED.RCE_MATRIMONIO enable constraint SYS_C0028695;

-------------------------------------------------

alter table TRACK_GED.JBPM_SWIMLANEINSTANCE disable constraint FK_SWIMLANEINST_SL;
alter table TRACK_GED.JBPM_TASK disable constraint FK_TASK_SWIMLANE;
alter table GAT_GED.PSOC_VARIOS disable constraint FKE43FA5AE92095D35;
alter table RCE_GED.RCE_PERSONA disable constraint FK_RC_PERSONA_SYS_TIPO_COBERTU;

TRUNCATE TABLE  EE_GED.EE_TRAMITACION_CONJUNTA;

alter table TRACK_GED.JBPM_SWIMLANEINSTANCE enable constraint FK_SWIMLANEINST_SL;
alter table TRACK_GED.JBPM_TASK enable constraint FK_TASK_SWIMLANE;
alter table GAT_GED.PSOC_VARIOS enable constraint FKE43FA5AE92095D35;
alter table RCE_GED.RCE_PERSONA enable constraint FK_RC_PERSONA_SYS_TIPO_COBERTU;

-------------------------------------------------

alter table CO_GED.VISTACOMESAENTRADAINBOX disable constraint FK93555D2E70761122;
alter table PORTAFIRMA_GED.JBPM4_JOB disable constraint FK_JOB_CFG;
alter table PORTAFIRMA_GED.JBPM4_VARIABLE disable constraint FK_VAR_LOB;
alter table TRACK_GED.JBPM_TASKACTORPOOL disable constraint FK_TSKACTPOL_PLACT;
alter table RCE_GED.RCE_PERSONA disable constraint FK_RC_PERSONA_SYS_SEXO1;
alter table GAT_GED.PSOC_EDUCACION disable constraint FK7D73A6118D1A7F2C;

TRUNCATE TABLE  EE_GED.EE_EXPEDIENTE_ASOCIADO;

alter table CO_GED.VISTACOMESAENTRADAINBOX enable constraint FK93555D2E70761122;
alter table PORTAFIRMA_GED.JBPM4_JOB enable constraint FK_JOB_CFG;
alter table PORTAFIRMA_GED.JBPM4_VARIABLE enable constraint FK_VAR_LOB;
alter table TRACK_GED.JBPM_TASKACTORPOOL enable constraint FK_TSKACTPOL_PLACT;
alter table RCE_GED.RCE_PERSONA enable constraint FK_RC_PERSONA_SYS_SEXO1;
alter table GAT_GED.PSOC_EDUCACION enable constraint FK7D73A6118D1A7F2C;

-------------------------------------------------

alter table EE_GED.EE_EXPEDIENTE_ASOCIADO disable constraint FK50723E82228A0DDC;
alter table TRACK_GED.JBPM_POOLEDACTOR disable constraint FK_POOLEDACTOR_SLI;
alter table TRACK_GED.JBPM_TASKINSTANCE disable constraint FK_TASKINST_SLINST;
alter table ARCH_GED.JBPM4_HIST_DETAIL disable constraint FK_HDETAIL_HACTI;
alter table EE_GED.EE_TRAMITACION_CONJUNTA disable constraint FK_EE_TRAMITACION_CONJUNTA_1;
alter table RCE_GED.RCE_DEFUNCION disable constraint RCE_DEFUN_SYS_ESTA_SALUD_FK;
alter table RCE_GED.RCE_LUGAR_CENTRO_MEDICO disable constraint FK_RCE_INSTITUCION_SALUD_SYS_E;
alter table RCE_GED.RCE_LUGAR_NACIMIENTO disable constraint RCE_LUGAR_NACIMIENTO_SYS__FK2;
alter table GAT_GED.PSOC_PROCESO_LOTE_ENTE disable constraint FK_PRO_LOTE_ENTE_PLAN;
alter table GAT_GED.PSOC_CONFIGURACION_BANCO disable constraint PSOC_CONFIGURACION_BANCO_FK1;
alter table GAT_GED.PSOC_BENEFICIO disable constraint FKB9EEB0E4A1E8903F;
alter table GAT_GED.PSOC_CABECERA_CSV disable constraint PSOC_CABECERA_CSV_PSOC_PL_FK1;
alter table GAT_GED.PSOC_EXPEDIENTE_PAGO disable constraint FK_PLAN_ID;
alter table GAT_GED.PSOC_FILTRO_TAB disable constraint PSOC_FILTRO_TAB_PSOC_PLAN_FK1;
alter table GAT_GED.PSOC_MAPEO_FC_REPARTICION disable constraint PSOC_MAPEO_FC_REPARTICION_FK1;
alter table GAT_GED.PSOC_PROCESO_MIG_HISTORIAL disable constraint PSOC_PROC_MIG_HIST_R01;
alter table TRACK_GED.JBPM_LOG disable constraint FK_LOG_SWIMINST;

TRUNCATE TABLE  EE_GED.EXPEDIENTEASOCIADO;

alter table EE_GED.EE_EXPEDIENTE_ASOCIADO enable constraint FK50723E82228A0DDC;
alter table TRACK_GED.JBPM_POOLEDACTOR enable constraint FK_POOLEDACTOR_SLI;
alter table TRACK_GED.JBPM_TASKINSTANCE enable constraint FK_TASKINST_SLINST;
alter table ARCH_GED.JBPM4_HIST_DETAIL enable constraint FK_HDETAIL_HACTI;
alter table EE_GED.EE_TRAMITACION_CONJUNTA enable constraint FK_EE_TRAMITACION_CONJUNTA_1;
alter table RCE_GED.RCE_DEFUNCION enable constraint RCE_DEFUN_SYS_ESTA_SALUD_FK;
alter table RCE_GED.RCE_LUGAR_CENTRO_MEDICO enable constraint FK_RCE_INSTITUCION_SALUD_SYS_E;
alter table RCE_GED.RCE_LUGAR_NACIMIENTO enable constraint RCE_LUGAR_NACIMIENTO_SYS__FK2;
alter table GAT_GED.PSOC_PROCESO_LOTE_ENTE enable constraint FK_PRO_LOTE_ENTE_PLAN;
alter table GAT_GED.PSOC_CONFIGURACION_BANCO enable constraint PSOC_CONFIGURACION_BANCO_FK1;
alter table GAT_GED.PSOC_BENEFICIO enable constraint FKB9EEB0E4A1E8903F;
alter table GAT_GED.PSOC_CABECERA_CSV enable constraint PSOC_CABECERA_CSV_PSOC_PL_FK1;
alter table GAT_GED.PSOC_EXPEDIENTE_PAGO enable constraint FK_PLAN_ID;
alter table GAT_GED.PSOC_FILTRO_TAB enable constraint PSOC_FILTRO_TAB_PSOC_PLAN_FK1;
alter table GAT_GED.PSOC_MAPEO_FC_REPARTICION enable constraint PSOC_MAPEO_FC_REPARTICION_FK1;
alter table GAT_GED.PSOC_PROCESO_MIG_HISTORIAL enable constraint PSOC_PROC_MIG_HIST_R01;
alter table TRACK_GED.JBPM_LOG enable constraint FK_LOG_SWIMINST;

-------------------------------------------------

TRUNCATE TABLE  EE_GED.EE_AUD_TAREA_MIGRACION_ERROR;

-------------------------------------------------

alter table EE_GED.EE_AUD_TAREA_MIGRACION_ERROR disable constraint EE_AUD_MIGRACION_ERROR_SIG_FK1;

TRUNCATE TABLE  EE_GED.EE_AUD_TAREA_MIGRACION;

alter table EE_GED.EE_AUD_TAREA_MIGRACION_ERROR enable constraint EE_AUD_MIGRACION_ERROR_SIG_FK1;

-------------------------------------------------

TRUNCATE TABLE  EE_GED.EE_ARCHIVO_REMISION;

-------------------------------------------------

TRUNCATE TABLE  EE_GED.EE_CON_SUSPENSION;

-------------------------------------------------

alter table GEDO_GED.JBPM4_PARTICIPATION disable constraint FK_PART_TASK;
alter table GEDO_GED.JBPM4_TASK disable constraint FK_TASK_SUPERTASK;
alter table GEDO_GED.JBPM4_VARIABLE disable constraint FK_VAR_TASK;
alter table CO_GED.JBPM_EVENT disable constraint FK_EVENT_TASK;
alter table CO_GED.JBPM_MODULEDEFINITION disable constraint FK_TSKDEF_START;
alter table CO_GED.JBPM_TASKINSTANCE disable constraint FK_TASKINST_TASK;
alter table LUE_GED.RU_CONYUGE disable constraint FK_RU_CONYUGE_SYS_SEXO1;
alter table LUE_GED.RU_IDENTIFICACION disable constraint FKAABEA19BD685EF4F;
alter table LUE_GED.RU_FILIATORIO disable constraint FK_RU_FILIATORIO_SYS_SEXO1;
alter table GAT_GED.PSOC_VIVIENDA disable constraint FK80ED98B486B830DA;

TRUNCATE TABLE  EE_GED.METADATOS_TRATA;

alter table GEDO_GED.JBPM4_PARTICIPATION enable constraint FK_PART_TASK;
alter table GEDO_GED.JBPM4_TASK enable constraint FK_TASK_SUPERTASK;
alter table GEDO_GED.JBPM4_VARIABLE enable constraint FK_VAR_TASK;
alter table CO_GED.JBPM_EVENT enable constraint FK_EVENT_TASK;
alter table CO_GED.JBPM_MODULEDEFINITION enable constraint FK_TSKDEF_START;
alter table CO_GED.JBPM_TASKINSTANCE enable constraint FK_TASKINST_TASK;
alter table LUE_GED.RU_CONYUGE enable constraint FK_RU_CONYUGE_SYS_SEXO1;
alter table LUE_GED.RU_IDENTIFICACION enable constraint FKAABEA19BD685EF4F;
alter table LUE_GED.RU_FILIATORIO enable constraint FK_RU_FILIATORIO_SYS_SEXO1;
alter table GAT_GED.PSOC_VIVIENDA enable constraint FK80ED98B486B830DA;

-------------------------------------------------

alter table ARCH_GED.EXPEDIENTES disable constraint FKFDA16A6C494351C1;
alter table ARCH_GED.CAJAS disable constraint FK3CED0DE494351C1;
alter table NUMERADOR_GED.NUMERO_SADE_CARATULA disable constraint FK_NUMERO_SADE_CARATULA;
alter table RCE_GED.RCE_LUGAR_CENTRO_MEDICO disable constraint FK_RCE_LUGAR_CENTRO_MEDICO_RCE;
alter table RCE_GED.RCE_LUGAR_DOMICILIO disable constraint FK_RCE_LUGAR_DOMICILIO_RCE_LUG;
alter table RCE_GED.RCE_NACIDO disable constraint FK_RCE_NACIDO_RCE_LUGAR_NACIMI;
alter table RCE_GED.RCE_NACIMIENTO disable constraint FK_RCE_NACIMIENTO_RCE_LUGAR_NA;
alter table GAT_GED.PSOC_EDUCACION disable constraint FK7D73A611A1525B29;

TRUNCATE TABLE  EE_GED.EE_EXPEDIENTE_ARCHIVOSTRABAJO;

alter table ARCH_GED.EXPEDIENTES enable constraint FKFDA16A6C494351C1;
alter table ARCH_GED.CAJAS enable constraint FK3CED0DE494351C1;
alter table NUMERADOR_GED.NUMERO_SADE_CARATULA enable constraint FK_NUMERO_SADE_CARATULA;
alter table RCE_GED.RCE_LUGAR_CENTRO_MEDICO enable constraint FK_RCE_LUGAR_CENTRO_MEDICO_RCE;
alter table RCE_GED.RCE_LUGAR_DOMICILIO enable constraint FK_RCE_LUGAR_DOMICILIO_RCE_LUG;
alter table RCE_GED.RCE_NACIDO enable constraint FK_RCE_NACIDO_RCE_LUGAR_NACIMI;
alter table RCE_GED.RCE_NACIMIENTO enable constraint FK_RCE_NACIMIENTO_RCE_LUGAR_NA;
alter table GAT_GED.PSOC_EDUCACION enable constraint FK7D73A611A1525B29;

-------------------------------------------------

alter table EE_GED.EE_ARCHIVO_REMISION disable constraint EE_ARCHIVO_REMISION_EE_EX_FK1;
alter table EE_GED.EE_ARCHIVO_REMISION disable constraint ID_EXPEDIENTE;
alter table EE_GED.EE_EXPEDIENTE_ASOCIADO disable constraint FK50723E82AE21D949;
alter table TRACK_GED.JBPM_MODULEINSTANCE disable constraint FK_MODINST_PRCINST;
alter table TRACK_GED.JBPM_RUNTIMEACTION disable constraint FK_RTACTN_PROCINST;
alter table PORTAFIRMA_GED.JBPM4_TASK disable constraint FK_TASK_SWIML;
alter table TRACK_GED.JBPM_TIMER disable constraint FK_TIMER_PRINST;
alter table TRACK_GED.JBPM_TOKEN disable constraint FK_TOKEN_PROCINST;
alter table TRACK_GED.JBPM_TOKEN disable constraint FK_TOKEN_SUBPI;
alter table TRACK_GED.JBPM_VARIABLEINSTANCE disable constraint FK_VARINST_PRCINST;
alter table PORTAFIRMA_GED.JBPM4_PARTICIPATION disable constraint FK_PART_SWIMLANE;
alter table EE_GED.EE_CON_SUSPENSION disable constraint FK_EE;
alter table EE_GED.EE_EXPEDIENTE_ARCHIVOSTRABAJO disable constraint FKFEA27847AE21D949;
alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS_2410 disable constraint FK6959B658AE21D949;
alter table EE_GED.HISTORIALOPERACION disable constraint FK_HISTOPER_EXPELECT;
alter table EE_GED.METADATOS_TRATA disable constraint FK34BD7A67A724E899;
alter table CO_GED.JBPM_BYTEBLOCK disable constraint FK_BYTEBLOCK_FILE;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_NEWBYTES;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_OLDBYTES;
alter table CO_GED.JBPM_VARIABLEINSTANCE disable constraint FK_BYTEINST_ARRAY;
alter table RCE_GED.RCE_DEFUNCION_CEMENTERIO disable constraint FK_OBSERVACIONES_FK;
alter table RCE_GED.RCE_DEFUNCION disable constraint RCE_DEFUNCION_OBSERVACIONES;
alter table RCE_GED.RCE_NACIMIENTO disable constraint FK_RCE_DATOS_NACIMIENTO_RCE_OB;
alter table RCE_GED.RCE_REGISTRO_PERSONA disable constraint FK_RCE_REGISTRO_PERSONA_RCE_OB;
alter table RCE_GED.RCE_RENAPER disable constraint FK_RCE_MADRE_RCE_OBSERVACIONES;
alter table RCE_GED.RCE_DEFUNCION disable constraint RCE_DEFUN_RCE_OBSERV_FK;
alter table RCE_GED.RCE_NACIMIENTO disable constraint RCE_NACIMIENTO_OBSERV;
alter table RCE_GED.RCE_DEFUNCION disable constraint RCE_DEF_OBSERV_LICENCIA_FK;
alter table GAT_GED.PSOC_ANEXO_AUTOMATICO disable constraint PSOC_ANEXO_AUTOMATICO_R01;
alter table GAT_GED.PSOC_CARGA_FISICA disable constraint PSOC_CARGA_FISICA_FK1;
alter table GAT_GED.PSOC_DETALLE_COMUNA disable constraint PSOC_DETALLE_COMUNA_FK1;
alter table GAT_GED.PSOC_DETALLE_PAGO disable constraint FKASD1231977612;
alter table GAT_GED.PSOC_DETALLE_PAGO_BANCO disable constraint PSOC_DETALLE_PAGO_BANCO_FK2;
alter table GAT_GED.PSOC_LOTE disable constraint FK7E73B611A1526C30;
alter table GAT_GED.PSOC_PROCESO_REINICIO_LEGAJO disable constraint FK_PRO_REINICIO_LEGAJO_PAGO;
alter table RCE_GED.RCE_MATRIMONIO disable constraint RCE_MATR_OBSERV_FK;
alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS_2510 disable constraint C_FK6959B658AE21D949;
alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS disable constraint C_FK6959B658AE21D949_0811;

TRUNCATE TABLE  EE_GED.EE_EXPEDIENTE_ELECTRONICO;

alter table EE_GED.EE_ARCHIVO_REMISION enable constraint EE_ARCHIVO_REMISION_EE_EX_FK1;
alter table EE_GED.EE_ARCHIVO_REMISION enable constraint ID_EXPEDIENTE;
alter table EE_GED.EE_EXPEDIENTE_ASOCIADO enable constraint FK50723E82AE21D949;
alter table TRACK_GED.JBPM_MODULEINSTANCE enable constraint FK_MODINST_PRCINST;
alter table TRACK_GED.JBPM_RUNTIMEACTION enable constraint FK_RTACTN_PROCINST;
alter table PORTAFIRMA_GED.JBPM4_TASK enable constraint FK_TASK_SWIML;
alter table TRACK_GED.JBPM_TIMER enable constraint FK_TIMER_PRINST;
alter table TRACK_GED.JBPM_TOKEN enable constraint FK_TOKEN_PROCINST;
alter table TRACK_GED.JBPM_TOKEN enable constraint FK_TOKEN_SUBPI;
alter table TRACK_GED.JBPM_VARIABLEINSTANCE enable constraint FK_VARINST_PRCINST;
alter table PORTAFIRMA_GED.JBPM4_PARTICIPATION enable constraint FK_PART_SWIMLANE;
alter table EE_GED.EE_CON_SUSPENSION enable constraint FK_EE;
alter table EE_GED.EE_EXPEDIENTE_ARCHIVOSTRABAJO enable constraint FKFEA27847AE21D949;
alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS_2410 enable constraint FK6959B658AE21D949;
alter table EE_GED.HISTORIALOPERACION enable constraint FK_HISTOPER_EXPELECT;
alter table EE_GED.METADATOS_TRATA enable constraint FK34BD7A67A724E899;
alter table CO_GED.JBPM_BYTEBLOCK enable constraint FK_BYTEBLOCK_FILE;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_NEWBYTES;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_OLDBYTES;
alter table CO_GED.JBPM_VARIABLEINSTANCE enable constraint FK_BYTEINST_ARRAY;
alter table RCE_GED.RCE_DEFUNCION_CEMENTERIO enable constraint FK_OBSERVACIONES_FK;
alter table RCE_GED.RCE_DEFUNCION enable constraint RCE_DEFUNCION_OBSERVACIONES;
alter table RCE_GED.RCE_NACIMIENTO enable constraint FK_RCE_DATOS_NACIMIENTO_RCE_OB;
alter table RCE_GED.RCE_REGISTRO_PERSONA enable constraint FK_RCE_REGISTRO_PERSONA_RCE_OB;
alter table RCE_GED.RCE_RENAPER enable constraint FK_RCE_MADRE_RCE_OBSERVACIONES;
alter table RCE_GED.RCE_DEFUNCION enable constraint RCE_DEFUN_RCE_OBSERV_FK;
alter table RCE_GED.RCE_NACIMIENTO enable constraint RCE_NACIMIENTO_OBSERV;
alter table RCE_GED.RCE_DEFUNCION enable constraint RCE_DEF_OBSERV_LICENCIA_FK;
alter table GAT_GED.PSOC_ANEXO_AUTOMATICO enable constraint PSOC_ANEXO_AUTOMATICO_R01;
alter table GAT_GED.PSOC_CARGA_FISICA enable constraint PSOC_CARGA_FISICA_FK1;
alter table GAT_GED.PSOC_DETALLE_COMUNA enable constraint PSOC_DETALLE_COMUNA_FK1;
alter table GAT_GED.PSOC_DETALLE_PAGO enable constraint FKASD1231977612;
alter table GAT_GED.PSOC_DETALLE_PAGO_BANCO enable constraint PSOC_DETALLE_PAGO_BANCO_FK2;
alter table GAT_GED.PSOC_LOTE enable constraint FK7E73B611A1526C30;
alter table GAT_GED.PSOC_PROCESO_REINICIO_LEGAJO enable constraint FK_PRO_REINICIO_LEGAJO_PAGO;
alter table RCE_GED.RCE_MATRIMONIO enable constraint RCE_MATR_OBSERV_FK;
alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS_2510 enable constraint C_FK6959B658AE21D949;
alter table EE_GED.EE_EXPEDIENTE_DOCUMENTOS enable constraint C_FK6959B658AE21D949_0811;

-------------------------------------------------

alter table EE_GED.EE_EXPEDIENTE_ELECTRONICO disable constraint FKDD1F0E5AE7BD8E9F;
alter table CO_GED.JBPM_COMMENT disable constraint FK_COMMENT_TSK;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_TASKINST;
alter table CO_GED.JBPM_MESSAGE disable constraint FK_CMD_TASKINST;
alter table CO_GED.JBPM_TASKACTORPOOL disable constraint FK_TASKACTPL_TSKI;
alter table CO_GED.JBPM_TIMER disable constraint FK_TIMER_TSKINST;
alter table CO_GED.JBPM_VARIABLEINSTANCE disable constraint FK_VAR_TSKINST;
alter table GAT_GED.PSOC_PAGO disable constraint FKDIP88AC1C056EDAB;
alter table GAT_GED.PSOC_PAGO_AUDIT disable constraint FKDIP8K8AC1C056EDAB;
alter table LUE_GED.RU_DOCUMENTO_VINCULADO disable constraint FK3E283806AC4DAC4E;
alter table LUE_GED.RU_HISTORIAL_PASE disable constraint FK_RU_HISTORIAL_PASE_SYS_TIPO_;
alter table LUE_GED.SIS_DOC_REQ_EP disable constraint FKEBCB95E5AC4DAC4E;
alter table LUE_GED.SIS_DOC_REQ_TIPO_DOMICILIO_RIB disable constraint FK245FF660AC4DAC4E;
alter table LUE_GED.SIS_DOC_REQ_TIPO_NACIONALIDAD disable constraint FK6FEFDDFEAC4DAC4E;
alter table GAT_GED.PSOC_DETALLE_PAGO disable constraint FKASD1231977614;

TRUNCATE TABLE  EE_GED.SOLICITUD_EXPEDIENTE;

alter table EE_GED.EE_EXPEDIENTE_ELECTRONICO enable constraint FKDD1F0E5AE7BD8E9F;
alter table CO_GED.JBPM_COMMENT enable constraint FK_COMMENT_TSK;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_TASKINST;
alter table CO_GED.JBPM_MESSAGE enable constraint FK_CMD_TASKINST;
alter table CO_GED.JBPM_TASKACTORPOOL enable constraint FK_TASKACTPL_TSKI;
alter table CO_GED.JBPM_TIMER enable constraint FK_TIMER_TSKINST;
alter table CO_GED.JBPM_VARIABLEINSTANCE enable constraint FK_VAR_TSKINST;
alter table GAT_GED.PSOC_PAGO enable constraint FKDIP88AC1C056EDAB;
alter table GAT_GED.PSOC_PAGO_AUDIT enable constraint FKDIP8K8AC1C056EDAB;
alter table LUE_GED.RU_DOCUMENTO_VINCULADO enable constraint FK3E283806AC4DAC4E;
alter table LUE_GED.RU_HISTORIAL_PASE enable constraint FK_RU_HISTORIAL_PASE_SYS_TIPO_;
alter table LUE_GED.SIS_DOC_REQ_EP enable constraint FKEBCB95E5AC4DAC4E;
alter table LUE_GED.SIS_DOC_REQ_TIPO_DOMICILIO_RIB enable constraint FK245FF660AC4DAC4E;
alter table LUE_GED.SIS_DOC_REQ_TIPO_NACIONALIDAD enable constraint FK6FEFDDFEAC4DAC4E;
alter table GAT_GED.PSOC_DETALLE_PAGO enable constraint FKASD1231977614;

-------------------------------------------------

alter table EE_GED.SOLICITUD_EXPEDIENTE disable constraint FK2FCC7B6280A5232E;
alter table CO_GED.JBPM_TASK disable constraint FK_TSK_TSKCTRL;
alter table CO_GED.JBPM_VARIABLEACCESS disable constraint FK_VARACC_TSKCTRL;
alter table RCE_GED.RCE_DOCUMENTO_VINCULADO disable constraint FK_RC_DOCUMENTO_VINCULADO_SYS_;
alter table RCE_GED.RCE_TIPO_DOC_ACTA disable constraint RCE_TIPO_DOC_ACTA_SYS_TIP_FK2;
alter table LUE_GED.RU_IDENTIFICACION disable constraint FKAABEA19BF7C353D0;
alter table GAT_GED.PSOC_VIVIENDA disable constraint FK80ED98B45D840057;

TRUNCATE TABLE  EE_GED.SOLICITANTE;

alter table EE_GED.SOLICITUD_EXPEDIENTE enable constraint FK2FCC7B6280A5232E;
alter table CO_GED.JBPM_TASK enable constraint FK_TSK_TSKCTRL;
alter table CO_GED.JBPM_VARIABLEACCESS enable constraint FK_VARACC_TSKCTRL;
alter table RCE_GED.RCE_DOCUMENTO_VINCULADO enable constraint FK_RC_DOCUMENTO_VINCULADO_SYS_;
alter table RCE_GED.RCE_TIPO_DOC_ACTA enable constraint RCE_TIPO_DOC_ACTA_SYS_TIP_FK2;
alter table LUE_GED.RU_IDENTIFICACION enable constraint FKAABEA19BF7C353D0;
alter table GAT_GED.PSOC_VIVIENDA enable constraint FK80ED98B45D840057;

-------------------------------------------------

alter table GEDO_GED.JBPM4_HIST_DETAIL disable constraint FK_HDETAIL_HACTI;
alter table EE_GED.SOLICITANTE disable constraint FKA5E85613F56D24E1;
alter table GAT_GED.PSOC_DATOS_JGM disable constraint FKJGM12332190;
alter table GAT_GED.PSOC_DATOS_JGM_AUDIT disable constraint FKJGM123321890;

TRUNCATE TABLE  EE_GED.DOCUMENTO_DE_IDENTIDAD;

alter table GEDO_GED.JBPM4_HIST_DETAIL enable constraint FK_HDETAIL_HACTI;
alter table EE_GED.SOLICITANTE enable constraint FKA5E85613F56D24E1;
alter table GAT_GED.PSOC_DATOS_JGM enable constraint FKJGM12332190;
alter table GAT_GED.PSOC_DATOS_JGM_AUDIT enable constraint FKJGM123321890;

-------------------------------------------------

alter table TRACK_GED.JBPM_DECISIONCONDITIONS disable constraint FK_DECCOND_DEC;
alter table TRACK_GED.JBPM_EVENT disable constraint FK_EVENT_NODE;
alter table TRACK_GED.JBPM_NODE disable constraint FK_NODE_SUPERSTATE;
alter table TRACK_GED.JBPM_PROCESSDEFINITION disable constraint FK_PROCDEF_STRTSTA;
alter table TRACK_GED.JBPM_LOG disable constraint FK_LOG_DESTNODE;
alter table TRACK_GED.JBPM_LOG disable constraint FK_LOG_NODE;
alter table TRACK_GED.JBPM_LOG disable constraint FK_LOG_SOURCENODE;
alter table TRACK_GED.JBPM_MESSAGE disable constraint FK_CMD_NODE;
alter table GEDO_GED.JBPM4_LOB disable constraint FK_LOB_DEPLOYMENT;
alter table TRACK_GED.JBPM_TASK disable constraint FK_TASK_STARTST;
alter table TRACK_GED.JBPM_TASK disable constraint FK_TASK_TASKNODE;
alter table TRACK_GED.JBPM_TOKEN disable constraint FK_TOKEN_NODE;
alter table GEDO_GED.JBPM4_DEPLOYPROP disable constraint FK_DEPLPROP_DEPL;
alter table TRACK_GED.JBPM_TRANSITION disable constraint FK_TRANSITION_FROM;
alter table TRACK_GED.JBPM_TRANSITION disable constraint FK_TRANSITION_TO;
alter table TRACK_GED.JBPM_VARIABLEACCESS disable constraint FK_VARACC_PROCST;
alter table RCE_GED.SYS_CIRCUNSCRIPCION disable constraint SYS_CIRCUNSCRIPCION_FK1;
alter table RCE_GED.SYS_ESTABLECIMIENTO_SALUD disable constraint SYS_ESTABLECIMIENTO_SALUD_FK2;
alter table RCE_GED.SYS_KODAK_CIRCUNSCRIPCION disable constraint SYS_KODAK_TIPO_REGISTRO_FK1;
alter table RCE_GED.SYS_SUBTIPO_REGISTRO disable constraint FK_TIPO_REGISTRO;
alter table RCE_GED.RCE_NUMERACION_ACTA disable constraint FK1_TIPO_REGISTRO;
alter table RCE_GED.RCE_PLANTILLA_DOCUMENTO disable constraint RCE_PLANTILLA_DOCUMENTO_FK2;
alter table GAT_GED.PSOC_EDUCACION disable constraint FK7D73A61182907D5E;

TRUNCATE TABLE  EE_GED.DATO_VARIABLE;

alter table TRACK_GED.JBPM_DECISIONCONDITIONS enable constraint FK_DECCOND_DEC;
alter table TRACK_GED.JBPM_EVENT enable constraint FK_EVENT_NODE;
alter table TRACK_GED.JBPM_NODE enable constraint FK_NODE_SUPERSTATE;
alter table TRACK_GED.JBPM_PROCESSDEFINITION enable constraint FK_PROCDEF_STRTSTA;
alter table TRACK_GED.JBPM_LOG enable constraint FK_LOG_DESTNODE;
alter table TRACK_GED.JBPM_LOG enable constraint FK_LOG_NODE;
alter table TRACK_GED.JBPM_LOG enable constraint FK_LOG_SOURCENODE;
alter table TRACK_GED.JBPM_MESSAGE enable constraint FK_CMD_NODE;
alter table GEDO_GED.JBPM4_LOB enable constraint FK_LOB_DEPLOYMENT;
alter table TRACK_GED.JBPM_TASK enable constraint FK_TASK_STARTST;
alter table TRACK_GED.JBPM_TASK enable constraint FK_TASK_TASKNODE;
alter table TRACK_GED.JBPM_TOKEN enable constraint FK_TOKEN_NODE;
alter table GEDO_GED.JBPM4_DEPLOYPROP enable constraint FK_DEPLPROP_DEPL;
alter table TRACK_GED.JBPM_TRANSITION enable constraint FK_TRANSITION_FROM;
alter table TRACK_GED.JBPM_TRANSITION enable constraint FK_TRANSITION_TO;
alter table TRACK_GED.JBPM_VARIABLEACCESS enable constraint FK_VARACC_PROCST;
alter table RCE_GED.SYS_CIRCUNSCRIPCION enable constraint SYS_CIRCUNSCRIPCION_FK1;
alter table RCE_GED.SYS_ESTABLECIMIENTO_SALUD enable constraint SYS_ESTABLECIMIENTO_SALUD_FK2;
alter table RCE_GED.SYS_KODAK_CIRCUNSCRIPCION enable constraint SYS_KODAK_TIPO_REGISTRO_FK1;
alter table RCE_GED.SYS_SUBTIPO_REGISTRO enable constraint FK_TIPO_REGISTRO;
alter table RCE_GED.RCE_NUMERACION_ACTA enable constraint FK1_TIPO_REGISTRO;
alter table RCE_GED.RCE_PLANTILLA_DOCUMENTO enable constraint RCE_PLANTILLA_DOCUMENTO_FK2;
alter table GAT_GED.PSOC_EDUCACION enable constraint FK7D73A61182907D5E;

-------------------------------------------------

alter table EE_GED.DATO_VARIABLE disable constraint FK762D3B235BC32B44;
alter table TRACK_GED.ST_CAMPO_PARAMETRIZABLE disable constraint FK63187D1058D93348;
alter table CO_GED.JBPM_PROCESSINSTANCE disable constraint FK_PROCIN_ROOTTKN;
alter table CO_GED.JBPM_PROCESSINSTANCE disable constraint FK_PROCIN_SPROCTKN;
alter table EE_GED.TRATA_REPARTICION disable constraint FK_TRATA_REPARTICION_TRATA;
alter table EE_GED.TRATA_TIPO_DOCUMENTO disable constraint FKBEA7F91F745C3B68;
alter table EE_GED.EE_EXPEDIENTE_ELECTRONICO disable constraint FKDD1F0E5A5BC32B44;
alter table CO_GED.JBPM_COMMENT disable constraint FK_COMMENT_TOKEN;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_CHILDTOKEN;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_TOKEN;
alter table CO_GED.JBPM_MESSAGE disable constraint FK_MSG_TOKEN;
alter table CO_GED.JBPM_TASKINSTANCE disable constraint FK_TASKINST_TOKEN;
alter table CO_GED.JBPM_TIMER disable constraint FK_TIMER_TOKEN;
alter table CO_GED.JBPM_TOKEN disable constraint FK_TOKEN_PARENT;
alter table CO_GED.JBPM_TOKENVARIABLEMAP disable constraint FK_TKVARMAP_TOKEN;
alter table CO_GED.JBPM_VARIABLEINSTANCE disable constraint FK_VARINST_TK;
alter table LUE_GED.RU_DOMICILIO disable constraint FK6865B64947B68A42;
alter table LUE_GED.SIS_DOC_REQ_TIPO_DOMICILIO_RIB disable constraint FK245FF66047B68A42;
alter table GAT_GED.PSOC_DATOS_JGM disable constraint FKJGM12332189;
alter table GAT_GED.PSOC_DATOS_JGM_AUDIT disable constraint FKJGM123321889;

TRUNCATE TABLE  EE_GED.TRATA;

alter table EE_GED.DATO_VARIABLE enable constraint FK762D3B235BC32B44;
alter table TRACK_GED.ST_CAMPO_PARAMETRIZABLE enable constraint FK63187D1058D93348;
alter table CO_GED.JBPM_PROCESSINSTANCE enable constraint FK_PROCIN_ROOTTKN;
alter table CO_GED.JBPM_PROCESSINSTANCE enable constraint FK_PROCIN_SPROCTKN;
alter table EE_GED.TRATA_REPARTICION enable constraint FK_TRATA_REPARTICION_TRATA;
alter table EE_GED.TRATA_TIPO_DOCUMENTO enable constraint FKBEA7F91F745C3B68;
alter table EE_GED.EE_EXPEDIENTE_ELECTRONICO enable constraint FKDD1F0E5A5BC32B44;
alter table CO_GED.JBPM_COMMENT enable constraint FK_COMMENT_TOKEN;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_CHILDTOKEN;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_TOKEN;
alter table CO_GED.JBPM_MESSAGE enable constraint FK_MSG_TOKEN;
alter table CO_GED.JBPM_TASKINSTANCE enable constraint FK_TASKINST_TOKEN;
alter table CO_GED.JBPM_TIMER enable constraint FK_TIMER_TOKEN;
alter table CO_GED.JBPM_TOKEN enable constraint FK_TOKEN_PARENT;
alter table CO_GED.JBPM_TOKENVARIABLEMAP enable constraint FK_TKVARMAP_TOKEN;
alter table CO_GED.JBPM_VARIABLEINSTANCE enable constraint FK_VARINST_TK;
alter table LUE_GED.RU_DOMICILIO enable constraint FK6865B64947B68A42;
alter table LUE_GED.SIS_DOC_REQ_TIPO_DOMICILIO_RIB enable constraint FK245FF66047B68A42;
alter table GAT_GED.PSOC_DATOS_JGM enable constraint FKJGM12332189;
alter table GAT_GED.PSOC_DATOS_JGM_AUDIT enable constraint FKJGM123321889;

-------------------------------------------------

alter table ARCH_GED.BATCHS disable constraint A0_53;
alter table ARCH_GED.VOLUMENES disable constraint A0_111;
alter table EE_GED.JBPM4_TASK disable constraint FK_TASK_SUPERTASK;
alter table EE_GED.JBPM4_VARIABLE disable constraint FK_VAR_TASK;
alter table ARCH_GED.C10_DATA disable constraint C100_43;
alter table ARCH_GED.C11_DATA disable constraint C110_43;
alter table ARCH_GED.C12_DATA disable constraint C120_43;
alter table ARCH_GED.C13_DATA disable constraint C130_43;
alter table ARCH_GED.C14_DATA disable constraint C140_43;
alter table ARCH_GED.C15_DATA disable constraint C150_43;
alter table ARCH_GED.C16_DATA disable constraint C160_43;
alter table ARCH_GED.C17_DATA disable constraint C170_43;
alter table ARCH_GED.C2_DATA disable constraint C10_998_1;
alter table ARCH_GED.C7_DATA disable constraint C70_43;
alter table ARCH_GED.C8_DATA disable constraint C80_43;
alter table ARCH_GED.C9_DATA disable constraint C90_43;
alter table EE_GED.JBPM4_PARTICIPATION disable constraint FK_PART_TASK;
alter table CO_GED.JBPM_SWIMLANEINSTANCE disable constraint FK_SWIMLANEINST_SL;
alter table CO_GED.JBPM_TASK disable constraint FK_TASK_SWIMLANE;
alter table RCE_GED.RCE_DOMICILIO disable constraint FK_RCE_DOMICILIO_SYS_ASEN;
alter table LUE_GED.RU_DOMICILIO disable constraint FK_RIB_DOMICILIO_RIB_PARADOR1;
alter table GAT_GED.PSOC_BENEFICIO disable constraint FKB9EEB0E43515042D;
alter table GAT_GED.PSOC_SALUD_ASISTENCIA_ALIMENTA disable constraint FKE95F075A3515042D;

TRUNCATE TABLE  EE_GED.JBPM4_TASK;

alter table ARCH_GED.BATCHS enable constraint A0_53;
alter table ARCH_GED.VOLUMENES enable constraint A0_111;
alter table EE_GED.JBPM4_TASK enable constraint FK_TASK_SUPERTASK;
alter table EE_GED.JBPM4_VARIABLE enable constraint FK_VAR_TASK;
alter table ARCH_GED.C10_DATA enable constraint C100_43;
alter table ARCH_GED.C11_DATA enable constraint C110_43;
alter table ARCH_GED.C12_DATA enable constraint C120_43;
alter table ARCH_GED.C13_DATA enable constraint C130_43;
alter table ARCH_GED.C14_DATA enable constraint C140_43;
alter table ARCH_GED.C15_DATA enable constraint C150_43;
alter table ARCH_GED.C16_DATA enable constraint C160_43;
alter table ARCH_GED.C17_DATA enable constraint C170_43;
alter table ARCH_GED.C2_DATA enable constraint C10_998_1;
alter table ARCH_GED.C7_DATA enable constraint C70_43;
alter table ARCH_GED.C8_DATA enable constraint C80_43;
alter table ARCH_GED.C9_DATA enable constraint C90_43;
alter table EE_GED.JBPM4_PARTICIPATION enable constraint FK_PART_TASK;
alter table CO_GED.JBPM_SWIMLANEINSTANCE enable constraint FK_SWIMLANEINST_SL;
alter table CO_GED.JBPM_TASK enable constraint FK_TASK_SWIMLANE;
alter table RCE_GED.RCE_DOMICILIO enable constraint FK_RCE_DOMICILIO_SYS_ASEN;
alter table LUE_GED.RU_DOMICILIO enable constraint FK_RIB_DOMICILIO_RIB_PARADOR1;
alter table GAT_GED.PSOC_BENEFICIO enable constraint FKB9EEB0E43515042D;
alter table GAT_GED.PSOC_SALUD_ASISTENCIA_ALIMENTA enable constraint FKE95F075A3515042D;

-------------------------------------------------

alter table ARCH_GED.USUARIOS_CLASES disable constraint A0_105;
alter table EE_GED.JBPM4_TASK disable constraint FK_TASK_SWIML;
alter table EE_GED.JBPM4_PARTICIPATION disable constraint FK_PART_SWIMLANE;
alter table LUE_GED.RU_DOMICILIO disable constraint FK_PAIS_RES;
alter table LUE_GED.RU_IDENTIFICACION disable constraint FKAABEA19BD5FB0FF;
alter table LUE_GED.RU_FILIATORIO disable constraint FK_RU_FILIATORIO_SYS_NACIONALI;
alter table LUE_GED.RU_IDENTIFICACION disable constraint FK_RIB_IDENTIFICACION_RIB_N_53;
alter table LUE_GED.RU_ESTUDIO_CURSADO disable constraint NACION_FK;

TRUNCATE TABLE  EE_GED.JBPM4_SWIMLANE;

alter table ARCH_GED.USUARIOS_CLASES enable constraint A0_105;
alter table EE_GED.JBPM4_TASK enable constraint FK_TASK_SWIML;
alter table EE_GED.JBPM4_PARTICIPATION enable constraint FK_PART_SWIMLANE;
alter table LUE_GED.RU_DOMICILIO enable constraint FK_PAIS_RES;
alter table LUE_GED.RU_IDENTIFICACION enable constraint FKAABEA19BD5FB0FF;
alter table LUE_GED.RU_FILIATORIO enable constraint FK_RU_FILIATORIO_SYS_NACIONALI;
alter table LUE_GED.RU_IDENTIFICACION enable constraint FK_RIB_IDENTIFICACION_RIB_N_53;
alter table LUE_GED.RU_ESTUDIO_CURSADO enable constraint NACION_FK;

-------------------------------------------------

alter table EE_GED.JBPM4_VARIABLE disable constraint FK_VAR_EXECUTION;
alter table EE_GED.JBPM4_VARIABLE disable constraint FK_VAR_EXESYS;
alter table ARCH_GED.EXPEDIENTES disable constraint FKFDA16A6C65D11293;
alter table ARCH_GED.CAJAS disable constraint EDIFICIOCAJAS;
alter table EE_GED.JBPM4_EXECUTION disable constraint FK_EXEC_INSTANCE;
alter table EE_GED.JBPM4_EXECUTION disable constraint FK_EXEC_PARENT;
alter table EE_GED.JBPM4_EXECUTION disable constraint FK_EXEC_SUBPI;
alter table EE_GED.JBPM4_EXECUTION disable constraint FK_EXEC_SUPEREXEC;
alter table EE_GED.JBPM4_SWIMLANE disable constraint FK_SWIMLANE_EXEC;
alter table RCE_GED.RCE_DATO_LABORAL disable constraint FK_RCE_DATOS_LABORAL_SYS_SITUA;
alter table GAT_GED.PSOC_BENEFICIO disable constraint FKMDE41451512;

TRUNCATE TABLE  EE_GED.JBPM4_EXECUTION;

alter table EE_GED.JBPM4_VARIABLE enable constraint FK_VAR_EXECUTION;
alter table EE_GED.JBPM4_VARIABLE enable constraint FK_VAR_EXESYS;
alter table ARCH_GED.EXPEDIENTES enable constraint FKFDA16A6C65D11293;
alter table ARCH_GED.CAJAS enable constraint EDIFICIOCAJAS;
alter table EE_GED.JBPM4_EXECUTION enable constraint FK_EXEC_INSTANCE;
alter table EE_GED.JBPM4_EXECUTION enable constraint FK_EXEC_PARENT;
alter table EE_GED.JBPM4_EXECUTION enable constraint FK_EXEC_SUBPI;
alter table EE_GED.JBPM4_EXECUTION enable constraint FK_EXEC_SUPEREXEC;
alter table EE_GED.JBPM4_SWIMLANE enable constraint FK_SWIMLANE_EXEC;
alter table RCE_GED.RCE_DATO_LABORAL enable constraint FK_RCE_DATOS_LABORAL_SYS_SITUA;
alter table GAT_GED.PSOC_BENEFICIO enable constraint FKMDE41451512;

-------------------------------------------------

alter table ARCH_GED.JBPM4_HIST_TASK disable constraint FK_HSUPERT_SUB;
alter table ARCH_GED.JBPM4_HIST_VAR disable constraint FK_HVAR_HTASK;
alter table ARCH_GED.JBPM4_HIST_ACTINST disable constraint FK_HTI_HTASK;
alter table ARCH_GED.JBPM4_HIST_DETAIL disable constraint FK_HDETAIL_HTASK;
alter table CO_GED.JBPM_NODE disable constraint FK_NODE_SUPERSTATE;
alter table CO_GED.JBPM_PROCESSDEFINITION disable constraint FK_PROCDEF_STRTSTA;
alter table CO_GED.JBPM_DECISIONCONDITIONS disable constraint FK_DECCOND_DEC;
alter table CO_GED.JBPM_EVENT disable constraint FK_EVENT_NODE;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_DESTNODE;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_NODE;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_SOURCENODE;
alter table CO_GED.JBPM_MESSAGE disable constraint FK_CMD_NODE;
alter table CO_GED.JBPM_TASK disable constraint FK_TASK_STARTST;
alter table CO_GED.JBPM_TASK disable constraint FK_TASK_TASKNODE;
alter table CO_GED.JBPM_TOKEN disable constraint FK_TOKEN_NODE;
alter table CO_GED.JBPM_TRANSITION disable constraint FK_TRANSITION_FROM;
alter table CO_GED.JBPM_TRANSITION disable constraint FK_TRANSITION_TO;
alter table CO_GED.JBPM_VARIABLEACCESS disable constraint FK_VARACC_PROCST;
alter table GAT_GED.PSOC_EDUCACION disable constraint FKE43FA5XO92095D35;

TRUNCATE TABLE  EE_GED.JBPM4_JOB;

alter table ARCH_GED.JBPM4_HIST_TASK enable constraint FK_HSUPERT_SUB;
alter table ARCH_GED.JBPM4_HIST_VAR enable constraint FK_HVAR_HTASK;
alter table ARCH_GED.JBPM4_HIST_ACTINST enable constraint FK_HTI_HTASK;
alter table ARCH_GED.JBPM4_HIST_DETAIL enable constraint FK_HDETAIL_HTASK;
alter table CO_GED.JBPM_NODE enable constraint FK_NODE_SUPERSTATE;
alter table CO_GED.JBPM_PROCESSDEFINITION enable constraint FK_PROCDEF_STRTSTA;
alter table CO_GED.JBPM_DECISIONCONDITIONS enable constraint FK_DECCOND_DEC;
alter table CO_GED.JBPM_EVENT enable constraint FK_EVENT_NODE;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_DESTNODE;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_NODE;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_SOURCENODE;
alter table CO_GED.JBPM_MESSAGE enable constraint FK_CMD_NODE;
alter table CO_GED.JBPM_TASK enable constraint FK_TASK_STARTST;
alter table CO_GED.JBPM_TASK enable constraint FK_TASK_TASKNODE;
alter table CO_GED.JBPM_TOKEN enable constraint FK_TOKEN_NODE;
alter table CO_GED.JBPM_TRANSITION enable constraint FK_TRANSITION_FROM;
alter table CO_GED.JBPM_TRANSITION enable constraint FK_TRANSITION_TO;
alter table CO_GED.JBPM_VARIABLEACCESS enable constraint FK_VARACC_PROCST;
alter table GAT_GED.PSOC_EDUCACION enable constraint FKE43FA5XO92095D35;

-------------------------------------------------

alter table EE_GED.JBPM4_JOB disable constraint FK_JOB_CFG;
alter table EE_GED.JBPM4_VARIABLE disable constraint FK_VAR_LOB;
alter table ARCH_GED.JBPM4_HIST_DETAIL disable constraint FK_HDETAIL_HVAR;
alter table CO_GED.JBPM_TASKACTORPOOL disable constraint FK_TSKACTPOL_PLACT;
alter table GAT_GED.PSOC_EDUCACION_RICH disable constraint PSOC_EDUCACION_RICH_IBFK_1;
alter table GAT_GED.PSOC_RUBRO_INSTITUCION disable constraint PSOC_RUBRO_INSTITUCION_IBFK_2;

TRUNCATE TABLE  EE_GED.JBPM4_LOB;

alter table EE_GED.JBPM4_JOB enable constraint FK_JOB_CFG;
alter table EE_GED.JBPM4_VARIABLE enable constraint FK_VAR_LOB;
alter table ARCH_GED.JBPM4_HIST_DETAIL enable constraint FK_HDETAIL_HVAR;
alter table CO_GED.JBPM_TASKACTORPOOL enable constraint FK_TSKACTPOL_PLACT;
alter table GAT_GED.PSOC_EDUCACION_RICH enable constraint PSOC_EDUCACION_RICH_IBFK_1;
alter table GAT_GED.PSOC_RUBRO_INSTITUCION enable constraint PSOC_RUBRO_INSTITUCION_IBFK_2;

-------------------------------------------------

alter table ARCH_GED.JBPM4_LOB disable constraint FK_LOB_DEPLOYMENT;
alter table EE_GED.JBPM4_LOB disable constraint FK_LOB_DEPLOYMENT;
alter table TRACK_GED.JBPM_TASK disable constraint FK_TSK_TSKCTRL;
alter table TRACK_GED.JBPM_VARIABLEACCESS disable constraint FK_VARACC_TSKCTRL;
alter table ARCH_GED.JBPM4_DEPLOYPROP disable constraint FK_DEPLPROP_DEPL;
alter table EE_GED.JBPM4_DEPLOYPROP disable constraint FK_DEPLPROP_DEPL;
alter table CO_GED.JBPM_ACTION disable constraint FK_ACTION_EXPTHDL;
alter table RCE_GED.RCE_PERSONA disable constraint FK_RCE_PERSONA_SYS_NIVEL_INSTR;

TRUNCATE TABLE  EE_GED.JBPM4_DEPLOYMENT;

alter table ARCH_GED.JBPM4_LOB enable constraint FK_LOB_DEPLOYMENT;
alter table EE_GED.JBPM4_LOB enable constraint FK_LOB_DEPLOYMENT;
alter table TRACK_GED.JBPM_TASK enable constraint FK_TSK_TSKCTRL;
alter table TRACK_GED.JBPM_VARIABLEACCESS enable constraint FK_VARACC_TSKCTRL;
alter table ARCH_GED.JBPM4_DEPLOYPROP enable constraint FK_DEPLPROP_DEPL;
alter table EE_GED.JBPM4_DEPLOYPROP enable constraint FK_DEPLPROP_DEPL;
alter table CO_GED.JBPM_ACTION enable constraint FK_ACTION_EXPTHDL;
alter table RCE_GED.RCE_PERSONA enable constraint FK_RCE_PERSONA_SYS_NIVEL_INSTR;