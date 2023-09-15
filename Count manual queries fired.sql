/*manual queries fired*/

Select 'select '''||protocol||''',count(*) 
from '||protocol||'.VCT_ERRORSTATUS_UPDATE
where ctv_errtype =''MANUAL'';'
from (select a.protocol from cts.cts_protocols a where protocol not like 'TEST_%')
/

/*select 'xxx',count(*)
from xxx.VCT_ERRORSTATUS_UPDATE
where ctv_errtype ='MANUAL';*/
