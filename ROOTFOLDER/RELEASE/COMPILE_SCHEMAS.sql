SPOOL $VMS_HOME/FEB_VMSGPRHOST_R93_RELEASE/ROOTFOLDER/LOG/COMPILE_SCHEMA.log;

SET SERVEROUTPUT ON;

DECLARE 
l_count_invalid_obj       INTEGER;
l_count_invalid_obj_prev  INTEGER := 0;

BEGIN
    SELECT
            COUNT(1)
        INTO l_count_invalid_obj
        FROM
            all_objects
        WHERE
            status != 'VALID'
		AND OWNER = 'VMSCMS';
	
	LOOP
        IF l_count_invalid_obj = 0 OR l_count_invalid_obj_prev = l_count_invalid_obj THEN
			
			IF l_count_invalid_obj = 0 THEN
				DBMS_OUTPUT.PUT_LINE('INVALID OBJECTS DOES NOT EXISTS..');
			ELSE
				DBMS_OUTPUT.PUT_LINE('INVALID OBJECTS ARE COMPLIED SUCCESSFULLY..');
			END IF;
				EXIT;
        END IF;

            l_count_invalid_obj_prev := l_count_invalid_obj;

            dbms_utility.compile_schema(schema => 'VMSCMS', compile_all => false);
			
             SELECT
                COUNT(1)
            INTO l_count_invalid_obj
            FROM
                all_objects
            WHERE
               status != 'VALID'
		AND OWNER = 'VMSCMS';


        END LOOP;
		
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM(SQLCODE));
END;
/
spool off;

