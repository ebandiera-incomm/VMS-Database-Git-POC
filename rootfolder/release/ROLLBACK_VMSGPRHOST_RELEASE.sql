SPOOL $VMS_HOME/NOV_VMSGPRHOST_R90_RELEASE/LOG/ROLLBACK_VMSCMS_RELEASE_R90.log;

 
----------------------------------------------------------------------------------------------------------------
--    Please keep NOV_VMSGPRHOST_R90_RELEASE folder in $VMS_HOME/ and then execute the script                        
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

 

PROMPT               START OF RELEASE ROLLBACK_VMSGPRHOST_R90
------------------------------------------------------------------------------------------------------------------------------------        
SET ECHO OFF
SET DEFINE OFF

--ROLLBACK
PROMPT ROLLBACK DDL
		
	PROMPT     *** ROLLBACK__  ***
    @$VMS_HOME/NOV_VMSGPRHOST_R90_RELEASE/RELEASE/ROLLBACK/GPP_ACCOUNTS.pkb
	PROMPT     --------------------------------------------------------------------------------

    PROMPT     *** ROLLBACK__  ***
    @$VMS_HOME/NOV_VMSGPRHOST_R90_RELEASE/RELEASE/ROLLBACK/GPP_ACCOUNTS.pks
	PROMPT     --------------------------------------------------------------------------------
	
PROMPT ROLLBACK DML
	
	PROMPT     *** no dml  ***
    --@$VMS_HOME/NOV_VMSGPRHOST_R90_RELEASE/VMSGPRHOST_R90_B0002/ROLLBACK/ROLLBACK_VMS_8937_VMS_CONFIG_QUERY.sql
	PROMPT     --------------------------------------------------------------------------------	
	
PROMPT			 	END OF RELEASE ROLLBACK_VMSGPRHOST_R90

spool off;





