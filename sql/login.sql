prompt Welcome Brian!

SET SQLFORMAT ANSICONSOLE
SET LINESIZE 200
SET ECHO OFF

--COL SID NEW_VALUE SID
--COL HOST_NAME NEW_VALUE HOST_NAME
--COL USERNAME NEW_VALUE USERNAME
--COL INSTANCE_NAME NEW_VALUE INSTANCE_NAME
--
--DEF USERNAME="UNKNOWN"
--DEF HOST_NAME = "UNKNOWN"
--DEF SID="SID?"
--COL PLAN_TABLE_OUTPUT FORMAT A150
--
--SELECT SYS_CONTEXT('USERENV', 'SESSION_USER') USERNAME, LTRIM(SID) SID, REGEXP_SUBSTR(I.HOST_NAME,'[^.]*') HOST_NAME, I.INSTANCE_NAME
--FROM V$SESSION, V$INSTANCE I
--WHERE SID IN (
--SELECT SID
--FROM V$MYSTAT
--WHERE ROWNUM < 2
--);
--
--SET SQLPROMPT '&USERNAME.@(&HOST_NAME.:&INSTANCE_NAME):&SID> '

SET TERMOUT ON
SET FEEDBACK ON
SET SERVEROUTPUT ON
SET TIMING ON
SET SQLPROMPT "_user'@'_connect_identifier > "
SET SQLFORMAT ANSICONSOLE

-- Use for Object Generation with SQLcl liquibase
SET DDL PRETTY ON
SET DDL PARTITIONING OFF
SET DDL SEGMENT_ATTRIBUTES OFF
SET DDL TABLESPACE ON
SET DDL EMIT_SCHEMA ON

DEFINE _EDITOR=vi

SCRIPT /Users/brian.shaver/.sql/prompt.js
SCRIPT /Users/brian.shaver/.sql/fivos_sqlcl.js
SCRIPT /Volumes/GitWork/Projects/plsql-formatter-settings/sqlcl/format.js --register
