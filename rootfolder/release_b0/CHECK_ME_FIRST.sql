spool $VMS_HOME/NOV_VMSGPRHOST_R90_RELEASE/LOG/CHECK_ME_FIRST.log;

SET SERVEROUTPUT ON;
SET DEFINE ON;
DECLARE 

V_CIV_VERS_BULD VMSCMS.CMS_INCOMM_VERSION.CIV_VERS_BULD%TYPE;

BEGIN

        SELECT CIV_VERS_BULD
        INTO   V_CIV_VERS_BULD
        FROM   VMSCMS.CMS_INCOMM_VERSION 
        WHERE CIV_BASE_VERS ='DB - 3.5.1';
            
        
        IF V_CIV_VERS_BULD = 'VMSGPRHOST_R89' 
        THEN 
            
	    DBMS_OUTPUT.PUT_LINE('****************************************');								
			
        DBMS_OUTPUT.PUT_LINE('PLEASE EXECUTE RELEASE VMSGPRHOST_R90_B0000');

	    DBMS_OUTPUT.PUT_LINE('****************************************');					
		
        
        ELSIF V_CIV_VERS_BULD = 'VMSGPRHOST_R90_B0000'
        THEN

	    DBMS_OUTPUT.PUT_LINE('****************************************');							
		
        DBMS_OUTPUT.PUT_LINE(' RELEASE VMSGPRHOST_R90_B0000 IS ALREADY INSTALLED') ;

	    DBMS_OUTPUT.PUT_LINE('****************************************');					
        
        ELSIF V_CIV_VERS_BULD NOT IN ('VMSGPRHOST_R89','VMSGPRHOST_R90_B0000')
        THEN

	    DBMS_OUTPUT.PUT_LINE('****************************************');							
        
        DBMS_OUTPUT.PUT_LINE('PLEASE IMPLEMENT FURTHER RELEASES AFTER '||V_CIV_VERS_BULD) ;

	    DBMS_OUTPUT.PUT_LINE('****************************************');							 
            
        END IF;     
        
EXCEPTION WHEN NO_DATA_FOUND
THEN
     DBMS_OUTPUT.PUT_LINE('DATABASE RELEASE NOT FOUND IN VERSION MASTER');       
                     
END; 
/
spool off;
