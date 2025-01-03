SPOOL $VMS_HOME/JAN_VMSGPRHOST_R91_RELEASE/ROOTFOLDER/LOG/ROLLBACK_VMSCMS_RELEASE_R91.log;

 
----------------------------------------------------------------------------------------------------------------
--    Please keep JAN_VMSGPRHOST_R91_RELEASE folder in $VMS_HOME/ and then execute the script                        
--    execute all the scripts using SQL prompt of Oracle only.                             
--    Please take a proper back up of schema before executing this scripts                    
------------------------------------------------------------------------------------------------------------------------------------            
    --- RELEASE NAME : Release 
    --- RELEASED FOR : Defect IDs : 
    --- RELEASED BY  : DB Team  on 
    --- PREREQUISITE FOR THIS BUILD : This script is to be executed on a environment where  is available
------------------------------------------------------------------------------------------------------------------------------------        
set define off;
set lines 1010;
set pages 1010; 
set serveroutput on

 

PROMPT               START OF RELEASE ROLLBACK_VMSGPRHOST_R91
------------------------------------------------------------------------------------------------------------------------------------        
SET ECHO OFF
SET DEFINE OFF

--ROLLBACK
PROMPT *** Build 3 ***			
	PROMPT *** DDL ROLLBACK ***	
    PROMPT     *** PROCEDURES  *****
    @$VMS_HOME/JAN_VMSGPRHOST_R91_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/SP_CHW_ORDER_REPLACE.prc
    @$VMS_HOME/JAN_VMSGPRHOST_R91_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/SP_PREAUTH_AUTH_MERCTXN_ISO93.prc
    @$VMS_HOME/JAN_VMSGPRHOST_R91_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/SP_PREAUTH_TXN_ISO93.prc
    @$VMS_HOME/JAN_VMSGPRHOST_R91_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/SP_REQUISITION_ID.prc        
    PROMPT     --------------------------------------------------------------------------------

    PROMPT *** DML ROLLBACK ***

PROMPT *** Build 2 ***			
    PROMPT *** DDL ROLLBACK ***
	--PROMPT     *** CMS_INST_PARAM.sql *****
    --@$VMS_HOME/JAN_VMSGPRHOST_R91_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/CMS_INST_PARAM.sql
    PROMPT     --------------------------------------------------------------------------------

    PROMPT *** DML ROLLBACK ***

PROMPT *** Build 1 ***			
	PROMPT *** DDL ROLLBACK ***
	--PROMPT     *** SP_DISPUTE_PROCESS *****
    --@$VMS_HOME/JAN_VMSGPRHOST_R91_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/SP_DISPUTE_PROCESS.prc
    PROMPT     --------------------------------------------------------------------------------
	
    PROMPT *** DML ROLLBACK ***
    --PROMPT     *** CMS_RESPONSE_MAST *****
    --@$VMS_HOME/JAN_VMSGPRHOST_R91_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/CMS_RESPONSE_MASTB1.sql
    PROMPT     --------------------------------------------------------------------------------

    @$VMS_HOME/JAN_VMSGPRHOST_R91_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/MANDATORY_DML_ROLLBACK.sql;

PROMPT			 	END OF RELEASE ROLLBACK_VMSGPRHOST_R91

spool off;





