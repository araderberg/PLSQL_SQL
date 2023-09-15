/*first_data_inhouse*/


select distinct 'Select '''||protocol||''',TO_CHAR(min(merge_datetime), ''MM/DD/YYYY'')
from '||protocol||'.CRF_TRK_SUBJECT_UPDATE;'
from
(select protocol from ctsdd.panel 
where panel = 'CRF_TRK_SUBJECT'
and protocol in (select protocol 
from cts.cts_protocols where protocol not like 'TEST_%'))

--formatted
/*select distinct 'Select '''||protocol||''',TO_CHAR(max(merge_datetime), ''MM/DD/YYYY'')
from '||protocol||'.CRF_TRK_SUBJECT_UPDATE;'
from
(select protocol from ctsdd.panel 
where panel = 'CRF_TRK_SUBJECT'
and protocol in (select protocol 
from cts.cts_protocols where protocol not like 'TEST_%'))
*/

/*
Select 'xxxx',TO_CHAR(min(merge_datetime), 'MM/DD/YYYY')
from xxxx.CRF_TRK_SUBJECT_UPDATE;*/
