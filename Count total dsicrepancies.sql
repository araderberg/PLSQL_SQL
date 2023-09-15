/*Count_total_dsicrepancies*/

select 'Select '''||protocol||''',count(*) 
from '||protocol||'.VCT_ERRORSTATUS_UPDATE;'
from
(select protocol from ctsdd.panel 
where panel = 'VCT_ERRORSTATUS'
and protocol in (select protocol 
from cts.cts_protocols a where protocol not like 'TEST_%'))
/
/*
Select 'xxxx',count(*)
from xxxx.VCT_ERRORSTATUS_UPDATE;*/
