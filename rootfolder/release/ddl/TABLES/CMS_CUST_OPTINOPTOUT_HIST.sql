CREATE TABLE VMSCMS.CMS_CUST_OPTINOPTOUT_HIST
(
  CCO_INST_CODE           NUMBER(3)             NOT NULL,
  CCO_CUST_CODE           NUMBER(10)            NOT NULL,
  CCO_OPTINOPTOUT_STATUS  CHAR(1 BYTE)          NOT NULL,
  CCO_INS_USER            NUMBER(5)             NOT NULL,
  CCO_INS_DATE            DATE                  NOT NULL,
  CCO_LUPD_USER           NUMBER(5),
  CCO_LUPD_DATE           DATE,
  CCO_OPTOUTALERT_STATUS  CHAR(1 BYTE),
  CCO_FILE_NAME           VARCHAR2(100 BYTE)
)
TABLESPACE CMS_BIG_TXN
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

