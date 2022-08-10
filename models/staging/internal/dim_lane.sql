select * from {{ ref('stg_lane') }}

left join 
    (select 
        location_id as delivery_location,
        lat_long as delivery_lat_long
    from {{ ref('dim_location') }}) as delivery
using(delivery_location)

left join 
    (select 
        location_id as pickup_location,
        lat_long as pickup_lat_long
    from {{ ref('dim_location') }}) as pickup
using(pickup_location)

order by lane_id