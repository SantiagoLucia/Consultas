TRUNCATE TABLE  GEDO_GED.DF_FORM_COMP_VALUE;

-------------------------------------------------------------------------------------

alter table GEDO_GED.DF_FORM_COMP_VALUE disable constraint FK_TRANSACTION;

TRUNCATE TABLE  GEDO_GED.DF_TRANSACTION;

alter table GEDO_GED.DF_FORM_COMP_VALUE enable constraint FK_TRANSACTION;

-------------------------------------------------------------------------------------

TRUNCATE TABLE  GEDO_GED.GEDO_AUD_ERROR_CAMBIO_SIGLA;

-------------------------------------------------------------------------------------

alter table GEDO_GED.GEDO_AUD_ERROR_CAMBIO_SIGLA disable constraint GEDO_AUD_ERROR_CAMBIO_SIG_FK1;
alter table PORTAFIRMA_GED.PF_AUD_ERROR_CAMBIO_SIGLA disable constraint GEDO_AUD_ERROR_CAMBIO_SIG_FK1;

TRUNCATE TABLE  GEDO_GED.GEDO_AUD_TAREA_CAMBIO_SIGLA;

alter table GEDO_GED.GEDO_AUD_ERROR_CAMBIO_SIGLA enable constraint GEDO_AUD_ERROR_CAMBIO_SIG_FK1;
alter table PORTAFIRMA_GED.PF_AUD_ERROR_CAMBIO_SIGLA enable constraint GEDO_AUD_ERROR_CAMBIO_SIG_FK1;

-------------------------------------------------------------------------------------

alter table GEDO_GED.CCOO_COMUNICACION_DESTINO disable constraint CCOO_COMUNICACION_DESTINO_FK1;

TRUNCATE TABLE  GEDO_GED.CCOO_COMUNICACION;

alter table GEDO_GED.CCOO_COMUNICACION_DESTINO enable constraint CCOO_COMUNICACION_DESTINO_FK1;

-------------------------------------------------------------------------------------

TRUNCATE TABLE  GEDO_GED.GEDO_DOCUMENTO_TEMPLATE;

-------------------------------------------------------------------------------------

alter table GEDO_GED.GEDO_DOCUMENTO_TEMPLATE disable constraint GEDO_DOCUMENTO_TEMPLATE_FK1;

TRUNCATE TABLE  GEDO_GED.GEDO_TIPODOCUMENTO_TEMPLATE;

alter table GEDO_GED.GEDO_DOCUMENTO_TEMPLATE enable constraint GEDO_DOCUMENTO_TEMPLATE_FK1;

-------------------------------------------------------------------------------------

alter table GEDO_GED.GEDO_DOCUMENTO disable constraint TIPO_DOC_IOP_FK_ID;

TRUNCATE TABLE  GEDO_GED.TIPO_DOC_IOP;

alter table GEDO_GED.GEDO_DOCUMENTO enable constraint TIPO_DOC_IOP_FK_ID;

-------------------------------------------------------------------------------------

alter table TRACK_GED.JBPM_LOG disable constraint FK_LOG_TASKINST;
alter table TRACK_GED.JBPM_MESSAGE disable constraint FK_CMD_TASKINST;
alter table ARCH_GED.REL_EXP_DOC disable constraint FKF6B95A10DD73DC69;
alter table ARCH_GED.REL_EXP_DOC disable constraint FKF6B95A10E470CD19;
alter table ARCH_GED.SOLICITUD_DIGITAL disable constraint FKEA5A2B3DDD73DC69;
alter table ARCH_GED.SOLICITUD_EXP_EXT disable constraint FK3961B604DD73DC69;
alter table GEDO_GED.GEDO_DOCUMENTO disable constraint FK712D1FBEBC730770;
alter table GEDO_GED.GEDO_NUMEROSUSADOS disable constraint FKDC47FB863F9C0E3C;
alter table GEDO_GED.GEDO_TIPODOCUMENTO_EMBEBIDO disable constraint FK905C8712AF736218;
alter table GEDO_GED.GEDO_TIPODOCUMENTO_TEMPLATE disable constraint GEDO_TIPODOCUMENTO_TEMP_FK1;
alter table TRACK_GED.JBPM_COMMENT disable constraint FK_COMMENT_TSK;
alter table TRACK_GED.JBPM_TASKACTORPOOL disable constraint FK_TASKACTPL_TSKI;
alter table TRACK_GED.JBPM_TIMER disable constraint FK_TIMER_TSKINST;
alter table GEDO_GED.GEDO_TIPODOCUMENTO_REPARTICION disable constraint FKREPARTICION_TIPODOCUMENTO;
alter table TRACK_GED.JBPM_VARIABLEINSTANCE disable constraint FK_VAR_TSKINST;
alter table ARCH_GED.DOCUMENTOS_ADJUNTOS disable constraint DOCUMENTOS_ADJUNTOS_EXPED_FK1;
alter table ARCH_GED.EE_ELECTRONICO_DOCUMENTO_AD disable constraint FKDF77E7D92C654144;
alter table ARCH_GED.EXPEDIENTE_ELECTRONICO disable constraint FKC746EBDB98FE37A8;
alter table ARCH_GED.EXPEDIENTE_ELECTRONICO_AD disable constraint FK16322F072C654144;
alter table ARCH_GED.EXPEDIENTE_METADATO disable constraint EXPEDIENTE_METADATO_R01;
alter table ARCH_GED.COPIA_DIGITAL disable constraint FKEA5A2B3DDD73DC64;
alter table ARCH_GED.CUERPOS disable constraint FK6D404135DD73DC69;
alter table ARCH_GED.SOLICITUD_EXP_INT disable constraint FK3961C3D2DD73DC69;
alter table CO_GED.JBPM_ID_GROUP disable constraint FK_ID_GRP_PARENT;
alter table CO_GED.JBPM_ID_MEMBERSHIP disable constraint FK_ID_MEMSHIP_GRP;
alter table GEDO_GED.TIPO_DOC_IOP disable constraint TIPO_DOC_IOP_GEDO_TD_FK;
alter table RCE_GED.RCE_PERSONA disable constraint FK_RCE_PERSONA_RCE_DATOS_LABOR;

TRUNCATE TABLE  GEDO_GED.GEDO_TIPODOCUMENTO;

alter table TRACK_GED.JBPM_LOG enable constraint FK_LOG_TASKINST;
alter table TRACK_GED.JBPM_MESSAGE enable constraint FK_CMD_TASKINST;
alter table ARCH_GED.REL_EXP_DOC enable constraint FKF6B95A10DD73DC69;
alter table ARCH_GED.REL_EXP_DOC enable constraint FKF6B95A10E470CD19;
alter table ARCH_GED.SOLICITUD_DIGITAL enable constraint FKEA5A2B3DDD73DC69;
alter table ARCH_GED.SOLICITUD_EXP_EXT enable constraint FK3961B604DD73DC69;
alter table GEDO_GED.GEDO_DOCUMENTO enable constraint FK712D1FBEBC730770;
alter table GEDO_GED.GEDO_NUMEROSUSADOS enable constraint FKDC47FB863F9C0E3C;
alter table GEDO_GED.GEDO_TIPODOCUMENTO_EMBEBIDO enable constraint FK905C8712AF736218;
alter table GEDO_GED.GEDO_TIPODOCUMENTO_TEMPLATE enable constraint GEDO_TIPODOCUMENTO_TEMP_FK1;
alter table TRACK_GED.JBPM_COMMENT enable constraint FK_COMMENT_TSK;
alter table TRACK_GED.JBPM_TASKACTORPOOL enable constraint FK_TASKACTPL_TSKI;
alter table TRACK_GED.JBPM_TIMER enable constraint FK_TIMER_TSKINST;
alter table GEDO_GED.GEDO_TIPODOCUMENTO_REPARTICION enable constraint FKREPARTICION_TIPODOCUMENTO;
alter table TRACK_GED.JBPM_VARIABLEINSTANCE enable constraint FK_VAR_TSKINST;
alter table ARCH_GED.DOCUMENTOS_ADJUNTOS enable constraint DOCUMENTOS_ADJUNTOS_EXPED_FK1;
alter table ARCH_GED.EE_ELECTRONICO_DOCUMENTO_AD enable constraint FKDF77E7D92C654144;
alter table ARCH_GED.EXPEDIENTE_ELECTRONICO enable constraint FKC746EBDB98FE37A8;
alter table ARCH_GED.EXPEDIENTE_ELECTRONICO_AD enable constraint FK16322F072C654144;
alter table ARCH_GED.EXPEDIENTE_METADATO enable constraint EXPEDIENTE_METADATO_R01;
alter table ARCH_GED.COPIA_DIGITAL enable constraint FKEA5A2B3DDD73DC64;
alter table ARCH_GED.CUERPOS enable constraint FK6D404135DD73DC69;
alter table ARCH_GED.SOLICITUD_EXP_INT enable constraint FK3961C3D2DD73DC69;
alter table CO_GED.JBPM_ID_GROUP enable constraint FK_ID_GRP_PARENT;
alter table CO_GED.JBPM_ID_MEMBERSHIP enable constraint FK_ID_MEMSHIP_GRP;
alter table GEDO_GED.TIPO_DOC_IOP enable constraint TIPO_DOC_IOP_GEDO_TD_FK;
alter table RCE_GED.RCE_PERSONA enable constraint FK_RCE_PERSONA_RCE_DATOS_LABOR;

-------------------------------------------------------------------------------------

alter table PORTAFIRMA_GED.JBPM4_HIST_DETAIL disable constraint FK_HDETAIL_HACTI;
alter table GEDO_GED.GEDO_TIPODOCUMENTO disable constraint FAMILIA;
alter table TRACK_GED.JBPM_VARIABLEINSTANCE disable constraint FK_VARINST_TKVARMP;
alter table CO_GED.JBPM_LOG disable constraint FK_LOG_PARENT;
alter table RCE_GED.RCE_DOMICILIO disable constraint RCE_DOMICILIO_SYS_NACIONA_FK1;
alter table RCE_GED.RCE_PERSONA disable constraint FK_RC_PERSONA_SYS_NACIONALIDAD;
alter table RCE_GED.SYS_PROVINCIA_CONSULADOS disable constraint SYS_C0029460;

TRUNCATE TABLE  GEDO_GED.GEDO_TIPODOCUMENTO_FAMILIA;

alter table PORTAFIRMA_GED.JBPM4_HIST_DETAIL enable constraint FK_HDETAIL_HACTI;
alter table GEDO_GED.GEDO_TIPODOCUMENTO enable constraint FAMILIA;
alter table TRACK_GED.JBPM_VARIABLEINSTANCE enable constraint FK_VARINST_TKVARMP;
alter table CO_GED.JBPM_LOG enable constraint FK_LOG_PARENT;
alter table RCE_GED.RCE_DOMICILIO enable constraint RCE_DOMICILIO_SYS_NACIONA_FK1;
alter table RCE_GED.RCE_PERSONA enable constraint FK_RC_PERSONA_SYS_NACIONALIDAD;
alter table RCE_GED.SYS_PROVINCIA_CONSULADOS enable constraint SYS_C0029460;