SPOOL $VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/LOG/ROLLBACK_VMSCMS_RELEASE_R93.log;

 
----------------------------------------------------------------------------------------------------------------
--    Please keep FEB_VMSGPRHOST_R93_RELEASE folder in $VMS_HOME/ and then execute the script                        
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

 

PROMPT               START OF RELEASE ROLLBACK_VMSGPRHOST_R93
------------------------------------------------------------------------------------------------------------------------------------        
SET ECHO OFF
SET DEFINE OFF

--ROLLBACK
PROMPT *** Build 3 ***			
	PROMPT *** DDL ROLLBACK ***	
    
    PROMPT *** DML ROLLBACK ***


PROMPT *** Build 2 ***			
    PROMPT *** DDL ROLLBACK ***
	@$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/CMS_INST_PARAM.sql
    PROMPT     --------------------------------------------------------------------------------

    PROMPT *** DML ROLLBACK ***

PROMPT *** Build 1 ***			
	PROMPT *** DDL ROLLBACK ***
	@$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/GPP_TOKENS.pkb
    @$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/SP_UPLOAD_BULK_NEWCAF.prc
    PROMPT     --------------------------------------------------------------------------------
	
    PROMPT *** DML ROLLBACK ***
    --@$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/CMS_RESPONSE_MASTB1.sql
    PROMPT     --------------------------------------------------------------------------------

    @$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/ROLLBACK/MANDATORY_DML_ROLLBACK.sql;

PROMPT			 	END OF RELEASE ROLLBACK_VMSGPRHOST_R93

spool off;





