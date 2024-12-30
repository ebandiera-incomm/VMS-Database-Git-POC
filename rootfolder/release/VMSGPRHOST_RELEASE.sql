SPOOL $VMS_HOME/JAN_VMSGPRHOST_R001_RELEASE/LOG/VMSGPRHOST_RELEASE_VMSCMS_R104.log;


----------------------------------------------------------------------------------------------------------------
--    Please keep VMSGPRHOST_RELEASE_R104 RELEASE folder in $VMS_HOME/ and then execute the script                        
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

PROMPT                 START OF RELEASE VMSGPRHOST_R999
------------------------------------------------------------------------------------------------------------------------------------        
SET DEFINE OFF
SET ECHO OFF

--VMSCMS(Schema)
PROMPT DDL

	PROMPT     *** CREATE_BACKUP  ***
    @$VMS_HOME/JAN_VMSGPRHOST_R001_RELEASE/RELEASE/DDL/FUNCTIONS/FN_ACCT_STAT.fnc
	PROMPT     --------------------------------------------------------------------------------	
	

PROMPT DML
	
	PROMPT     *** no dml  ***
    --@$VMS_HOME/JAN_VMSGPRHOST_R001_RELEASE/VMSGPRHOST_R104_B0002/DML/VMS_8937_VMS_CONFIG_QUERY.sql
	PROMPT     --------------------------------------------------------------------------------

PROMPT			 	END OF RELEASE VMSGPRHOST_R999

spool off;








