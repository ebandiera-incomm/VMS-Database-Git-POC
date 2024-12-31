SET SERVEROUTPUT ON;
SET DEFINE ON;
 
BEGIN

	FOR I IN (SELECT * FROM all_objects 
				WHERE owner ='VMSCMS'
				AND ( object_NAME LIKE '%_R99B%'
						OR object_NAME LIKE '%_R004B%') 
				AND OBJECT_TYPE ='TABLE') LOOP 
    
    EXECUTE IMMEDIATE 'DROP '|| i.object_TYPE || ' ' ||I.owner||'.'||I.OBJECT_NAME;
   
    END LOOP;
	
EXCEPTION
		WHEN OTHERS THEN
		NULL;
		
END;

/