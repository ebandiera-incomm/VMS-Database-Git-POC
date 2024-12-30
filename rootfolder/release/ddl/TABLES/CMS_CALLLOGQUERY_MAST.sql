CREATE TABLE VMSCMS.CMS_CALLLOGQUERY_MAST
(
  CUT_INST_CODE   NUMBER(5),
  CUT_DEVL_CHNL   VARCHAR2(2 BYTE),
  CUT_TXN_CODE    VARCHAR2(2 BYTE),
  CUT_TABLE_LIST  VARCHAR2(500 BYTE),
  CUT_COLM_LIST   VARCHAR2(1000 BYTE),
  CUT_COLM_QURY   VARCHAR2(2000 BYTE),
  CUT_INS_USER    NUMBER(5)                     NOT NULL,
  CUT_INS_DATE    DATE                          NOT NULL,
  CUT_LUPD_USER   NUMBER(5),
  CUT_LUPD_DATE   DATE
)
TABLESPACE CMS_MAST
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

