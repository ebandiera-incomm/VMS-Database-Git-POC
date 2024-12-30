CREATE TABLE VMSCMS.CMS_EXPIRYCARD_CLOSE_DETAIL
(
  CED_INST_CODE      NUMBER(5),
  CED_PAN_CODE       VARCHAR2(90 BYTE),
  CED_REMARK         VARCHAR2(50 BYTE),
  CED_PROCESS_FLAG   VARCHAR2(1 BYTE),
  CED_PROCESS_MSG    VARCHAR2(300 BYTE),
  CED_PROCESS_MODE   VARCHAR2(1 BYTE),
  CED_INS_USER       NUMBER(10),
  CED_INS_DATE       DATE,
  CED_LUPD_USER      NUMBER(10),
  CED_LUPD_DATE      DATE,
  CED_PAN_CODE_ENCR  RAW(100)
)
TABLESPACE CMS_BIG_TXN
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

