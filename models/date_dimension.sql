WITH CTE AS (
select 
to_timestamp (started_at) as started_at,
date(to_timestamp (started_at)) as date_started_at,
hour(to_timestamp (started_at)) as hour_started_at,

case
when dayname (to_timestamp (started_at)) in ('sat','sun')
then 'weekends'
else 'businessday'
end as day_type,

case
when month (to_timestamp (started_at)) in ('12','1','2')
then 'winter'
when  month (to_timestamp (started_at)) in ('3','4')
then 'spring'
when  month (to_timestamp (started_at)) in ('5','6','7')
then 'summer'
else 'autumn'
end as station_of_Year


from 
{{ source('demo', 'bike') }}
where started_at != 'started_at'

)

select 
*
from 
CTE