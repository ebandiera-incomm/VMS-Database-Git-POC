alter table vmscms.cms_txn_iso_detl_ebr add (cti_de61_tag136_merchantcountryoforigin varchar2(20));

alter table vmscms.transactionlog_ebr add(de61_tag136_merchantcountryoforigin varchar2(20));

alter table VMSCMS_HISTORY.TRANSACTIONLOG_HIST_EBR  add(de61_tag136_merchantcountryoforigin varchar2(20));

alter table DORMANT.CMS_TXN_ISO_DETL_EBR add (cti_de61_tag136_merchantcountryoforigin varchar2(20));

alter table VMSCMS_HISTORY.CMS_TXN_ISO_DETL_HIST_EBR ADD (cti_de61_tag136_merchantcountryoforigin varchar2(20));

alter table DORMANT.TRANSACTIONLOG_EBR add(de61_tag136_merchantcountryoforigin varchar2(20));

DECLARE
    V_ERR_MSG   VARCHAR2 (1000);
BEGIN
    VMSCMS.SP_CREATE_EDITIONING_VIEW ('TRANSACTIONLOG',
                                      'TRANSACTIONLOG_EBR',
                                      V_ERR_MSG);
                                      
    VMSCMS.SP_CREATE_EDITIONING_VIEW ('CMS_TXN_ISO_DETL',
                                      'CMS_TXN_ISO_DETL_EBR',
                                      V_ERR_MSG);

    DORMANT.SP_CREATE_EDITIONING_VIEW ('CMS_TXN_ISO_DETL',
                                       'CMS_TXN_ISO_DETL_EBR',
                                       V_ERR_MSG);

    VMSCMS_HISTORY.SP_CREATE_EDITIONING_VIEW ('CMS_TXN_ISO_DETL_HIST',
                                              'CMS_TXN_ISO_DETL_HIST_EBR',
                                              V_ERR_MSG);

    DORMANT.SP_CREATE_EDITIONING_VIEW ('TRANSACTIONLOG',
                                       'TRANSACTIONLOG_EBR',
                                       V_ERR_MSG);

    VMSCMS_HISTORY.SP_CREATE_EDITIONING_VIEW ('TRANSACTIONLOG_HIST',
                                              'TRANSACTIONLOG_HIST_EBR',
                                              V_ERR_MSG);

    IF V_ERR_MSG <> 'OK'
    THEN
        DBMS_OUTPUT.PUT_LINE (V_ERR_MSG);
    END IF;
EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE (
               'ERROR WHILE CALLING SP_CREATE_EDITIONING_VIEW PROCEDURE '
            || SUBSTR (SQLERRM, 1, 200));
END;
/