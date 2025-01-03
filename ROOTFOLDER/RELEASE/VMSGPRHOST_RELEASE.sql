SPOOL $VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/LOG/VMSGPRHOST_RELEASE_VMSCMS_R91.log;


----------------------------------------------------------------------------------------------------------------
--    Please keep JAN_VMSGPRHOST_R92_RELEASE RELEASE folder in $VMS_HOME/ and then execute the script                        
--    execute all the scripts using SQL prompt of Oracle only.                             
--    Please take a proper back up of schema before executing this scripts                    
------------------------------------------------------------------------------------------------------------------------------------            
--- RELEASE NAME : Release 
--- RELEASED FOR : Defect IDs : 
--- RELEASED BY  : DB Team  on 
--- PREREQUISITE FOR THIS BUILD : This script is to be executed on a environment where  is available
------------------------------------------------------------------------------------------------------------------------------------        

set lines 1010;
set pages 1010; 
set serveroutput on

PROMPT                 START OF RELEASE VMSGPRHOST_R91
------------------------------------------------------------------------------------------------------------------------------------        
SET DEFINE OFF
SET ECHO OFF

	@$VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/RELEASE_B0/DDL/DROP_BACKUP.sql;	
	
PROMPT *** Build 1 ***		
	PROMPT *** DDL ***	
    PROMPT     *** PROCEDURES  *****
    @$VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/RELEASE/DDL/PROCEDURES/SP_CHW_ORDER_REPLACE.prc
    @$VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/RELEASE/DDL/PROCEDURES/SP_PREAUTH_AUTH_MERCTXN_ISO93.prc
    @$VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/RELEASE/DDL/PROCEDURES/SP_PREAUTH_TXN_ISO93.prc
    @$VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/RELEASE/DDL/PROCEDURES/SP_REQUISITION_ID.prc    
    PROMPT     --------------------------------------------------------------------------------

	PROMPT *** DML ***
	--PROMPT *** CMS_RESPONSE_MAST.sql ***
    --@$VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/RELEASE/DML/CMS_RESPONSE_MAST.sql
    PROMPT     -----------------------------------------------------------------------------

PROMPT *** Build 2 ***		
	PROMPT *** DDL ***
	--PROMPT     *** CREATE_BACKUP_BUILD2  *****
    --@$VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/RELEASE/DDL/SCRIPTS/CREATE_BACKUP_BUILD2.sql
    PROMPT     --------------------------------------------------------------------------------

	PROMPT *** DML ***
	--PROMPT *** CMS_INST_PARAM.sql ***
    --@$VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/RELEASE/DML/CMS_INST_PARAM.sql
    PROMPT     --------------------------------------------------------------------------------


PROMPT *** Build 3 ***		
	PROMPT *** DDL ***
	--PROMPT     *** CREATE_BACKUPS  *****
    --@$VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/RELEASE/DDL/SCRIPTS/CREATE_BACKUP_BUILD3.sql
    PROMPT     --------------------------------------------------------------------------------

	PROMPT *** DML ***
	--PROMPT *** CMS_INST_PARAM.sql ***
    --@$VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/RELEASE/DML/CMS_INST_PARAM.sql
    PROMPT     --------------------------------------------------------------------------------
	
	@$VMS_HOME/JAN_VMSGPRHOST_R92_RELEASE/ROOTFOLDER/RELEASE/MANDATORY_DML.sql;

PROMPT			 	END OF RELEASE VMSGPRHOST_R91

spool off;








