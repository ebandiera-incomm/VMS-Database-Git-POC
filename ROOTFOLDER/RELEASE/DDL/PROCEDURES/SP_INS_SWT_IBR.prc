CREATE OR REPLACE PROCEDURE VMSCMS.SP_INS_SWT_IBR(ERRMSG OUT VARCHAR2) IS
  -- Minus amt Records
  --cursor c_Rev IS select RSB_PAN,RSB_SEQ_NUM , ROWID FROM REC_SWT_BASE2ONUS_IBR_TEMP WHERE SUBSTR(RSB_TRAN_TYP,1,2) = '04' AND  RSB_RESP IN ('000','001');
  --c_Rowid varchar2(25);
  --c_No_trans number(4);
BEGIN
  ERRMSG := 'OK';
  -- DELETE FROM REVRSAL TEMP TABLE
  DELETE FROM REC_SWT_BASE2ONUS_IBR_R_TEMP;
  DELETE FROM REC_SWT_BASE2OFFUS_IBR_R_TEMP;
  -- UPDATED AS ON 14 Aug 03 Using process Date insted of tran date
  DELETE FROM REC_SWT_BASE2ONUS_IBR_REV
   WHERE RSB_PROCESS_DATE <=
         (SELECT MAX(RSB_PROCESS_DATE) - 5 FROM REC_SWT_BASE2ONUS_IBR_REV);
  DELETE FROM REC_SWT_BASE2OFFUS_IBR_REV
   WHERE RSB_PROCESS_DATE <=
         (SELECT MAX(RSB_PROCESS_DATE) - 5 FROM REC_SWT_BASE2OFFUS_IBR_REV);
  -- DELETE THE TRANS WHICH HAVING MESSAGE TYPE AS 540
  DELETE FROM REC_SWT_BASE2ONUS_IBR_TEMP WHERE RSB_TRAN_TYP = '0540';
  DELETE FROM REC_SWT_BASE2OFFUS_IBR_TEMP WHERE RSB_TRAN_TYP = '0540';
  -- UPDATE TRANS FOR PARTIAL REVRSAL
  UPDATE REC_SWT_BASE2ONUS_IBR_TEMP
     SET RSB_TRAN_TYP = '0420'
   WHERE RSB_RVSL_CDE <> '00' AND SUBSTR(RSB_TRAN_TYP, 1, 2) <> '04';
  UPDATE REC_SWT_BASE2ONUS_IBR_TEMP
     SET RSB_TRAN_TYP = '0220', RSB_AMT1 = RSB_AMT2, RSB_AMT2 = 0
   WHERE TO_NUMBER(RSB_AMT2) <> 0 AND
         TO_NUMBER(RSB_AMT2) <> TO_NUMBER(RSB_AMT1) AND
         SUBSTR(RSB_TRAN_TYP, 1, 2) = '04';
  UPDATE REC_SWT_BASE2OFFUS_IBR_TEMP
     SET RSB_TRAN_TYP = '0420'
   WHERE RSB_RVSL_CDE <> '00' AND SUBSTR(RSB_TRAN_TYP, 1, 2) <> '04';
  UPDATE REC_SWT_BASE2OFFUS_IBR_TEMP
     SET RSB_TRAN_TYP = '0220', RSB_AMT1 = RSB_AMT2, RSB_AMT2 = 0
   WHERE TO_NUMBER(RSB_AMT2) <> 0 AND
         TO_NUMBER(RSB_AMT2) <> TO_NUMBER(RSB_AMT1) AND
         SUBSTR(RSB_TRAN_TYP, 1, 2) = '04';
  -- amt2 is meaningful only for revesals in case of atm
  UPDATE REC_SWT_BASE2ONUS_IBR_TEMP
     SET RSB_AMT2 = '0'
   WHERE SUBSTR(RSB_TRAN_TYP, 1, 2) <> '04' AND RSB_TRAN_TYP <> '0220';
  UPDATE REC_SWT_BASE2OFFUS_IBR_TEMP
     SET RSB_AMT2 = '0'
   WHERE SUBSTR(RSB_TRAN_TYP, 1, 2) <> '04' AND RSB_TRAN_TYP <> '0220';
  UPDATE REC_SWT_BASE2ONUS_IBR_TEMP
     SET RSB_TRAN_TYP = '0210'
--Imran 31 Jan 2004, 0200 to be treated as Rejected
--   WHERE RSB_TRAN_TYP = '0200' or substr(RSB_TRAN_TYP, 1, 2) = '01';
   WHERE SUBSTR(RSB_TRAN_TYP, 1, 2) = '01';
  UPDATE REC_SWT_BASE2ONUS_IBR_TEMP
     SET RSB_REV_FLAG = 'Y'
   WHERE SUBSTR(RSB_TRAN_TYP, 1, 2) = '04' AND RSB_RESP IN ('000', '001');
  UPDATE REC_SWT_BASE2OFFUS_IBR_TEMP
     SET RSB_TRAN_TYP = '0210'
--Imran 31 Jan 2004, 0200 to be treated as Rejected
--   WHERE RSB_TRAN_TYP = '0200' or substr(RSB_TRAN_TYP, 1, 2) = '01';
   WHERE SUBSTR(RSB_TRAN_TYP, 1, 2) = '01';
  UPDATE REC_SWT_BASE2OFFUS_IBR_TEMP
     SET RSB_REV_FLAG = 'Y'
   WHERE SUBSTR(RSB_TRAN_TYP, 1, 2) = '04' AND RSB_RESP IN ('000', '001');
  -- Bal enquiry Trans Move to Final Recon Table
  INSERT INTO REC_SWT_BASE2ONUS_IBR_R_TEMP
    (RSB_PROCESS_DATE,
     RSB_FILE_TYPE,
     RSB_FILE_NAME,
     RSB_REC_TYP,
     RSB_TRAN_TYP,
     RSB_RESP_CDE,
     RSB_RVSL_CDE,
     RSB_POST_DAT,
     RSB_ACQ_INST_ID_NUM,
     RSB_TERM_ID,
     RSB_TERM_NAME_LOC,
     RSB_TERM_OWNER_NAME,
     RSB_TERM_CITY,
     RSB_TERM_ST_X,
     RSB_TERM_CNTRY_X,
     RSB_SEQ_NUM,
     RSB_INVOICE_NUM,
     RSB_RETL_ID,
     RSB_TRAN_CDE,
     RSB_RESPONDER,
     RSB_PAN,
     RSB_MBR_NUM,
     RSB_AMT1,
     RSB_AMT2,
     RSB_SETL_CRNCY_CDE,
     RSB_SETL_CONV_RATE,
     RSB_TRAN_DAT,
     RSB_TRAN_TIM,
     RSB_PT_SRV_COND_CDE,
     RSB_PT_SRV_ENTRY_MDE,
     RSB_FROM_ACCT_TYP,
     RSB_FROM_ACCT,
     RSB_ORIG_CRNCY_CDE,
     RSB_RESP,
     RSB_MAT_CAT_CODE,
     RSB_ERR_FLAG,
     RSB_TO_ACCT_TYP,
     RSB_TO_ACCT,
     RSB_REC_GEN,
     RSB_LUPD_DAT,
     RSB_MAN_REC,
     RSB_RRN,
     RSB_REV_FLAG,
     RSB_TRACE_NUM)
    SELECT RSB_PROCESS_DATE,
           RSB_FILE_TYPE,
           RSB_FILE_NAME,
           RSB_REC_TYP,
           RSB_TRAN_TYP,
           RSB_RESP_CDE,
           RSB_RVSL_CDE,
           RSB_POST_DAT,
           RSB_ACQ_INST_ID_NUM,
           RSB_TERM_ID,
           RSB_TERM_NAME_LOC,
           RSB_TERM_OWNER_NAME,
           RSB_TERM_CITY,
           RSB_TERM_ST_X,
           RSB_TERM_CNTRY_X,
           RSB_SEQ_NUM,
           RSB_INVOICE_NUM,
           RSB_RETL_ID,
           RSB_TRAN_CDE,
           RSB_RESPONDER,
           RSB_PAN,
           RSB_MBR_NUM,
           RSB_AMT1,
           RSB_AMT2,
           RSB_SETL_CRNCY_CDE,
           RSB_SETL_CONV_RATE,
           RSB_TRAN_DAT,
           RSB_TRAN_TIM,
           RSB_PT_SRV_COND_CDE,
           RSB_PT_SRV_ENTRY_MDE,
           RSB_FROM_ACCT_TYP,
           RSB_FROM_ACCT,
           RSB_ORIG_CRNCY_CDE,
           RSB_RESP,
           RSB_MAT_CAT_CODE,
           RSB_ERR_FLAG,
           RSB_TO_ACCT_TYP,
           RSB_TO_ACCT,
           RSB_REC_GEN,
           RSB_LUPD_DAT,
           RSB_MAN_REC,
           RSB_RRN,
           RSB_REV_FLAG,
           RSB_TRACE_NUM
      FROM REC_SWT_BASE2ONUS_IBR_TEMP
     WHERE RSB_REV_FLAG = 'Y';
  INSERT INTO REC_SWT_BASE2OFFUS_IBR_R_TEMP
    (RSB_PROCESS_DATE,
     RSB_FILE_TYPE,
     RSB_FILE_NAME,
     RSB_REC_TYP,
     RSB_TRAN_TYP,
     RSB_RESP_CDE,
     RSB_RVSL_CDE,
     RSB_POST_DAT,
     RSB_ACQ_INST_ID_NUM,
     RSB_TERM_ID,
     RSB_TERM_NAME_LOC,
     RSB_TERM_OWNER_NAME,
     RSB_TERM_CITY,
     RSB_TERM_ST_X,
     RSB_TERM_CNTRY_X,
     RSB_SEQ_NUM,
     RSB_INVOICE_NUM,
     RSB_RETL_ID,
     RSB_TRAN_CDE,
     RSB_RESPONDER,
     RSB_PAN,
     RSB_MBR_NUM,
     RSB_AMT1,
     RSB_AMT2,
     RSB_SETL_CRNCY_CDE,
     RSB_SETL_CONV_RATE,
     RSB_TRAN_DAT,
     RSB_TRAN_TIM,
     RSB_PT_SRV_COND_CDE,
     RSB_PT_SRV_ENTRY_MDE,
     RSB_FROM_ACCT_TYP,
     RSB_FROM_ACCT,
     RSB_ORIG_CRNCY_CDE,
     RSB_RESP,
     RSB_MAT_CAT_CODE,
     RSB_ERR_FLAG,
     RSB_TO_ACCT_TYP,
     RSB_TO_ACCT,
     RSB_REC_GEN,
     RSB_LUPD_DAT,
     RSB_MAN_REC,
     RSB_RRN,
     RSB_REV_FLAG,
     RSB_TRACE_NUM)
    SELECT RSB_PROCESS_DATE,
           RSB_FILE_TYPE,
           RSB_FILE_NAME,
           RSB_REC_TYP,
           RSB_TRAN_TYP,
           RSB_RESP_CDE,
           RSB_RVSL_CDE,
           RSB_POST_DAT,
           RSB_ACQ_INST_ID_NUM,
           RSB_TERM_ID,
           RSB_TERM_NAME_LOC,
           RSB_TERM_OWNER_NAME,
           RSB_TERM_CITY,
           RSB_TERM_ST_X,
           RSB_TERM_CNTRY_X,
           RSB_SEQ_NUM,
           RSB_INVOICE_NUM,
           RSB_RETL_ID,
           RSB_TRAN_CDE,
           RSB_RESPONDER,
           RSB_PAN,
           RSB_MBR_NUM,
           RSB_AMT1,
           RSB_AMT2,
           RSB_SETL_CRNCY_CDE,
           RSB_SETL_CONV_RATE,
           RSB_TRAN_DAT,
           RSB_TRAN_TIM,
           RSB_PT_SRV_COND_CDE,
           RSB_PT_SRV_ENTRY_MDE,
           RSB_FROM_ACCT_TYP,
           RSB_FROM_ACCT,
           RSB_ORIG_CRNCY_CDE,
           RSB_RESP,
           RSB_MAT_CAT_CODE,
           RSB_ERR_FLAG,
           RSB_TO_ACCT_TYP,
           RSB_TO_ACCT,
           RSB_REC_GEN,
           RSB_LUPD_DAT,
           RSB_MAN_REC,
           RSB_RRN,
           RSB_REV_FLAG,
           RSB_TRACE_NUM
      FROM REC_SWT_BASE2OFFUS_IBR_TEMP
     WHERE RSB_REV_FLAG = 'Y';
  -- INSERT ALL REV TRANS INTO REC_SWT_SMS_REV
  INSERT INTO REC_SWT_BASE2ONUS_IBR_REV
    (RSB_PROCESS_DATE,
     RSB_FILE_TYPE,
     RSB_FILE_NAME,
     RSB_REC_TYP,
     RSB_TRAN_TYP,
     RSB_RESP_CDE,
     RSB_RVSL_CDE,
     RSB_POST_DAT,
     RSB_ACQ_INST_ID_NUM,
     RSB_TERM_ID,
     RSB_TERM_NAME_LOC,
     RSB_TERM_OWNER_NAME,
     RSB_TERM_CITY,
     RSB_TERM_ST_X,
     RSB_TERM_CNTRY_X,
     RSB_SEQ_NUM,
     RSB_INVOICE_NUM,
     RSB_RETL_ID,
     RSB_TRAN_CDE,
     RSB_RESPONDER,
     RSB_PAN,
     RSB_MBR_NUM,
     RSB_AMT1,
     RSB_AMT2,
     RSB_SETL_CRNCY_CDE,
     RSB_SETL_CONV_RATE,
     RSB_TRAN_DAT,
     RSB_TRAN_TIM,
     RSB_PT_SRV_COND_CDE,
     RSB_PT_SRV_ENTRY_MDE,
     RSB_FROM_ACCT_TYP,
     RSB_FROM_ACCT,
     RSB_ORIG_CRNCY_CDE,
     RSB_RESP,
     RSB_MAT_CAT_CODE,
     RSB_ERR_FLAG,
     RSB_TO_ACCT_TYP,
     RSB_TO_ACCT,
     RSB_REC_GEN,
     RSB_LUPD_DAT,
     RSB_MAN_REC,
     RSB_RRN,
     RSB_REV_FLAG,
     RSB_TRACE_NUM)
    SELECT RSB_PROCESS_DATE,
           RSB_FILE_TYPE,
           RSB_FILE_NAME,
           RSB_REC_TYP,
           RSB_TRAN_TYP,
           RSB_RESP_CDE,
           RSB_RVSL_CDE,
           RSB_POST_DAT,
           RSB_ACQ_INST_ID_NUM,
           RSB_TERM_ID,
           RSB_TERM_NAME_LOC,
           RSB_TERM_OWNER_NAME,
           RSB_TERM_CITY,
           RSB_TERM_ST_X,
           RSB_TERM_CNTRY_X,
           RSB_SEQ_NUM,
           RSB_INVOICE_NUM,
           RSB_RETL_ID,
           RSB_TRAN_CDE,
           RSB_RESPONDER,
           RSB_PAN,
           RSB_MBR_NUM,
           RSB_AMT1,
           RSB_AMT2,
           RSB_SETL_CRNCY_CDE,
           RSB_SETL_CONV_RATE,
           RSB_TRAN_DAT,
           RSB_TRAN_TIM,
           RSB_PT_SRV_COND_CDE,
           RSB_PT_SRV_ENTRY_MDE,
           RSB_FROM_ACCT_TYP,
           RSB_FROM_ACCT,
           RSB_ORIG_CRNCY_CDE,
           RSB_RESP,
           RSB_MAT_CAT_CODE,
           RSB_ERR_FLAG,
           RSB_TO_ACCT_TYP,
           RSB_TO_ACCT,
           RSB_REC_GEN,
           RSB_LUPD_DAT,
           RSB_MAN_REC,
           RSB_RRN,
           RSB_REV_FLAG,
           RSB_TRACE_NUM
      FROM REC_SWT_BASE2ONUS_IBR_TEMP
     WHERE RSB_REV_FLAG = 'Y';
  INSERT INTO REC_SWT_BASE2OFFUS_IBR_REV
    (RSB_PROCESS_DATE,
     RSB_FILE_TYPE,
     RSB_FILE_NAME,
     RSB_REC_TYP,
     RSB_TRAN_TYP,
     RSB_RESP_CDE,
     RSB_RVSL_CDE,
     RSB_POST_DAT,
     RSB_ACQ_INST_ID_NUM,
     RSB_TERM_ID,
     RSB_TERM_NAME_LOC,
     RSB_TERM_OWNER_NAME,
     RSB_TERM_CITY,
     RSB_TERM_ST_X,
     RSB_TERM_CNTRY_X,
     RSB_SEQ_NUM,
     RSB_INVOICE_NUM,
     RSB_RETL_ID,
     RSB_TRAN_CDE,
     RSB_RESPONDER,
     RSB_PAN,
     RSB_MBR_NUM,
     RSB_AMT1,
     RSB_AMT2,
     RSB_SETL_CRNCY_CDE,
     RSB_SETL_CONV_RATE,
     RSB_TRAN_DAT,
     RSB_TRAN_TIM,
     RSB_PT_SRV_COND_CDE,
     RSB_PT_SRV_ENTRY_MDE,
     RSB_FROM_ACCT_TYP,
     RSB_FROM_ACCT,
     RSB_ORIG_CRNCY_CDE,
     RSB_RESP,
     RSB_MAT_CAT_CODE,
     RSB_ERR_FLAG,
     RSB_TO_ACCT_TYP,
     RSB_TO_ACCT,
     RSB_REC_GEN,
     RSB_LUPD_DAT,
     RSB_MAN_REC,
     RSB_RRN,
     RSB_REV_FLAG,
     RSB_TRACE_NUM)
    SELECT RSB_PROCESS_DATE,
           RSB_FILE_TYPE,
           RSB_FILE_NAME,
           RSB_REC_TYP,
           RSB_TRAN_TYP,
           RSB_RESP_CDE,
           RSB_RVSL_CDE,
           RSB_POST_DAT,
           RSB_ACQ_INST_ID_NUM,
           RSB_TERM_ID,
           RSB_TERM_NAME_LOC,
           RSB_TERM_OWNER_NAME,
           RSB_TERM_CITY,
           RSB_TERM_ST_X,
           RSB_TERM_CNTRY_X,
           RSB_SEQ_NUM,
           RSB_INVOICE_NUM,
           RSB_RETL_ID,
           RSB_TRAN_CDE,
           RSB_RESPONDER,
           RSB_PAN,
           RSB_MBR_NUM,
           RSB_AMT1,
           RSB_AMT2,
           RSB_SETL_CRNCY_CDE,
           RSB_SETL_CONV_RATE,
           RSB_TRAN_DAT,
           RSB_TRAN_TIM,
           RSB_PT_SRV_COND_CDE,
           RSB_PT_SRV_ENTRY_MDE,
           RSB_FROM_ACCT_TYP,
           RSB_FROM_ACCT,
           RSB_ORIG_CRNCY_CDE,
           RSB_RESP,
           RSB_MAT_CAT_CODE,
           RSB_ERR_FLAG,
           RSB_TO_ACCT_TYP,
           RSB_TO_ACCT,
           RSB_REC_GEN,
           RSB_LUPD_DAT,
           RSB_MAN_REC,
           RSB_RRN,
           RSB_REV_FLAG,
           RSB_TRACE_NUM
      FROM REC_SWT_BASE2OFFUS_IBR_TEMP
     WHERE RSB_REV_FLAG = 'Y';
  -- INSERT ONLY VALID OR PROPER TRANS
  INSERT INTO REC_SWT_BASE2ONUS_IBR
    (RSB_PROCESS_DATE,
     RSB_FILE_TYPE,
     RSB_FILE_NAME,
     RSB_REC_TYP,
     RSB_TRAN_TYP,
     RSB_RESP_CDE,
     RSB_RVSL_CDE,
     RSB_POST_DAT,
     RSB_ACQ_INST_ID_NUM,
     RSB_TERM_ID,
     RSB_TERM_NAME_LOC,
     RSB_TERM_OWNER_NAME,
     RSB_TERM_CITY,
     RSB_TERM_ST_X,
     RSB_TERM_CNTRY_X,
     RSB_SEQ_NUM,
     RSB_INVOICE_NUM,
     RSB_RETL_ID,
     RSB_TRAN_CDE,
     RSB_RESPONDER,
     RSB_PAN,
     RSB_MBR_NUM,
     RSB_AMT1,
     RSB_AMT2,
     RSB_SETL_CRNCY_CDE,
     RSB_SETL_CONV_RATE,
     RSB_TRAN_DAT,
     RSB_TRAN_TIM,
     RSB_PT_SRV_COND_CDE,
     RSB_PT_SRV_ENTRY_MDE,
     RSB_FROM_ACCT_TYP,
     RSB_FROM_ACCT,
     RSB_ORIG_CRNCY_CDE,
     RSB_RESP,
     RSB_MAT_CAT_CODE,
     RSB_ERR_FLAG,
     RSB_TO_ACCT_TYP,
     RSB_TO_ACCT,
     RSB_REC_GEN,
     RSB_LUPD_DAT,
     RSB_MAN_REC,
     RSB_RRN,
     RSB_TRACE_NUM)
    SELECT RSB_PROCESS_DATE,
           RSB_FILE_TYPE,
           RSB_FILE_NAME,
           RSB_REC_TYP,
           RSB_TRAN_TYP,
           RSB_RESP_CDE,
           RSB_RVSL_CDE,
           RSB_POST_DAT,
           RSB_ACQ_INST_ID_NUM,
           RSB_TERM_ID,
           RSB_TERM_NAME_LOC,
           RSB_TERM_OWNER_NAME,
           RSB_TERM_CITY,
           RSB_TERM_ST_X,
           RSB_TERM_CNTRY_X,
           RSB_SEQ_NUM,
           RSB_INVOICE_NUM,
           RSB_RETL_ID,
           RSB_TRAN_CDE,
           RSB_RESPONDER,
           RSB_PAN,
           RSB_MBR_NUM,
           RSB_AMT1,
           RSB_AMT2,
           RSB_SETL_CRNCY_CDE,
           RSB_SETL_CONV_RATE,
           RSB_TRAN_DAT,
           RSB_TRAN_TIM,
           RSB_PT_SRV_COND_CDE,
           RSB_PT_SRV_ENTRY_MDE,
           RSB_FROM_ACCT_TYP,
           RSB_FROM_ACCT,
           RSB_ORIG_CRNCY_CDE,
           RSB_RESP,
           RSB_MAT_CAT_CODE,
           RSB_ERR_FLAG,
           RSB_TO_ACCT_TYP,
           RSB_TO_ACCT,
           RSB_REC_GEN,
           RSB_LUPD_DAT
          ,
           RSB_MAN_REC,
           RSB_RRN,
           RSB_TRACE_NUM
      FROM REC_SWT_BASE2ONUS_IBR_TEMP
     WHERE RSB_REV_FLAG = 'N' AND RSB_TRAN_CDE != '30' AND
--Imran 31 Jan 2004, 0200 to be treated as Rejected
           rsb_tran_typ<>'0200' AND
--Imran 31 Jan 2004, 0200 to be treated as Rejected
           RSB_RESP IN ('000', '001');
  INSERT INTO REC_SWT_BASE2OFFUS_IBR
    (RSB_PROCESS_DATE,
     RSB_FILE_TYPE,
     RSB_FILE_NAME,
     RSB_REC_TYP,
     RSB_TRAN_TYP,
     RSB_RESP_CDE,
     RSB_RVSL_CDE,
     RSB_POST_DAT,
     RSB_ACQ_INST_ID_NUM,
     RSB_TERM_ID,
     RSB_TERM_NAME_LOC,
     RSB_TERM_OWNER_NAME,
     RSB_TERM_CITY,
     RSB_TERM_ST_X,
     RSB_TERM_CNTRY_X,
     RSB_SEQ_NUM,
     RSB_INVOICE_NUM,
     RSB_RETL_ID,
     RSB_TRAN_CDE,
     RSB_RESPONDER,
     RSB_PAN,
     RSB_MBR_NUM,
     RSB_AMT1,
     RSB_AMT2,
     RSB_SETL_CRNCY_CDE,
     RSB_SETL_CONV_RATE,
     RSB_TRAN_DAT,
     RSB_TRAN_TIM,
     RSB_PT_SRV_COND_CDE,
     RSB_PT_SRV_ENTRY_MDE,
     RSB_FROM_ACCT_TYP,
     RSB_FROM_ACCT,
     RSB_ORIG_CRNCY_CDE,
     RSB_RESP,
     RSB_MAT_CAT_CODE,
     RSB_ERR_FLAG,
     RSB_TO_ACCT_TYP,
     RSB_TO_ACCT,
     RSB_REC_GEN,
     RSB_LUPD_DAT,
     RSB_MAN_REC,
     RSB_RRN,
     RSB_TRACE_NUM)
    SELECT RSB_PROCESS_DATE,
           RSB_FILE_TYPE,
           RSB_FILE_NAME,
           RSB_REC_TYP,
           RSB_TRAN_TYP,
           RSB_RESP_CDE,
           RSB_RVSL_CDE,
           RSB_POST_DAT,
           RSB_ACQ_INST_ID_NUM,
           RSB_TERM_ID,
           RSB_TERM_NAME_LOC,
           RSB_TERM_OWNER_NAME,
           RSB_TERM_CITY,
           RSB_TERM_ST_X,
           RSB_TERM_CNTRY_X,
           RSB_SEQ_NUM,
           RSB_INVOICE_NUM,
           RSB_RETL_ID,
           RSB_TRAN_CDE,
           RSB_RESPONDER,
           RSB_PAN,
           RSB_MBR_NUM,
           RSB_AMT1,
           RSB_AMT2,
           RSB_SETL_CRNCY_CDE,
           RSB_SETL_CONV_RATE,
           RSB_TRAN_DAT,
           RSB_TRAN_TIM,
           RSB_PT_SRV_COND_CDE,
           RSB_PT_SRV_ENTRY_MDE,
           RSB_FROM_ACCT_TYP,
           RSB_FROM_ACCT,
           RSB_ORIG_CRNCY_CDE,
           RSB_RESP,
           RSB_MAT_CAT_CODE,
           RSB_ERR_FLAG,
           RSB_TO_ACCT_TYP,
           RSB_TO_ACCT,
           RSB_REC_GEN,
           RSB_LUPD_DAT
          ,
           RSB_MAN_REC,
           RSB_RRN,
           RSB_TRACE_NUM
      FROM REC_SWT_BASE2OFFUS_IBR_TEMP
     WHERE RSB_REV_FLAG = 'N' AND RSB_TRAN_CDE != '30' AND
--Imran 31 Jan 2004, 0200 to be treated as Rejected
           rsb_tran_typ<>'0200' AND
--Imran 31 Jan 2004, 0200 to be treated as Rejected
           RSB_RESP IN ('000', '001');
EXCEPTION
  WHEN OTHERS THEN
    ERRMSG := 'Exep Main ......' || SQLERRM;
END SP_INS_SWT_IBR;
/

