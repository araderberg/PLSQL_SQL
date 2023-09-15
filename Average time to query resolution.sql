/*Average time to query resolution*/

select 'Select '''||protocol||''', round(round(Sum(CTV_CLOSED_DATE - CTV_FORM_BATCH_DATE),2)/ COUNT(CTV_FORM_BATCH_DATE)) 
from '||protocol||'.VCT_ERRORSTATUS_UPDATE
where ctv_form_batch_date is not null and ctv_closed_date is not null;'
from
(select protocol from ctsdd.panel 
where panel = 'VCT_ERRORSTATUS'
and protocol in (select protocol 
from cts.cts_protocols where protocol not like 'TEST_%'))

/*Select 'xxxx', round(round(Sum(CTV_CLOSED_DATE - CTV_FORM_BATCH_DATE),2)/ COUNT(CTV_FORM_BATCH_DATE))
from xxxx.VCT_ERRORSTATUS_UPDATE
where ctv_form_batch_date is not null and ctv_closed_date is not null;*/
