alter table LUE_GED.RU_CONYUGE disable constraint FK_RU_CONYUGE_SYS_SEXO1;
alter table LUE_GED.RU_IDENTIFICACION disable constraint FKAABEA19BD685EF4F;
alter table LUE_GED.RU_FILIATORIO disable constraint FK_RU_FILIATORIO_SYS_SEXO1;
alter table GAT_GED.PSOC_VIVIENDA disable constraint FK80ED98B486B830DA;
alter table GEDO_GED.JBPM4_PARTICIPATION disable constraint FK_PART_TASK;
alter table GEDO_GED.JBPM4_TASK disable constraint FK_TASK_SUPERTASK;
alter table GEDO_GED.JBPM4_VARIABLE disable constraint FK_VAR_TASK;
alter table CO_GED.JBPM_EVENT disable constraint FK_EVENT_TASK;
alter table CO_GED.JBPM_MODULEDEFINITION disable constraint FK_TSKDEF_START;
alter table CO_GED.JBPM_TASKINSTANCE disable constraint FK_TASKINST_TASK;

TRUNCATE TABLE  GEDO_GED.JBPM4_TASK;

alter table LUE_GED.RU_CONYUGE enable constraint FK_RU_CONYUGE_SYS_SEXO1;
alter table LUE_GED.RU_IDENTIFICACION enable constraint FKAABEA19BD685EF4F;
alter table LUE_GED.RU_FILIATORIO enable constraint FK_RU_FILIATORIO_SYS_SEXO1;
alter table GAT_GED.PSOC_VIVIENDA enable constraint FK80ED98B486B830DA;
alter table GEDO_GED.JBPM4_PARTICIPATION enable constraint FK_PART_TASK;
alter table GEDO_GED.JBPM4_TASK enable constraint FK_TASK_SUPERTASK;
alter table GEDO_GED.JBPM4_VARIABLE enable constraint FK_VAR_TASK;
alter table CO_GED.JBPM_EVENT enable constraint FK_EVENT_TASK;
alter table CO_GED.JBPM_MODULEDEFINITION enable constraint FK_TSKDEF_START;
alter table CO_GED.JBPM_TASKINSTANCE enable constraint FK_TASKINST_TASK;