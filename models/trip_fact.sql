with trips as (

select 
ride_id,
rideable_type,
date(to_timestamp(started_at)) as trip_date,
start_station_id,
END_STATION_ID,
MEMBER_CASUAL,
timestampdiff(second, to_timestamp(started_at), to_timestamp(ended_at)) as trip_duration_seconds

from {{ source('demo', 'bike') }}

where RIDE_ID != 'ride_id'




)

select 
*
from trips