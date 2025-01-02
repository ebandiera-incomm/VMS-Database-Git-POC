DEFINE DELIMETER = '-------------------------------------------------------------'
DEFINE SCRIPT_NAME = 'SWITCH_EDITION'
DEFINE NEW_EDITION_NAME = 'RELEASE_R91'

PROMPT &&DELIMETER &&SCRIPT_NAME
PROMPT Script Start: &&SCRIPT_NAME
PROMPT &&DELIMETER &&SCRIPT_NAME

PROMPT Script info:
SELECT sys_context('USERENV', 'MODULE') FROM dual;

PROMPT
PROMPT &&DELIMETER &&SCRIPT_NAME
PROMPT

ALTER SESSION SET EDITION = &&NEW_EDITION_NAME;

PROMPT &&DELIMETER &&SCRIPT_NAME
PROMPT Script End: &&SCRIPT_NAME
PROMPT &&DELIMETER &&SCRIPT_NAME

UNDEFINE NEW_EDITION_NAME