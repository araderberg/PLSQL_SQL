/*Average time verification to validation*/

select 'Select '''||protocol||''',count(ptrk), round(sum(DT_VAL_LA-DT_VER_LA),2),
round(sum(DT_VAL_LA-DT_VER_LA)/count(ptrk),2)
from '||protocol||'.CRF_TRK_PAGE_UPDATE
where DT_VAL_LA is not null and DT_VER_LA is not null;'
from
(select protocol from ctsdd.panel 
where panel = 'CRF_TRK_PAGE'
and protocol in (select protocol 
from cts.cts_protocols where protocol not like 'TEST_%'))

/*Select 'xxxx',count(ptrk), round(sum(DT_VAL_LA-DT_VER_LA),2),
round(sum(DT_VAL_LA-DT_VER_LA)/count(ptrk),2)
from xxxx.CRF_TRK_PAGE_UPDATE
where DT_VAL_LA is not null and DT_VER_LA is not null;*/

