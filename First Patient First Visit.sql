/*first_patient_first_visit*/

select distinct '
Select '''||protocol||''',min(vdate) from '||protocol||'.demog_data;'
from
(select protocol from ctsdd.panel 
where panel = 'DEMOG'
and protocol in (select protocol 
from cts.cts_protocols where protocol not like 'TEST_%'))
/


/*Select 'xxxx',min(vdate) from A1030480.demog_data;*/
