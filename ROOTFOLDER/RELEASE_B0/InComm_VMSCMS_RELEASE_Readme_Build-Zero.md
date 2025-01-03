TEST SCENARIO FOR MD DOCUMENT

TEST SCENARIO FOR MD DOCUMENT

TEST SCENARIO FOR MD DOCUMENT

TEST SCENARIO FOR MD DOCUMENT

<a name="summary-val"></a>**Vanilla Management System (VMS)**

Installation Manual for Release 
VMSGPRHOST\_R93\_RELEASE – Build *Zero*

*Strictly Private and Confidential*





Installation Manual for release VMSGPRHOST\_R107	

# Documentation Control

|**Ver. No.**|**Author/s**|**Reason of Change**|**Date of Change**|**Reviewed by**|**Review Date**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|1||Document Creation|<p>13/Nov/2024</p><p></p>|Evandro Bandiera||




# Purpose of the Document
This document is prepared to describe the steps for implementation of **JAN\_VMSGPRHOST\_R93\_RELEASE** database release. This is in line with the approach submitted to minimize downtime during deployment.










# Patch installation on UNIX environment 
## Prerequisite
1\. Oracle client or Oracle database is required on the machine from where this patch will be executed.

2\. If the patch executed from oracle client machine, then client should have proper TNS entry in TNSNAMES.ora file.

3\. Take a **proper** back up of schema before executing these scripts.






   ## **Steps to follow for build zero:** 
1. Take login of **VMSCMS** schema and execute below command:

   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/CHECK\_ME\_FIRST.sql;**

2. Check **CHECK\_ME\_FIRST.log** file generated in the below folder:

   **/VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/LOG** 

   *If message in Log file is “**RELEASE ROOTFOLDER/RELEASE\_B0 IS ALREADY INSTALLED”** then it indicates **given release is already installed**. Don’t proceed further.*

   *If message in Log file is “**PLEASE IMPLEMENT FURTHER RELEASES AFTER RELEASE NUMBER** “then it indicates previous releases are missing on setup and appropriate action needs to be taken. Don’t proceed further.*

   *If message in Log file is “**PLEASE EXECUTE THE RELEASE ROOTFOLDER/RELEASE\_B0**” then proceed further.*

3. Run script to create new RELEASE\_R93 edition.

   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/DDL/CREATE\_EDITION.sql** 

4. Run script to switch edition.

   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/DDL/SWITCH\_EDITION.sql** 

5. Run script 

   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/DDL/VALIDATE\_OBJECTS\_REUSE.sql** to run actualization VMSCMS.

6. Run script 

   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/DDL/VALIDATE\_OBJECTS\_REUSE\_FSFW.sql** to run actualization FSFW.

7. Run script 

   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/DDL/VALIDATE\_OBJECTS\_REUSE\_FSAPI.sql** to run actualization APP\_FSAPI\_USER.

8. Run script 

   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/DDL/VALIDATE\_OBJECTS\_REUSE\_DBA\_OPERATIONS.sql** to run actualization DBA\_OPERATIONS.

9. Run script 

   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/DDL/VALIDATE\_OBJECTS\_REUSE\_VMSCMS\_HISTORY.sql** to run actualization VMSCMS\_HISTORY.

10. Run below script to execute Build 0.

   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/DDL/DROP\_BACKUP.sql;**
   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/MANDATORY\_DML.sql;**

11. Run below script to compile the INVALID schema Objects.
    
   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/COMPILE\_SCHEMAS.sql**


13. Check the log files generated in **JAN\_VMSGPRHOST\_R93\_RELEASE/LOG folder**. Open the log files and search for **ORA**- error. If any ORA-error is found in any of the log file, then execute rollback script. Share all the log files with FSS for further analysis.

14. Run script 

   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/DDL/SET\_DEFAULT\_EDITION.sql** to set new R005 edition as default and pin the hash values .

14. Run script to drop old unused editions

   **@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/DDL/**DROP\_UNUSED\_OLD\_EDITION**.sql** 




## Rollback
1\. Execute below script to check the version:

**@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/ROLL\_CHECK\_ME\_FIRST.sql;**

2. Open **ROLL\_CHECK\_ME\_FIRST.log** file generated in

` `**JAN\_VMSGPRHOST\_R93\_RELEASE/LOG folder.** If message in Log file is “**PLEASE EXECUTE ROLLBACK FOR RELEASE *ROOTFOLDER/RELEASE\_B0***” then proceed else contact FSS Onsite Technical Support. 


3\. Execute below command to roll back the release patch:

**@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/MANDATORY\_DML\_ROLLBACK.sql;**

If message in Log file is **“ROLLBACK IS ALREADY EXECUTED FOR ROOTFOLDER/RELEASE\_B0” then** it** indicates given release is already installed.

4\.Run the scripts to drop the edition:

**@$VMS\_HOME/JAN\_VMSGPRHOST\_R93\_RELEASE/ROOTFOLDER/RELEASE\_B0/ROLLBACK/DROP\_EDITION.sql;**



**END OF DOCUMENT**


