SPOOL $VMS_HOME/JAN_VMSGPRHOST_R91_RELEASE/ROOTFOLDER/LOG/CHECK_INVALID_CNT.log;

PROMPT     *** Truncating Objects req for Invalid cnt   *****

TRUNCATE TABLE vmscms.vms_edition_invalid_cnt_ebr;

PROMPT     *** INSERT Before-Deployment Invalid Count   *****

INSERT INTO vmscms.vms_edition_invalid_cnt (deploymnt_ind,edition_name,invalid_cnt)
    SELECT 0, edition_name, COUNT(*)
      FROM dba_objects_ae
     WHERE owner = ANY ( 'VMSCMS','FSFW','VMSCMS_NONEBR' )
       AND status <> 'VALID'
    GROUP BY edition_name;

COMMIT;
