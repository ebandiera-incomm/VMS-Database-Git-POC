SPOOL $VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/LOG/VMSGPRHOST_RELEASE_VMSCMS_R93.log;


----------------------------------------------------------------------------------------------------------------
--    Please keep FEB_VMSGPRHOST_R93_RELEASE RELEASE folder in $VMS_HOME/ and then execute the script                        
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

PROMPT                 START OF RELEASE VMSGPRHOST_R92
------------------------------------------------------------------------------------------------------------------------------------        
SET DEFINE OFF
SET ECHO OFF

	@$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE_B0/DDL/DROP_BACKUP.sql;	
	
PROMPT *** Build 1 ***		
	PROMPT *** DDL ***	
    @$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/DDL/PROCEDURES/SP_UPLOAD_BULK_NEWCAF.prc
    @$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/DDL/PACKAGES/PackageBody/GPP_TOKENS.pkb
    @$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/DDL/SCRIPTS/CMS_INST_PARAM_R93B1.sql
    PROMPT     --------------------------------------------------------------------------------

	PROMPT *** DML ***
	@$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/DML/CMS_INST_PARAM_R93B1.sql
    PROMPT     -----------------------------------------------------------------------------

PROMPT *** Build 2 ***		
	PROMPT *** DDL ***
	@$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/DDL/SCRIPTS/VMS_WALLET_MAST_R93B2.sql    
    @$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/DDL/PACKAGES/PackageBody/GPP_TOKENS.pkb
    PROMPT     --------------------------------------------------------------------------------

	PROMPT *** DML ***
	@$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/DML/VMS_WALLET_MAST_R93B2.sql
    PROMPT     --------------------------------------------------------------------------------


PROMPT *** Build 3 ***		
	PROMPT *** DDL ***
	--@$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/DDL/SCRIPTS/CREATE_BACKUP_BUILD3.sql
    PROMPT     --------------------------------------------------------------------------------

	PROMPT *** DML ***
	--@$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/DML/CMS_INST_PARAM.sql
    PROMPT     --------------------------------------------------------------------------------
	
	@$VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/RELEASE/MANDATORY_DML.sql;

PROMPT			 	END OF RELEASE VMSGPRHOST_R92

spool off;








