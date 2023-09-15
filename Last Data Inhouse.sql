/*last_data_inhouse*/


select distinct 'Select '''||protocol||''',TO_CHAR(max(merge_datetime), ''MM/DD/YYYY'')
from '||protocol||'.CRF_TRK_SUBJECT_UPDATE;'
from
(select protocol from ctsdd.panel 
where panel = 'CRF_TRK_SUBJECT'
and protocol in (select protocol 
from cts.cts_protocols where protocol not like 'TEST_%'))
/


Select 'A1030480',TO_CHAR(max(merge_datetime), 'MM/DD/YYYY')
from A1030480.CRF_TRK_SUBJECT_UPDATE;



/*select distinct '
Insert into LDI (PROTOCOL,LDI)
Select '''||owner||''',max(merge_datetime) from '||owner||'.tracking_UPDATE;'
from all_tables 
where owner in(select protocol from studies2006);*/
