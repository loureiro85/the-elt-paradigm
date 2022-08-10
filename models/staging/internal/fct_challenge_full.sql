select 
round((pnl/book_price) * 100, 1) as pnl_percent,
split_part(shipper_name, 'Shipper ', 2)::integer as shipper_id,
split_part(carrier_name, 'Carrier ', 2)::integer as carrier_id,
lane as lane_id,
*

from {{ ref('fct_pre_processed') }}
limit 10