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
SET SERVEROUTPUT ON SIZE 1000000

SET TIMING ON

DEFINE _EDITOR=vi

SCRIPT prompt.js
