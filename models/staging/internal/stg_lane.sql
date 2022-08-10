select 
lane_id,
split_part(lane_id, ' -> ', 1) as pickup_location,
split_part(pickup_location, ',', 2) as pickup_state,
split_part(lane_id, ' -> ', 2) as delivery_location,
split_part(delivery_location, ',', 2) as delivery_state
from (
    select distinct(lane) as lane_id
    from {{ ref('fct_pre_processed') }}
    order by lane_id
    )
