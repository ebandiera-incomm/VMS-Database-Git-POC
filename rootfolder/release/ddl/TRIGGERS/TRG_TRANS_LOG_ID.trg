CREATE OR REPLACE TRIGGER VMSCMS.TRG_TRANS_LOG_ID
         BEFORE INSERT ON VMSCMS.PCMS_INVENTORY_TRANSACTION_LOG         FOR EACH ROW
BEGIN      --Trigger body begins
        select SEQ_TRANS_LOG_ID.NEXTVAL into :new.TRANS_LOG_ID from dual;
      END;
/

