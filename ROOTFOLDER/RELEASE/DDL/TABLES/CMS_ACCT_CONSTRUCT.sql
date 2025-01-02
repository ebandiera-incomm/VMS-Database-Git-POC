CREATE TABLE VMSCMS.CMS_ACCT_CONSTRUCT
(
  CAC_INST_CODE     VARCHAR2(5 BYTE),
  CAC_PROFILE_CODE  VARCHAR2(5 BYTE),
  CAC_FIELD_NAME    VARCHAR2(50 BYTE),
  CAC_START         VARCHAR2(3 BYTE)            DEFAULT 1,
  CAC_LENGTH        VARCHAR2(3 BYTE),
  CAC_VALUE         VARCHAR2(5 BYTE),
  CAC_TOT_LENGTH    VARCHAR2(3 BYTE),
  CAC_ORDER_BY      VARCHAR2(2 BYTE),
  CAC_START_FROM    VARCHAR2(3 BYTE),
  CAC_LUPD_DATE     DATE,
  CAC_LUPD_USER     NUMBER(10),
  CAC_INS_DATE      DATE,
  CAC_INS_USER      NUMBER(10)
)
TABLESPACE CMS_BIG_TXN
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


ALTER TABLE VMSCMS.CMS_ACCT_CONSTRUCT ADD (
  CONSTRAINT CK_ACCTCONSTRUCT_CAC_START
 CHECK (CAC_START =1))
/

ALTER TABLE VMSCMS.CMS_ACCT_CONSTRUCT ADD (
  CONSTRAINT FK_ACCTCONSTRUCT_PROFILECODE 
 FOREIGN KEY (CAC_PROFILE_CODE) 
 REFERENCES VMSCMS.CMS_PROFILE_MAST (CPM_PROFILE_CODE))
/
