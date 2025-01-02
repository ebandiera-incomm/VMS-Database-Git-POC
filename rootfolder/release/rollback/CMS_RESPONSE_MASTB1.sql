DECLARE
    V_CHK_TAB   NUMBER;
    V_ERR       VARCHAR2 (1000);
    V_CNT       NUMBER (2);
BEGIN
    SELECT COUNT (1)
      INTO V_CHK_TAB
      FROM ALL_OBJECTS
     WHERE     OBJECT_TYPE = 'TABLE'
           AND OWNER = 'VMSCMS'
           AND OBJECT_NAME = 'CMS_RESPONSE_MAST_R90B1';

    IF V_CHK_TAB = 1
    THEN
        DELETE FROM
            VMSCMS.CMS_RESPONSE_MAST
              WHERE (CMS_INST_CODE, CMS_DELIVERY_CHANNEL, CMS_RESPONSE_ID) IN
                        (SELECT CMS_INST_CODE,
                                CMS_DELIVERY_CHANNEL,
                                CMS_RESPONSE_ID
                           FROM VMSCMS.CMS_RESPONSE_MAST_R90B1);

        DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' rows deleted ');
    ELSE
        DBMS_OUTPUT.PUT_LINE ('Backup Object Not Found');
    END IF;
EXCEPTION
    WHEN OTHERS
    THEN
        V_ERR := SUBSTR (SQLERRM, 1, 100);
        DBMS_OUTPUT.PUT_LINE ('Main Excp ' || V_ERR);
END;
/