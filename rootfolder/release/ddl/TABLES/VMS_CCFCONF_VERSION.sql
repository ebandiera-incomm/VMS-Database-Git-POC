CREATE TABLE VMSCMS.VMS_CCFCONF_VERSION
  (
    VCV_INST_CODE    NUMBER(3,0) NOT NULL ENABLE,
    VCV_VERSION_NAME VARCHAR2(10 BYTE),
    VCV_INS_USER     NUMBER(5,0),
    VCV_INS_DATE DATE NOT NULL ENABLE,
    VCV_LUPD_USER NUMBER(5,0),
    VCV_LUPD_DATE DATE NOT NULL ENABLE,
    CONSTRAINT PK_VMS_CCFCONF_VERSION PRIMARY KEY (VCV_INST_CODE, VCV_VERSION_NAME)
  );