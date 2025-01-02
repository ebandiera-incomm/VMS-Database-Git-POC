CREATE UNIQUE INDEX VMSCMS.UK_BANK_DTL ON VMSCMS.CMS_GIROAPPL_FORMAT
(CAD_BO_NAME, CAD_CUST_NAME, CAD_BR_NAME, CAD_CUSTREF_NO, CAD_MANDATEACC_NO)
LOGGING
TABLESPACE INCOMM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;

