CREATE TABLE VMSCMS.CMS_CAF_B24
(
  CCB_INST_CODE     NUMBER(3),
  CCB_PART_FULL     VARCHAR2(1 BYTE),
  CCB_REF_GROUP     VARCHAR2(4 BYTE),
  CCB_B24_VER       VARCHAR2(2 BYTE),
  CCB_LOGI_NTWK     VARCHAR2(4 BYTE),
  CCB_IMPAC_REF     VARCHAR2(1 BYTE),
  CCB_PREAUTH_HOLD  VARCHAR2(1 BYTE),
  CCB_CVV_VALUE     VARCHAR2(3 BYTE),
  CCB_SERVICE_CODE  VARCHAR2(3 BYTE),
  CCB_INS_USER      NUMBER(5)                   NOT NULL,
  CCB_INS_DATE      DATE                        NOT NULL,
  CCB_LUPD_USER     NUMBER(5)                   NOT NULL,
  CCB_LUPD_DATE     DATE                        NOT NULL,
  CCB_CGI_LN        VARCHAR2(4 BYTE)            DEFAULT NULL
)
TABLESPACE CMS_BIG_TXN
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

