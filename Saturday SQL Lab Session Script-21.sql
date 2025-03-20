---total web events
select count(account_id) from web_events;
---unique accounts with web events
select distinct count(account_id) from web_events;
---top 5 most used channels
select channel,count(channel) as total_events
from web_events
group by channel
order by count(channel) desc 
limit 5;
---web events happening per month in 2016
select DATE_TRUNC('MONTH',occurred_at) as month, 
count(*) as count_of_events
from web_events
where occurred_at between '2016-01-01' and '2016-12-31'
group by month
order by month;
---account with the most web_events
select account_id, count(account_id) as number_of_events
from web_events
group by account_id 
order by account_id desc
limit 1;
---1st and last recorded web_event
select max(occurred_at) as first_web_event, min(occurred_at) as last_web_event
from web_events;
---channels with >100 events
select channel,count(account_id)
from web_events
group by channel 
having count(account_id)>100
order by count(account_id) desc;
---number of web events occuring on weekends
select count(occurred_at) as weekend_events
from web_events
where extract(DOW from occurred_at) in (0,6);
---number of web events happening in the first quarter of 2016
select count(occurred_at) as first_quarter_events
from web_events
where occurred_at between '2016-01-01' and '2016-04-30';
----
	select count(*)

---which account had the earliest web event
