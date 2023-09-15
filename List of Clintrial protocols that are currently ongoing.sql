/*Creates a list of Clintrial protocols that are currently ongoing*/

Drop table studongoing;

Create Table studongoing
(protocol varchar2(20),
description varchar2(240),
create_date date,
locked number(1));

insert into studongoing 
select Protocol,description,create_date,locked from cts.cts_protocols 
where type=1 and data_dict = 0 and protocol not like 'TEST_%' and 
protocol not in(
'STANDARD_EDITCHKS',
'VIEW_CODELISTS',   
'STANDARDS',        
'MEDIKA_CLINICAL',  
'CTRESOLVEREF',         
'TRACKITREF',
'CODING_REF'
) and locked =0
order by create_date;
commit;

/*select Protocol,description,create_date,decode(locked,0, 'Ongoing')Status
from cts.cts_protocols 
where type=1 and data_dict = 0 and protocol not like 'TEST_%' and 
protocol not in(
'STANDARD_EDITCHKS',
'VIEW_CODELISTS',   
'STANDARDS',        
'MEDIKA_CLINICAL',  
'CTRESOLVEREF',         
'TRACKITREF',
'CODING_REF'
) 
and (protocol not like '%_C' and protocol not like '%TEST%')
and locked =0
order by protocol, create_date;
*/