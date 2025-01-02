CREATE UNIQUE INDEX VMSCMS.PK_STATE_MAST ON VMSCMS.GEN_STATE_MAST
(GSM_INST_CODE, GSM_CNTRY_CODE, GSM_STATE_CODE)
LOGGING
TABLESPACE INCOMM
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

