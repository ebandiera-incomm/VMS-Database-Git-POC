CREATE TABLE VMSCMS.CMS_UPDATE_CRDLIMITS
(
  CUC_PAN_CODE             VARCHAR2(90 BYTE),
  CUC_OLDATM_LIMIT         VARCHAR2(10 BYTE),
  CUC_NEWATM_LIMIT         VARCHAR2(10 BYTE),
  CUC_OLDPOS_LIMIT         VARCHAR2(10 BYTE),
  CUC_NEWPOS_LIMIT         VARCHAR2(10 BYTE),
  CUC_DONE_FLAG            VARCHAR2(1 BYTE),
  CUC_PROCESS_DATE         DATE,
  CUC_PROCESS_USED         VARCHAR2(1 BYTE),
  CUC_PROCESS_RESULT       VARCHAR2(300 BYTE),
  CUC_LUPD_USER            NUMBER(5),
  CUC_INST_CODE            NUMBER(10),
  CUC_INS_DATE             DATE,
  CUC_INS_USER             NUMBER(10),
  CUC_REMARKS              VARCHAR2(100 BYTE),
  CUC_UPDCRD_LIMIT_PARAM1  VARCHAR2(10 BYTE),
  CUC_UPDCRD_LIMIT_PARAM2  VARCHAR2(10 BYTE),
  CUC_PAN_CODE_ENCR        RAW(100)
)
TABLESPACE CMS_BIG_TXN
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

