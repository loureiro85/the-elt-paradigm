select
    count(*)
from(
    select 
    location_id,
    latitude,
    longitude,
    split_part(location_id, ',', 1) as city, 
    split_part(location_id, ',', 2) as state_code

    from {{ ref('stg_distinct_location') }} 
    left join {{ ref('dim_us_cities') }} 
    on {{ ref('dim_us_cities') }}.city_state={{ ref('stg_distinct_location') }}.location_id

    order by location_id
    )


-- select count(*)     from {{ ref('stg_distinct_location') }} 