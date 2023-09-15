/*last_query_returned*/


select distinct 'Select '''||protocol||''',TO_CHAR(max(ctv_status_change_dt), ''MM/DD/YYYY'')
from '||protocol||'.VCT_ERRORSTATUS_UPDATE
where ctv_form_batch_num is not null;'
from
(select protocol from ctsdd.panel 
where panel = 'VCT_ERRORSTATUS'
and protocol in (select protocol 
from cts.cts_protocols where protocol not like 'TEST_%'))


--results
/*Select TO_CHAR(max(ctv_status_change_dt), 'MM/DD/YYYY')
from xxxx.VCT_ERRORSTATUS_UPDATE
where ctv_form_batch_num is not null;*/

