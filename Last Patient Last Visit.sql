/*last_patient_last_visit*/

select distinct '
Select '''||protocol||''',max(vdate) from '||protocol||'.demog_data;'
from
(select protocol from ctsdd.panel 
where panel = 'DEMOG'
and protocol in (select protocol 
from cts.cts_protocols where protocol not like 'TEST_%'))
/

/*
Select 'xxxx',max(vdate) from xxxx.demog_data;*/
