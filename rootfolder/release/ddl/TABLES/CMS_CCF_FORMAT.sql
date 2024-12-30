CREATE TABLE VMSCMS.CMS_CCF_FORMAT
(
  CCF_INST_CODE         NUMBER(3),
  CCF_SECTION_NAME      VARCHAR2(20 BYTE),
  CCF_SEQUENCE_ID       NUMBER(5),
  CCF_TITLE_NAME        VARCHAR2(50 BYTE),
  CCI_TITLE_DESC        VARCHAR2(100 BYTE),
  CCI_VALUE_LENGTH      NUMBER(3),
  CCI_VALUE_ATTRIBUTES  VARCHAR2(10 BYTE),
  CCI_VALUE             VARCHAR2(20 BYTE),
  CCI_INS_USER          NUMBER(5),
  CCI_INS_DATE          DATE,
  CCI_LUPD_USER         NUMBER(5),
  CCI_LUPD_DATE         DATE
)
TABLESPACE CMS_SML_TXN
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

