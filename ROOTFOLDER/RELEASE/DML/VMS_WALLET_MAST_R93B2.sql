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
           AND OBJECT_NAME = 'VMS_WALLET_MAST_R93B2';

    IF V_CHK_TAB = 1
    THEN
        SELECT COUNT (1)
          INTO V_CNT
          FROM VMSCMS.VMS_WALLET_MAST
         WHERE     VWM_NETWORK_ID = 'MasterCard'
               AND VWM_WALLET_ID = '50110030273';

        IF V_CNT = 0
        THEN
            INSERT INTO VMSCMS.VMS_WALLET_MAST_R93B2 (VWM_WALLET_ID,
                                                      VWM_WALLET_NAME,
                                                      VWM_NETWORK_ID,
                                                      VWM_INS_USER,
                                                      VWM_INS_DATE,
                                                      VWM_LUPD_USER,
                                                      VWM_LUPD_DATE,
                                                      VWM_WALLET_PROVIDERID)
                 VALUES ('50110030273',
                         'Apple Pay',
                         'MasterCard',
                         1,
                         SYSDATE,
                         1,
                         SYSDATE,
                         NULL);
        END IF;

        INSERT INTO VMSCMS.VMS_WALLET_MAST
            SELECT *
              FROM VMSCMS.VMS_WALLET_MAST_R93B2
             WHERE (VWM_NETWORK_ID,
                    VWM_WALLET_ID,
                    VWM_WALLET_NAME,
                    VWM_INS_USER,
                    VWM_INS_DATE,
                    VWM_LUPD_USER,
                    VWM_LUPD_DATE,
                    VWM_WALLET_PROVIDERID) NOT IN
                       (SELECT VWM_NETWORK_ID,
                               VWM_WALLET_ID,
                               VWM_WALLET_NAME,
                               VWM_INS_USER,
                               VWM_INS_DATE,
                               VWM_LUPD_USER,
                               VWM_LUPD_DATE,
                               VWM_WALLET_PROVIDERID
                          FROM VMSCMS.VMS_WALLET_MAST);

        DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' ROWS INSERTED ');
    END IF;
EXCEPTION
    WHEN OTHERS
    THEN
        V_ERR := SUBSTR (SQLERRM, 1, 100);
        DBMS_OUTPUT.PUT_LINE ('MAIN EXCP ' || V_ERR);
END;
/