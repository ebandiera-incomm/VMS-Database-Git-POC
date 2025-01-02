CREATE TABLE VMSCMS.CMS_ODFI_ACH_MAST
(
  COA_INST_CODE  NUMBER(3),
  COA_PROD_CODE  VARCHAR2(6 BYTE),
  COA_ODFI_CODE  NUMBER(8),
  COA_INS_DATE   DATE                           NOT NULL,
  COA_INS_USER   NUMBER                         NOT NULL,
  COA_LUPD_DATE  DATE                           NOT NULL,
  COA_LUPD_USER  NUMBER                         NOT NULL
)
TABLESPACE CMS_MAST
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


ALTER TABLE VMSCMS.CMS_ODFI_ACH_MAST ADD (
  CONSTRAINT PK_PROD_ODFI
 PRIMARY KEY
 (COA_INST_CODE, COA_PROD_CODE, COA_ODFI_CODE))
/

ALTER TABLE VMSCMS.CMS_ODFI_ACH_MAST ADD (
  CONSTRAINT FK_LUPD_USER 
 FOREIGN KEY (COA_LUPD_USER) 
 REFERENCES VMSCMS.CMS_USER_MAST (CUM_USER_PIN),
  CONSTRAINT FK_INS_USER 
 FOREIGN KEY (COA_INS_USER) 
 REFERENCES VMSCMS.CMS_USER_MAST (CUM_USER_PIN),
  CONSTRAINT FK_PROD_ACH_MAST 
 FOREIGN KEY (COA_INST_CODE, COA_PROD_CODE) 
 REFERENCES VMSCMS.CMS_PROD_MAST (CPM_INST_CODE,CPM_PROD_CODE))
/
