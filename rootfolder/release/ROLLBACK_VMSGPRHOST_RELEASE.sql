SPOOL $VMS_HOME/MAR_VMSGPRHOST_R005_RELEASE/LOG/ROLLBACK_VMSCMS_RELEASE_R005.log;

 
----------------------------------------------------------------------------------------------------------------
--    Please keep MAR_VMSGPRHOST_R005_RELEASE folder in $VMS_HOME/ and then execute the script                        
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

 

PROMPT               START OF RELEASE ROLLBACK_VMSGPRHOST_R005
------------------------------------------------------------------------------------------------------------------------------------        
SET ECHO OFF
SET DEFINE OFF

--ROLLBACK
PROMPT ROLLBACK DDL
		
	PROMPT     *** ROLLBACK_VMS_9234_GPP_TOKENS  ***
    @$VMS_HOME/MAR_VMSGPRHOST_R005_RELEASE/RELEASE/ROLLBACK/FN_CURR_TAB_SIZE.fnc
	PROMPT     --------------------------------------------------------------------------------
	
	
PROMPT ROLLBACK DML
	
	PROMPT     *** no dml  ***
    --@$VMS_HOME/MAR_VMSGPRHOST_R005_RELEASE/VMSGPRHOST_R005_B0002/ROLLBACK/ROLLBACK_VMS_8937_VMS_CONFIG_QUERY.sql
	PROMPT     --------------------------------------------------------------------------------	
	
PROMPT			 	END OF RELEASE ROLLBACK_VMSGPRHOST_R005

spool off;





