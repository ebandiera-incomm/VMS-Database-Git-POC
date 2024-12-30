CREATE UNIQUE INDEX VMSCMS.PK_GEN_COL ON VMSCMS.CMS_GEN_COL_MAPPING
(CGM_INST_CODE, CGM_TABLE_NAME, CGM_COLUMN_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;

