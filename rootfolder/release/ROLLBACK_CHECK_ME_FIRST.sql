spool $VMS_HOME/JAN_VMSGPRHOST_R001_RELEASE/LOG/ROLL_CHECK_ME_FIRST.log;

SET SERVEROUTPUT ON;

DECLARE 


V_CIV_VERS_BULD VMSCMS.CMS_INCOMM_VERSION.CIV_VERS_BULD%TYPE;

BEGIN

        SELECT CIV_VERS_BULD
        INTO   V_CIV_VERS_BULD
        FROM   VMSCMS.CMS_INCOMM_VERSION 
        WHERE CIV_BASE_VERS ='DB - 3.5.1';
        
                   
           IF V_CIV_VERS_BULD = 'VMSGPRHOST_R104_B0002' 
        THEN 
		
	    DBMS_OUTPUT.PUT_LINE('*************************************************');					
            
        DBMS_OUTPUT.PUT_LINE('PLEASE EXECUTE ROLLBACK FOR RELEASE VMSGPRHOST_R104_B0002');
                         
	    DBMS_OUTPUT.PUT_LINE('*************************************************');			
						 
        ELSIF V_CIV_VERS_BULD = 'VMSGPRHOST_R104_B0001' 
        THEN

	    DBMS_OUTPUT.PUT_LINE('***********************************************');					
		
        DBMS_OUTPUT.PUT_LINE('ROLLBACK IS ALREADY EXECUTED FOR VMSGPRHOST_R104_B0002');

	    DBMS_OUTPUT.PUT_LINE('***********************************************');			        
            
        END IF;     
        
EXCEPTION WHEN NO_DATA_FOUND
THEN
     DBMS_OUTPUT.PUT_LINE('DATABASE RELEASE NOT FOUND IN VERSION MASTER');       
                     
END; 
/

spool off;



