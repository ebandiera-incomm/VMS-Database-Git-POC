SPOOL $VMS_HOME/JAN_VMSGPRHOST_R91_RELEASE/ROOTFOLDER/LOG/CHECK_INVALID_CNT.log;

set serveroutput on


PROMPT     *** INSERT Post-Deployment Invalid Count   *****

INSERT INTO vmscms.vms_edition_invalid_cnt (deploymnt_ind,edition_name,invalid_cnt)
    SELECT 1, edition_name, COUNT(*)
      FROM dba_objects_ae
     WHERE owner = ANY ( 'VMSCMS','FSFW','VMSCMS_NONEBR' )
       AND status <> 'VALID'
    GROUP BY edition_name;

COMMIT;

column edition_name format a30
set lines 200;
set pages 200;

PROMPT     *** Before and After Deployment Invalid Count   *****

WITH
    invld_cnt
    AS
        (SELECT deploymnt_ind,
                edition_name,
                invalid_cnt,
                ROW_NUMBER ()
                    OVER (
                        PARTITION BY deploymnt_ind
                        ORDER BY
                            TO_NUMBER (
                                REPLACE (SUBSTR (EDITION_NAME,
                                                   INSTR (EDITION_NAME,
                                                          '_R',
                                                          1,
                                                          1)
                                                 + 2,
                                                 3), -- TEMP CHANGE /TODO
                                                 --LENGTH (EDITION_NAME)),
                                         '_',
                                         '.')) DESC)    r_no
           FROM vmscms.vms_edition_invalid_cnt
          WHERE EDITION_NAME LIKE 'RELEASE%')
  SELECT a.edition_name,
         a.invalid_cnt                       b4_deployment_cnt,
         b.invalid_cnt                       after_deployment_cnt,
         (a.invalid_cnt - b.invalid_cnt)     is_diff
    FROM invld_cnt a, invld_cnt b
   WHERE     a.deploymnt_ind = 0
         AND b.deploymnt_ind = 1
         AND a.edition_name = b.edition_name
         AND a.r_no <= 5
ORDER BY 1;


spool off;

