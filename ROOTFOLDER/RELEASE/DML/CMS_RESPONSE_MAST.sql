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
           AND OBJECT_NAME = 'CMS_RESPONSE_MAST_R91B1';

    IF V_CHK_TAB = 1
    THEN
        SELECT COUNT (1)
          INTO V_CNT
          FROM VMSCMS.CMS_RESPONSE_MAST
         WHERE     CMS_INST_CODE = '1'
               AND CMS_DELIVERY_CHANNEL = '3'
               AND CMS_RESPONSE_ID = '324';

        IF V_CNT = 0
        THEN
            INSERT INTO VMSCMS.CMS_RESPONSE_MAST_R91B1 (CMS_INST_CODE,
                                                        CMS_DELIVERY_CHANNEL,
                                                        CMS_RESPONSE_ID,
                                                        CMS_ISO_RESPCDE,
                                                        CMS_B24_RESPCDE,
                                                        CMS_RESP_DESC,
                                                        CMS_INS_USER,
                                                        CMS_INS_DATE,
                                                        CMS_LUPD_USER,
                                                        CMS_LUPD_DATE)
                     VALUES (
                                1,
                                '3',
                                '324',
                                '324',
                                '324',
                                'DISPUTE IS DECLINED DUE TO REFUND CHECK IS NOT ELIGIBLE',
                                1,
                                SYSDATE,
                                1,
                                SYSDATE);
        END IF;

        INSERT INTO VMSCMS.CMS_RESPONSE_MAST
            SELECT *
              FROM VMSCMS.CMS_RESPONSE_MAST_R91B1
             WHERE (CMS_INST_CODE,
                    CMS_DELIVERY_CHANNEL,
                    CMS_RESPONSE_ID,
                    CMS_ISO_RESPCDE,
                    CMS_B24_RESPCDE,
                    CMS_RESP_DESC,
                    CMS_INS_USER,
                    CMS_INS_DATE,
                    CMS_LUPD_USER,
                    CMS_LUPD_DATE) NOT IN
                       (SELECT CMS_INST_CODE,
                               CMS_DELIVERY_CHANNEL,
                               CMS_RESPONSE_ID,
                               CMS_ISO_RESPCDE,
                               CMS_B24_RESPCDE,
                               CMS_RESP_DESC,
                               CMS_INS_USER,
                               CMS_INS_DATE,
                               CMS_LUPD_USER,
                               CMS_LUPD_DATE
                          FROM VMSCMS.CMS_RESPONSE_MAST);

        DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' rows Inserted ');
    END IF;
EXCEPTION
    WHEN OTHERS
    THEN
        V_ERR := SUBSTR (SQLERRM, 1, 100);
        DBMS_OUTPUT.PUT_LINE ('Main Excp ' || V_ERR);
END;
/