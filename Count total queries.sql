/*count_total_queries*/


select 'Select '''||protocol||''',count(*) from '||protocol||'.VCT_ERRORSTATUS_UPDATE
where ctv_form_batch_num is not null;'
from
(select protocol from ctsdd.panel where panel = 'VCT_ERRORSTATUS'
and protocol in (select protocol from cts.cts_protocols a where protocol not like 'TEST_%'))
/


/*Select 'xxxx',count(*) from xxxx.VCT_ERRORSTATUS_UPDATE
where ctv_form_batch_num is not null;*/
