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
           AND OBJECT_NAME = 'CMS_INST_PARAM_R93B1';

    IF V_CHK_TAB = 1
    THEN
        SELECT COUNT (1)
          INTO V_CNT
          FROM VMSCMS.CMS_INST_PARAM
         WHERE     CIP_PARAM_KEY = 'CONSUMED_FLAG_DISABLED_PORTFOLIOS'
               AND CIP_INST_CODE = 1
               AND CIP_PARAM_DESC = 'Consumed Flag Disabled Portfolios';

        IF V_CNT = 0
        THEN
            INSERT INTO VMSCMS.CMS_INST_PARAM_R93B1 (CIP_INST_CODE,
                                                     CIP_PARAM_KEY,
                                                     CIP_PARAM_DESC,
                                                     CIP_PARAM_VALUE,
                                                     CIP_INS_USER,
                                                     CIP_INS_DATE,
                                                     CIP_LUPD_USER,
                                                     CIP_LUPD_DATE,
                                                     CIP_ALLOWED_VALUES,
                                                     CIP_MANDATORY_FLAG,
                                                     CIP_DISPLAY_FLAG,
                                                     CIP_PARAM_UNIT,
                                                     CIP_PARAM_DISP_TYPE,
                                                     CIP_MULTILING_DESC,
                                                     CIP_VALIDATION_TYPE)
                 VALUES (1,
                         'CONSUMED_FLAG_DISABLED_PORTFOLIOS',
                         'Consumed Flag Disabled Portfolios',
                         'B2B (SINGLE LOAD),B2B (RELOADABLE)',
                         1,
                         TO_DATE (SYSDATE, 'DD-MON-RR'),
                         1,
                         TO_DATE (SYSDATE, 'DD-MON-RR'),
                         NULL,
                         'Y',
                         'Y',
                         NULL,
                         'TEXT',
                         NULL,
                         NULL);
        END IF;

        INSERT INTO VMSCMS.CMS_INST_PARAM
            SELECT *
              FROM VMSCMS.CMS_INST_PARAM_R93B1
             WHERE (CIP_INST_CODE,
                    CIP_PARAM_KEY,
                    CIP_PARAM_DESC,
                    CIP_PARAM_VALUE,
                    CIP_INS_USER,
                    CIP_INS_DATE,
                    CIP_LUPD_USER,
                    CIP_LUPD_DATE,
                    CIP_ALLOWED_VALUES,
                    CIP_MANDATORY_FLAG,
                    CIP_DISPLAY_FLAG,
                    CIP_PARAM_UNIT,
                    CIP_PARAM_DISP_TYPE,
                    CIP_MULTILING_DESC,
                    CIP_VALIDATION_TYPE) NOT IN
                       (SELECT CIP_INST_CODE,
                               CIP_PARAM_KEY,
                               CIP_PARAM_DESC,
                               CIP_PARAM_VALUE,
                               CIP_INS_USER,
                               CIP_INS_DATE,
                               CIP_LUPD_USER,
                               CIP_LUPD_DATE,
                               CIP_ALLOWED_VALUES,
                               CIP_MANDATORY_FLAG,
                               CIP_DISPLAY_FLAG,
                               CIP_PARAM_UNIT,
                               CIP_PARAM_DISP_TYPE,
                               CIP_MULTILING_DESC,
                               CIP_VALIDATION_TYPE
                          FROM VMSCMS.CMS_INST_PARAM);

        DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' rows Inserted ');
    END IF;
EXCEPTION
    WHEN OTHERS
    THEN
        V_ERR := SUBSTR (SQLERRM, 1, 100);
        DBMS_OUTPUT.PUT_LINE ('Main Excp ' || V_ERR);
END;
/