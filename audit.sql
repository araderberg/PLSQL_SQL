/************************************************************************/
/* UPDATED VERSION                                                      */
/* Filename:     audit.sql                                              */
/* Purpose:      Audit Listing for Protocol PROTO9999              */
/* Date:         21-APR-2004                                            */
/* Programmer:   Aaliyah Raderberg                                       */
/* Modified:                                                            */
/* Desc:         This file contains the script used for AUDIT LISTINGS  */
/*               spools &prot_audit.txt file in the location specified  */
/* Version:      1.0                                                    */
/*								        */
/************************************************************************/
REM protocol

--clear before set up report
CLEAR SCREEN
CLEAR BREAKS      
CLEAR COLUMNS     

SET TERM ON
--suppress the listing, when a file is started
SET ECHO OFF      
--prints the #'s of rows returned from a query
-- Sets feedback to display the number of records returned if > 1
SET FEEDBACK ON   
--prints column headings
SET HEADING ON    
--suppress the printing of old values
SET VERIFY OFF    
-- Enables DBMS_OUTPUT so all DBMS_OUTPUT.PUT_LINE
SET SERVEROUTPUT ON
--# of lines per page
SET PAGESIZE 54   
--# of chars per line
SET LINESIZE 180     
--# of lines between pages
SET NEWPAGE 0        

SET SPACE 1

SET TERM ON
PROMPT 'Audit Listing Script'
ACCEPT prot char PROMPT 'Please Enter Clinical Protocol: '
--ACCEPT ptid char PROMPT 'Please Enter Patient ID: '
ACCEPT drive char PROMPT 'Please Enter Path Name for Spool File (e.i. c:\): '
ACCEPT output char PROMPT 'Please Enter Output file format (e.i. txt, xls, doc, csv): '
PROMPT 'Please wait...completed!'

SET TERM OFF
COLUMN  REGINVID1A     FORMAT A10   HEADING 'Site';
COLUMN  PXLPID1A       FORMAT A7  HEADING 'Patient';
COLUMN  PXLPAG1A       FORMAT A8 HEADING 'Page#';
COLUMN  PXLPAGSUF1N      HEADING 'Page|Suf';
COLUMN  REGVISIT1A     FORMAT A6  HEADING 'Visit';
COLUMN  REGSEQNUM1N    HEADING 'Seqnum';
COLUMN  REGCOMMNT1A    FORMAT A55 HEADING 'Comments' word_wrap;


BREAK ON PATIENT_ID SKIP PAGE

BREAK ON today
COLUMN today    NEW_VALUE today
SELECT LTRIM(RTRIM(to_char(sysdate, 'DD-MON-YYYY HH24:MI:SS'))) today from dual;

SPOOL &DRIVE.&PROT._AUDIT.&output
REM ********************PATIENTS********************
TTITLE CENTER ' Audit Listings for Protocol ' prot ' as of ' today -
  SKIP CENTER '***** &PROT - Comments *****'  RIGHT 'PAGE:'  SQL.PNO -
  SKIP 2; 

SELECT      REGINVID1A, PXLPID1A, PXLPAG1A, PXLPAGSUF1N, REGVISIT1A, REGSEQNUM1N, REGCOMMNT1A
FROM        &PROT..COMM_DATA
ORDER BY    REGINVID1A, PXLPID1A, PXLPAG1A, PXLPAGSUF1N, REGVISIT1A, REGSEQNUM1N;


REM ****************************************

CLEAR BREAKS
SET PNO 0
BREAK ON REPORT
BREAK ON PXLPID1A SKIP PAGE

REM ********************END OF AUDIT LISTINGS********************

SPOOL OFF
SET PAGESIZE 24
SET NEWPAGE 1
SET LINESIZE 80
SET TERM ON

