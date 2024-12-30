CREATE UNIQUE INDEX VMSCMS.PK_PROD_LIMITS ON VMSCMS.CMS_PROD_LIMITS
(CPL_INST_CODE, CPL_PROD_CODE, CPL_CARD_TYPE, CPL_CUST_CATG)
LOGGING
TABLESPACE INCOMM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;

