CREATE TABLE VMSCMS.CMS_DFG_PARAM_HIST
(
  CDP_INST_CODE       NUMBER(3),
  CDP_PARAM_KEY       VARCHAR2(30 BYTE),
  CDP_PARAM_VALUE     VARCHAR2(15 BYTE),
  CDP_INS_USER        NUMBER(5),
  CDP_INS_DATE        DATE,
  CDP_LUPD_USER       NUMBER(5),
  CDP_LUPD_DATE       DATE,
  CDP_MANDARORY_FLAG  VARCHAR2(1 BYTE),
  CDP_PROD_CODE       VARCHAR2(6 BYTE)
)
TABLESPACE CMS_HIST
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

