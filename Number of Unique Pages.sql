/*number_of_unique_pages
*/

/*select * from xxxxx.Crf_Trk_Page_Update
where subjkey ='01S0050'*/


select 'Select distinct '''||protocol||''',count(*) from '||protocol||'.Crf_Trk_Page_Update a
where a.PAGE_IS_LOGGED = (select distinct c.Page_Is_Logged from '||protocol||'.Crf_Trk_Page_Update c where 
c.subjkey = a.subjkey and c.page_is_logged = a.Page_Is_Logged)
group by subjkey;'
from
(select a.protocol from cts.cts_protocols a, ctsdd.panel b where a.protocol not like 'TEST_%'
and b.protocol = a.protocol and b.panel ='CRF_TRK_PAGE')



/*Select distinct 'xxxxx',count(*) from A1030480.Crf_Trk_Page_Update a
where a.PAGE_IS_LOGGED = (select distinct c.Page_Is_Logged from xxxxx.Crf_Trk_Page_Update c where
c.subjkey = a.subjkey and c.page_is_logged = a.Page_Is_Logged)
group by subjkey;*/


/*select 'Select distinct '''||protocol||''',count(*) 
from '||protocol||'.Crf_Trk_Page_Update a
where a.PAGE_IS_LOGGED = (select distinct c.Page_Is_Logged 
from '||protocol||'.Crf_Trk_Page_Update c where 
c.subjkey = a.subjkey and c.page_is_logged = a.Page_Is_Logged)
group by subjkey;'
from
(select a.protocol from cts.cts_protocols a, ctsdd.panel b 
where a.protocol not like 'TEST_%'
and b.protocol = a.protocol and b.panel ='CRF_TRK_PAGE')
/*/
