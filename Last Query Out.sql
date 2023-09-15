/*last_query_out*/

select distinct 'Select '''||protocol||''',TO_CHAR(max(ctv_errdt), ''MM/DD/YYYY'')
from '||protocol||'.VCT_ERRORSTATUS_UPDATE
where ctv_form_batch_num is not null;'
from
(select protocol from ctsdd.panel 
where panel = 'VCT_ERRORSTATUS'
and protocol in (select protocol 
from cts.cts_protocols where protocol not like 'TEST_%'))


--results
/*Select 'xxxx',TO_CHAR(max(ctv_errdt), 'MM/DD/YYYY')
from A2260335.VCT_ERRORSTATUS_UPDATE
where ctv_form_batch_num is not null;*/
