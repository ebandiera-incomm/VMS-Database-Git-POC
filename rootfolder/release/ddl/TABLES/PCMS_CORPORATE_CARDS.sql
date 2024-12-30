CREATE TABLE VMSCMS.PCMS_CORPORATE_CARDS
(
  PCC_INST_CODE  NUMBER(10),
  PCC_CORP_CODE  VARCHAR2(4 BYTE),
  PCC_PAN_NO     VARCHAR2(19 BYTE),
  PCC_INS_USER   NUMBER(10),
  PCC_INS_DATE   DATE,
  PCC_LUPD_USER  NUMBER(10),
  PCC_LUPD_DATE  DATE
)
TABLESPACE CMS_SML_TXN
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


ALTER TABLE VMSCMS.PCMS_CORPORATE_CARDS ADD (
  CONSTRAINT PK_CORPORATE_PANCODE
 PRIMARY KEY
 (PCC_INST_CODE, PCC_PAN_NO))
/
