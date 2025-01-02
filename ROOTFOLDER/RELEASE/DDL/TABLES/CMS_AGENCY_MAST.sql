CREATE TABLE VMSCMS.CMS_AGENCY_MAST
(
  CAM_AGENCY_NAME    VARCHAR2(20 BYTE),
  CAM_AGENCY_ID      VARCHAR2(10 BYTE),
  CAM_AGENCY_CODE    VARCHAR2(10 BYTE),
  CAM_FIRST_NAME     VARCHAR2(20 BYTE),
  CAM_MIDDLE_NAME    VARCHAR2(10 BYTE),
  CAM_LAST_NAME      VARCHAR2(20 BYTE),
  CAM_STREET         VARCHAR2(25 BYTE),
  CAM_CITY           VARCHAR2(20 BYTE),
  CAM_STATE          VARCHAR2(20 BYTE),
  CAM_COUNTRY        VARCHAR2(20 BYTE),
  CAM_PIN            VARCHAR2(10 BYTE),
  CAM_PHONE_NO       VARCHAR2(12 BYTE),
  CAM_EMAIL          VARCHAR2(30 BYTE),
  CAM_INPUTFILE_ID   VARCHAR2(15 BYTE),
  CAM_OUTPUTFILE_ID  VARCHAR2(15 BYTE),
  CAM_INS_USER       NUMBER(6),
  CAM_INS_DATE       DATE,
  CAM_LUPD_USER      NUMBER(6),
  CAM_LUPD_DATE      DATE,
  CAM_INST_CODE      NUMBER(10)
)
TABLESPACE CMS_MAST
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


ALTER TABLE VMSCMS.CMS_AGENCY_MAST ADD (
  CONSTRAINT PK_AGENCY_MAST
 PRIMARY KEY
 (CAM_AGENCY_ID))
/
