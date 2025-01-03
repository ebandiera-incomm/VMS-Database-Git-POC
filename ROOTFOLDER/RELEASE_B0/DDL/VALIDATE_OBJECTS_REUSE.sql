DEFINE delimiter = '-------------------------------------------------------------'

DEFINE script_name = 'VALIDATE_OBJECTS_REUSE'

DEFINE VALIDATE_SCHEMA_NAME = 'VMSCMS'

PROMPT &&DELIMITER &&SCRIPT_NAME
PROMPT Script Start: &&SCRIPT_NAME
PROMPT &&DELIMITER &&SCRIPT_NAME

SET SERVEROUTPUT ON

DECLARE
    CURSOR c1 IS
    SELECT
        distinct
        owner,
        object_type,
        object_name
    FROM
        dba_objects_ae
    WHERE
            owner = '&&VALIDATE_SCHEMA_NAME'
        AND object_type IN ( 'FUNCTION', 'PROCEDURE', 'PACKAGE', 'PACKAGE BODY', 'TYPE',
                             'TYPE BODY', 'SYNONYM', 'VIEW', 'TRIGGER' )
        AND editionable = 'Y'
        AND edition_name in ('RELEASE_R92_POC')
    ORDER BY
        owner,
        object_name,
        object_type;

    l_end  VARCHAR2(250);
    l_sql  VARCHAR2(25000);
BEGIN
    FOR c1_rec IN c1 LOOP
        BEGIN
            CASE
                WHEN c1_rec.object_type = 'SYNONYM' OR c1_rec.object_type = 'VIEW' THEN
                    l_sql := 'ALTER '
                             || c1_rec.object_type
                             || ' '
                             || c1_rec.owner
                             || '.'
                             || c1_rec.object_name
                             || ' COMPILE';
                WHEN c1_rec.object_type = 'PACKAGE BODY' THEN
                    l_sql := 'ALTER PACKAGE '
                             || c1_rec.owner
                             || '.'
                             || c1_rec.object_name
                             || ' COMPILE BODY REUSE SETTINGS';
                WHEN c1_rec.object_type = 'TYPE BODY' THEN
                    l_sql := 'ALTER TYPE '
                             || c1_rec.owner
                             || '.'
                             || c1_rec.object_name
                             || ' COMPILE BODY REUSE SETTINGS';
                ELSE
                    l_sql := 'ALTER '
                             || c1_rec.object_type
                             || ' '
                             || c1_rec.owner
                             || '.'
                             || c1_rec.object_name
                             || ' COMPILE REUSE SETTINGS';
            END CASE;

           -- dbms_output.put_line(l_sql);
                                    EXECUTE IMMEDIATE l_sql;
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('Unexpected error : '
                                     || l_sql
                                     || ' : '
                                     || sqlerrm);
        END;
    END LOOP;

dbms_utility.compile_schema(schema => 'VMSCMS', compile_all => false);
END;
/

PROMPT &&DELIMITER &&SCRIPT_NAME
PROMPT Script End: &&SCRIPT_NAME
PROMPT &&DELIMITER &&SCRIPT_NAME

UNDEFINE VALIDATE_SCHEMA_NAME
UNDEFINE VALIDATE_EDITION_NAME