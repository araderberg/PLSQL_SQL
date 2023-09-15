select protocol, Reason, Moddate, Moduser from cts.protocol_lock_history
where substr(moddate,8,4)='2008' and action = 1
order by moddate


/*select Protocol, moddate Lock_date from cts.protocol_lock_history
--substr(moddate,8,4)='2008' 
--action = 1
where protocol in('xxxx','xxxxx','xxxxxx')
order by protocol, moddate*/

/*select a.Protocol, a.moddate Lock_date, '' Unlock_date from cts.protocol_lock_history a
where a.protocol in('xxxx','xxxxx','xxxxxx')
and a.action = 1
minus              
select b.Protocol, '' Lock_date, b.moddate Unlock_date from cts.protocol_lock_history b
where b.protocol in('xxxx','xxxxx','xxxxxx')
and b.moddate in (select moddate from cts.protocol_lock_history where action =0)
order by protocol*/


/*select a.protocol, TO_CHAR(a.moddate, 'DD-MON-YYYY fmHH:MI:SS AM') LOCK_DATES,  nvl('','------') UNLOCK_DATES
from cts.protocol_lock_history a
where a.action = 1 and a.protocol in('xxxx','xxxxx','xxxxxx')
UNION ALL
select b.protocol, nvl('','------') LOCK_DATES, TO_CHAR(b.moddate, 'DD-MON-YYYY fmHH:MI:SS AM') UNLOCK_DATES
from cts.protocol_lock_history b
where b.action = 0 and b.protocol in('xxxx','xxxxx','xxxxxx')
and b.moddate in(select moddate from cts.protocol_lock_history c where c.action =0)
order by protocol*/

