/*
 from: https://github.com/johnthomas22/SQLUtils
 */
/* execute a sql and get the first column of the first row as a return*/
var dbUser = util.executeReturnOneCol('select user from sys.dual');
var dbName = util.executeReturnOneCol('select name from v$DATABASE');
var dbSid = util.executeReturnOneCol(
    'SELECT LTRIM(TO_CHAR(sid)) FROM v$mystat WHERE rownum < 2');
//var dbSerial = util.executeReturnOneCol(
//    'SELECT LTRIM(serial#) serial# FROM v$session' +
//        'WHERE sid in (SELECT sid FROM v$mystat WHERE rownum < 2)');
var dbHostname = util.executeReturnOneCol("SELECT regexp_substr(host_name,'[^.]*') host_name FROM v$instance");

if ( dbUser == 'SYS' || dbHostname == 'oracledb-prod' ) {
    sqlcl.setStmt(
        'set sqlprompt "@|red _USER|@@@|green _CONNECT_IDENTIFIER|@(' +
            dbHostname + ')' + dbSid + '@|white > |@"'
    );
} else {
    sqlcl.setStmt(
        'set sqlprompt "@|green _USER|@@@|green _CONNECT_IDENTIFIER|@(' +
            dbHostname + ')' + dbSid + '@|white > |@"'
    );
}

sqlcl.run();
