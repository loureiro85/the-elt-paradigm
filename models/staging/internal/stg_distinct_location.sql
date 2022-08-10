select distinct(pickup_location) as location_id
from {{ ref('stg_lane') }}
union
select distinct(delivery_location)
from {{ ref('stg_lane') }}

order by location_id    
