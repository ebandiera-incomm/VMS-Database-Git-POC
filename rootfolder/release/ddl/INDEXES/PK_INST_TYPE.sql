CREATE UNIQUE INDEX VMSCMS.PK_INST_TYPE ON VMSCMS.CMS_INST_TYPE
(CIT_INST_CODE, CIT_TYPE_CODE)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;

