CREATE TABLE VMSCMS.CMS_ADDRESSVERI_RESP
(
  CAR_INST_CODE    NUMBER(3),
  CAR_RESPONSE_ID  VARCHAR2(5 BYTE),
  CAR_RESP_DESC    VARCHAR2(300 BYTE),
  CAR_INS_USER     NUMBER(5),
  CAR_INS_DATE     DATE,
  CAR_LUPD_USER    NUMBER(5),
  CAR_LUPD_DATE    DATE
)
TABLESPACE CMS_BIG_TXN
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

