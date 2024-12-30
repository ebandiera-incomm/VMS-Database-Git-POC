CREATE UNIQUE INDEX VMSCMS.PK_PINMAILER_MAST ON VMSCMS.CMS_PINMAILER_MAST
(CPM_PINMAILER_CODE)
LOGGING
TABLESPACE INCOMM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;

