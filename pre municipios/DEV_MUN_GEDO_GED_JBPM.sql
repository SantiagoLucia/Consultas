alter table LUE_GED.RU_FILIATORIO disable constraint FK_RU_FILIATORIO_SYS_TIPO_DOCU;
alter table LUE_GED.RU_IDENTIFICACION disable constraint FKAABEA19B4FC47CE0;
alter table LUE_GED.RU_CONYUGE disable constraint FK_RU_CONYUGE_SYS_TIPO_DOCUMEN;
alter table GAT_GED.PSOC_BECA disable constraint FKMDE69809813;
alter table GEDO_GED.JBPM4_VARIABLE disable constraint FK_VAR_LOB;
alter table GEDO_GED.JBPM4_JOB disable constraint FK_JOB_CFG;
alter table EE_GED.DOCUMENTO disable constraint FKDE5562944390DDB5;

TRUNCATE TABLE  GEDO_GED.JBPM4_LOB;

alter table LUE_GED.RU_FILIATORIO enable constraint FK_RU_FILIATORIO_SYS_TIPO_DOCU;
alter table LUE_GED.RU_IDENTIFICACION enable constraint FKAABEA19B4FC47CE0;
alter table LUE_GED.RU_CONYUGE enable constraint FK_RU_CONYUGE_SYS_TIPO_DOCUMEN;
alter table GAT_GED.PSOC_BECA enable constraint FKMDE69809813;
alter table GEDO_GED.JBPM4_VARIABLE enable constraint FK_VAR_LOB;
alter table GEDO_GED.JBPM4_JOB enable constraint FK_JOB_CFG;
alter table EE_GED.DOCUMENTO enable constraint FKDE5562944390DDB5;

-------------------------------------------------------------------------------------

alter table GAT_GED.PSOC_EDUCACION disable constraint FKE43FA5XO92095D35;
alter table CO_GED.JBPM_VARIABLEACCESS disable constraint FK_VARACC_PROCST;
alter table CO_GED.JBPM_TRANSITION disable constraint FK_TRANSITION_TO;
alter table CO_GED.JBPM_TRANSITION disable constraint FK_TRANSITION_FROM;
alter table CO_GED.JBPM_TOKEN disable constraint FK_TOKEN_NODE;
alter table CO_GED.JBPM_TASK disable constraint FK_TASK_TASKNODE;
alter table CO_GED.JBPM_TASK disable constraint FK_TASK_STARTST;
alter table CO_GED.JBPM_MESSAGE disable constraint FK_CMD_NODE;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_SOURCENODE;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_NODE;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_DESTNODE;
alter table CO_GED.JBPM_EVENT disable constraint FK_EVENT_NODE;
alter table CO_GED.JBPM_DECISIONCONDITIONS disable constraint FK_DECCOND_DEC;
alter table CO_GED.JBPM_PROCESSDEFINITION disable constraint FK_PROCDEF_STRTSTA;
alter table CO_GED.JBPM_NODE disable constraint FK_NODE_SUPERSTATE;
alter table ARCH_GED.JBPM4_HIST_DETAIL disable constraint FK_HDETAIL_HTASK;
alter table ARCH_GED.JBPM4_HIST_ACTINST disable constraint FK_HTI_HTASK;
alter table ARCH_GED.JBPM4_HIST_VAR disable constraint FK_HVAR_HTASK;
alter table ARCH_GED.JBPM4_HIST_TASK disable constraint FK_HSUPERT_SUB;

TRUNCATE TABLE  GEDO_GED.JBPM4_DEPLOYPROP;

alter table GAT_GED.PSOC_EDUCACION enable constraint FKE43FA5XO92095D35;
alter table CO_GED.JBPM_VARIABLEACCESS enable constraint FK_VARACC_PROCST;
alter table CO_GED.JBPM_TRANSITION enable constraint FK_TRANSITION_TO;
alter table CO_GED.JBPM_TRANSITION enable constraint FK_TRANSITION_FROM;
alter table CO_GED.JBPM_TOKEN enable constraint FK_TOKEN_NODE;
alter table CO_GED.JBPM_TASK enable constraint FK_TASK_TASKNODE;
alter table CO_GED.JBPM_TASK enable constraint FK_TASK_STARTST;
alter table CO_GED.JBPM_MESSAGE enable constraint FK_CMD_NODE;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_SOURCENODE;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_NODE;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_DESTNODE;
alter table CO_GED.JBPM_EVENT enable constraint FK_EVENT_NODE;
alter table CO_GED.JBPM_DECISIONCONDITIONS enable constraint FK_DECCOND_DEC;
alter table CO_GED.JBPM_PROCESSDEFINITION enable constraint FK_PROCDEF_STRTSTA;
alter table CO_GED.JBPM_NODE enable constraint FK_NODE_SUPERSTATE;
alter table ARCH_GED.JBPM4_HIST_DETAIL enable constraint FK_HDETAIL_HTASK;
alter table ARCH_GED.JBPM4_HIST_ACTINST enable constraint FK_HTI_HTASK;
alter table ARCH_GED.JBPM4_HIST_VAR enable constraint FK_HVAR_HTASK;
alter table ARCH_GED.JBPM4_HIST_TASK enable constraint FK_HSUPERT_SUB;

-------------------------------------------------------------------------------------

alter table GAT_GED.PSOC_EDUCACION disable constraint FK7D73A61182907D5E;
alter table RCE_GED.RCE_PLANTILLA_DOCUMENTO disable constraint RCE_PLANTILLA_DOCUMENTO_FK2;
alter table RCE_GED.RCE_NUMERACION_ACTA disable constraint FK1_TIPO_REGISTRO;
alter table RCE_GED.SYS_SUBTIPO_REGISTRO disable constraint FK_TIPO_REGISTRO;
alter table RCE_GED.SYS_KODAK_CIRCUNSCRIPCION disable constraint SYS_KODAK_TIPO_REGISTRO_FK1;
alter table RCE_GED.SYS_ESTABLECIMIENTO_SALUD disable constraint SYS_ESTABLECIMIENTO_SALUD_FK2;
alter table RCE_GED.SYS_CIRCUNSCRIPCION disable constraint SYS_CIRCUNSCRIPCION_FK1;
alter table TRACK_GED.JBPM_VARIABLEACCESS disable constraint FK_VARACC_PROCST;
alter table TRACK_GED.JBPM_TRANSITION disable constraint FK_TRANSITION_TO;
alter table TRACK_GED.JBPM_TRANSITION disable constraint FK_TRANSITION_FROM;
alter table TRACK_GED.JBPM_TOKEN disable constraint FK_TOKEN_NODE;
alter table TRACK_GED.JBPM_TASK disable constraint FK_TASK_TASKNODE;
alter table TRACK_GED.JBPM_TASK disable constraint FK_TASK_STARTST;
alter table TRACK_GED.JBPM_MESSAGE disable constraint FK_CMD_NODE;
alter table TRACK_GED.JBPM_LOG disable constraint FK_LOG_SOURCENODE;
alter table TRACK_GED.JBPM_LOG disable constraint FK_LOG_NODE;
alter table TRACK_GED.JBPM_LOG disable constraint FK_LOG_DESTNODE;
alter table TRACK_GED.JBPM_PROCESSDEFINITION disable constraint FK_PROCDEF_STRTSTA;
alter table TRACK_GED.JBPM_NODE disable constraint FK_NODE_SUPERSTATE;
alter table TRACK_GED.JBPM_EVENT disable constraint FK_EVENT_NODE;
alter table TRACK_GED.JBPM_DECISIONCONDITIONS disable constraint FK_DECCOND_DEC;
alter table GEDO_GED.JBPM4_DEPLOYPROP disable constraint FK_DEPLPROP_DEPL;
alter table GEDO_GED.JBPM4_LOB disable constraint FK_LOB_DEPLOYMENT;

TRUNCATE TABLE  GEDO_GED.JBPM4_DEPLOYMENT;

alter table GAT_GED.PSOC_EDUCACION enable constraint FK7D73A61182907D5E;
alter table RCE_GED.RCE_PLANTILLA_DOCUMENTO enable constraint RCE_PLANTILLA_DOCUMENTO_FK2;
alter table RCE_GED.RCE_NUMERACION_ACTA enable constraint FK1_TIPO_REGISTRO;
alter table RCE_GED.SYS_SUBTIPO_REGISTRO enable constraint FK_TIPO_REGISTRO;
alter table RCE_GED.SYS_KODAK_CIRCUNSCRIPCION enable constraint SYS_KODAK_TIPO_REGISTRO_FK1;
alter table RCE_GED.SYS_ESTABLECIMIENTO_SALUD enable constraint SYS_ESTABLECIMIENTO_SALUD_FK2;
alter table RCE_GED.SYS_CIRCUNSCRIPCION enable constraint SYS_CIRCUNSCRIPCION_FK1;
alter table TRACK_GED.JBPM_VARIABLEACCESS enable constraint FK_VARACC_PROCST;
alter table TRACK_GED.JBPM_TRANSITION enable constraint FK_TRANSITION_TO;
alter table TRACK_GED.JBPM_TRANSITION enable constraint FK_TRANSITION_FROM;
alter table TRACK_GED.JBPM_TOKEN enable constraint FK_TOKEN_NODE;
alter table TRACK_GED.JBPM_TASK enable constraint FK_TASK_TASKNODE;
alter table TRACK_GED.JBPM_TASK enable constraint FK_TASK_STARTST;
alter table TRACK_GED.JBPM_MESSAGE enable constraint FK_CMD_NODE;
alter table TRACK_GED.JBPM_LOG enable constraint FK_LOG_SOURCENODE;
alter table TRACK_GED.JBPM_LOG enable constraint FK_LOG_NODE;
alter table TRACK_GED.JBPM_LOG enable constraint FK_LOG_DESTNODE;
alter table TRACK_GED.JBPM_PROCESSDEFINITION enable constraint FK_PROCDEF_STRTSTA;
alter table TRACK_GED.JBPM_NODE enable constraint FK_NODE_SUPERSTATE;
alter table TRACK_GED.JBPM_EVENT enable constraint FK_EVENT_NODE;
alter table TRACK_GED.JBPM_DECISIONCONDITIONS enable constraint FK_DECCOND_DEC;
alter table GEDO_GED.JBPM4_DEPLOYPROP enable constraint FK_DEPLPROP_DEPL;
alter table GEDO_GED.JBPM4_LOB enable constraint FK_LOB_DEPLOYMENT;

-------------------------------------------------------------------------------------

alter table LUE_GED.SIS_DOC_REQ_TIPO_NACIONALIDAD disable constraint FK6FEFDDFEAC4DAC4E;
alter table LUE_GED.SIS_DOC_REQ_TIPO_DOMICILIO_RIB disable constraint FK245FF660AC4DAC4E;
alter table LUE_GED.SIS_DOC_REQ_EP disable constraint FKEBCB95E5AC4DAC4E;
alter table LUE_GED.RU_HISTORIAL_PASE disable constraint FK_RU_HISTORIAL_PASE_SYS_TIPO_;
alter table LUE_GED.RU_DOCUMENTO_VINCULADO disable constraint FK3E283806AC4DAC4E;
alter table GAT_GED.PSOC_DETALLE_PAGO disable constraint FKASD1231977614;
alter table GAT_GED.PSOC_PAGO_AUDIT disable constraint FKDIP8K8AC1C056EDAB;
alter table GAT_GED.PSOC_PAGO disable constraint FKDIP88AC1C056EDAB;
alter table EE_GED.EE_EXPEDIENTE_ELECTRONICO disable constraint FKDD1F0E5AE7BD8E9F;
alter table CO_GED.JBPM_VARIABLEINSTANCE disable constraint FK_VAR_TSKINST;
alter table CO_GED.JBPM_TIMER disable constraint FK_TIMER_TSKINST;
alter table CO_GED.JBPM_TASKACTORPOOL disable constraint FK_TASKACTPL_TSKI;
alter table CO_GED.JBPM_MESSAGE disable constraint FK_CMD_TASKINST;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_TASKINST;
alter table CO_GED.JBPM_COMMENT disable constraint FK_COMMENT_TSK;

TRUNCATE TABLE  GEDO_GED.JBPM4_PARTICIPATION;

alter table LUE_GED.SIS_DOC_REQ_TIPO_NACIONALIDAD enable constraint FK6FEFDDFEAC4DAC4E;
alter table LUE_GED.SIS_DOC_REQ_TIPO_DOMICILIO_RIB enable constraint FK245FF660AC4DAC4E;
alter table LUE_GED.SIS_DOC_REQ_EP enable constraint FKEBCB95E5AC4DAC4E;
alter table LUE_GED.RU_HISTORIAL_PASE enable constraint FK_RU_HISTORIAL_PASE_SYS_TIPO_;
alter table LUE_GED.RU_DOCUMENTO_VINCULADO enable constraint FK3E283806AC4DAC4E;
alter table GAT_GED.PSOC_DETALLE_PAGO enable constraint FKASD1231977614;
alter table GAT_GED.PSOC_PAGO_AUDIT enable constraint FKDIP8K8AC1C056EDAB;
alter table GAT_GED.PSOC_PAGO enable constraint FKDIP88AC1C056EDAB;
alter table EE_GED.EE_EXPEDIENTE_ELECTRONICO enable constraint FKDD1F0E5AE7BD8E9F;
alter table CO_GED.JBPM_VARIABLEINSTANCE enable constraint FK_VAR_TSKINST;
alter table CO_GED.JBPM_TIMER enable constraint FK_TIMER_TSKINST;
alter table CO_GED.JBPM_TASKACTORPOOL enable constraint FK_TASKACTPL_TSKI;
alter table CO_GED.JBPM_MESSAGE enable constraint FK_CMD_TASKINST;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_TASKINST;
alter table CO_GED.JBPM_COMMENT enable constraint FK_COMMENT_TSK;

-------------------------------------------------------------------------------------

alter table GEDO_GED.JBPM4_TASK disable constraint FK_TASK_SWIML;
alter table GEDO_GED.JBPM4_PARTICIPATION disable constraint FK_PART_SWIMLANE;
alter table GAT_GED.PSOC_VIVIENDA disable constraint FK80ED98B4B1BAFF4A;
alter table LUE_GED.RU_IDENTIFICACION disable constraint FKAABEA19B7FEDCF5E;

TRUNCATE TABLE  GEDO_GED.JBPM4_SWIMLANE;

alter table GEDO_GED.JBPM4_TASK enable constraint FK_TASK_SWIML;
alter table GEDO_GED.JBPM4_PARTICIPATION enable constraint FK_PART_SWIMLANE;
alter table GAT_GED.PSOC_VIVIENDA enable constraint FK80ED98B4B1BAFF4A;
alter table LUE_GED.RU_IDENTIFICACION enable constraint FKAABEA19B7FEDCF5E;

-------------------------------------------------------------------------------------

alter table GEDO_GED.JBPM4_VARIABLE disable constraint FK_VAR_EXESYS;
alter table GEDO_GED.JBPM4_VARIABLE disable constraint FK_VAR_EXECUTION;
alter table GEDO_GED.JBPM4_SWIMLANE disable constraint FK_SWIMLANE_EXEC;
alter table GEDO_GED.JBPM4_EXECUTION disable constraint FK_EXEC_SUPEREXEC;
alter table GEDO_GED.JBPM4_EXECUTION disable constraint FK_EXEC_SUBPI;
alter table GEDO_GED.JBPM4_EXECUTION disable constraint FK_EXEC_PARENT;
alter table GEDO_GED.JBPM4_EXECUTION disable constraint FK_EXEC_INSTANCE;
alter table TRACK_GED.ST_INTERESADO_NOTIFICA disable constraint FK6C886C368AF87BDB;
alter table TRACK_GED.ST_INTERESADO disable constraint FKF9BD56A08AF87BDB;
alter table GAT_GED.PSOC_DATOS_JGM_AUDIT disable constraint FKJGM123321891;
alter table GAT_GED.PSOC_DATOS_JGM disable constraint FKJGM12332191;
alter table GAT_GED.PSOC_TITULAR_COBRO disable constraint PSOC_TITULAR_COBRO_PSOC_T_FK2;

TRUNCATE TABLE  GEDO_GED.JBPM4_EXECUTION;

alter table GEDO_GED.JBPM4_VARIABLE enable constraint FK_VAR_EXESYS;
alter table GEDO_GED.JBPM4_VARIABLE enable constraint FK_VAR_EXECUTION;
alter table GEDO_GED.JBPM4_SWIMLANE enable constraint FK_SWIMLANE_EXEC;
alter table GEDO_GED.JBPM4_EXECUTION enable constraint FK_EXEC_SUPEREXEC;
alter table GEDO_GED.JBPM4_EXECUTION enable constraint FK_EXEC_SUBPI;
alter table GEDO_GED.JBPM4_EXECUTION enable constraint FK_EXEC_PARENT;
alter table GEDO_GED.JBPM4_EXECUTION enable constraint FK_EXEC_INSTANCE;
alter table TRACK_GED.ST_INTERESADO_NOTIFICA enable constraint FK6C886C368AF87BDB;
alter table TRACK_GED.ST_INTERESADO enable constraint FKF9BD56A08AF87BDB;
alter table GAT_GED.PSOC_DATOS_JGM_AUDIT enable constraint FKJGM123321891;
alter table GAT_GED.PSOC_DATOS_JGM enable constraint FKJGM12332191;
alter table GAT_GED.PSOC_TITULAR_COBRO enable constraint PSOC_TITULAR_COBRO_PSOC_T_FK2;