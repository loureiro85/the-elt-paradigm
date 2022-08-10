select
    pickup_lat_long,
    delivery_lat_long,
    book_price,
    source_price,
    pnl,
    pnl_percent
from {{ ref('fct_full') }}
where pickup_lat_long is not null or delivery_lat_long is not null

-- This is still a proof of concept. 
-- There are a lot of NULL in lat_long fields.
-- The external us_cities.csv is not providing complete joins.
