SPOOL $VMS_HOME/MAR_VMSGPRHOST_R005_RELEASE/LOG/VMSGPRHOST_RELEASE_VMSCMS_R005.log;


----------------------------------------------------------------------------------------------------------------
--    Please keep VMSGPRHOST_RELEASE_R005 RELEASE folder in $VMS_HOME/ and then execute the script                        
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

PROMPT                 START OF RELEASE VMSGPRHOST_R005
------------------------------------------------------------------------------------------------------------------------------------        
SET DEFINE OFF
SET ECHO OFF

--VMSCMS(Schema)
PROMPT DDL

	PROMPT     *** CREATE_BACKUP  ***
    @$VMS_HOME/MAR_VMSGPRHOST_R005_RELEASE/RELEASE/DDL/FUNCTIONS/FN_CURR_TAB_SIZE.fnc
	PROMPT     --------------------------------------------------------------------------------	
	

PROMPT DML
	
	PROMPT     *** no dml  ***
    --@$VMS_HOME/MAR_VMSGPRHOST_R005_RELEASE/VMSGPRHOST_R005_B0002/DML/VMS_8937_VMS_CONFIG_QUERY.sql
	PROMPT     --------------------------------------------------------------------------------

PROMPT			 	END OF RELEASE VMSGPRHOST_R005

spool off;








