SPOOL $VMS_HOME/NOV_VMSGPRHOST_R90_RELEASE/LOG/VMSGPRHOST_RELEASE_VMSCMS_R90.log;


----------------------------------------------------------------------------------------------------------------
--    Please keep VMSGPRHOST_RELEASE_R90 RELEASE folder in $VMS_HOME/ and then execute the script                        
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

PROMPT                 START OF RELEASE VMSGPRHOST_R90
------------------------------------------------------------------------------------------------------------------------------------        
SET DEFINE OFF
SET ECHO OFF

--VMSCMS(Schema)
PROMPT DDL

	PROMPT     *** CREATE_BACKUP  ***
    @$VMS_HOME/NOV_VMSGPRHOST_R90_RELEASE/RELEASE/DDL/PACKAGES/PackageBody/GPP_ACCOUNTS.pkb
	PROMPT     --------------------------------------------------------------------------------	

	PROMPT     *** CREATE_BACKUP  ***
    @$VMS_HOME/NOV_VMSGPRHOST_R90_RELEASE/RELEASE/DDL/PACKAGES/PackageSpecification/GPP_ACCOUNTS.pks
	PROMPT     --------------------------------------------------------------------------------	

	

PROMPT DML
	
	PROMPT     *** no dml  ***
    --@$VMS_HOME/NOV_VMSGPRHOST_R90_RELEASE/VMSGPRHOST_R90_B0002/DML/VMS_8937_VMS_CONFIG_QUERY.sql
	PROMPT     --------------------------------------------------------------------------------

PROMPT			 	END OF RELEASE VMSGPRHOST_R90

spool off;








