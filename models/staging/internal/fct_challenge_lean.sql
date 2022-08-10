select

company_id,

-- -- who
-- split_part(shipper_name, 'Shipper ', 2)::integer as shipper_id,
-- split_part(carrier_name, 'Carrier ', 2)::integer as carrier_id,

-- carrier_rating,
-- vip_carrier,
-- carrier_dropped_us_count,
-- carrier_on_time_to_pickup,
-- carrier_on_time_to_delivery,
-- carrier_on_time_overall

-- -- where
-- lane as lane_id,

-- -- how
-- equipment_type as equipment_id,
-- sourcing_channel as sourcing_channel_id,

-- when
quote_date,
book_date,
book_date - quote_date as book_delay,

source_date,
pickup_appointment_time,
pickup_date,
pickup_appointment_time - pickup_date as pickup_delay,

delivery_appointment_time,
delivery_date,
delivery_date - delivery_appointment_time as delivery_delay

-- -- fact
-- book_price,
-- source_price,
-- pnl,
-- round((pnl/book_price) * 100, 1) as pnl_percent,
-- mileage,


from {{ ref('fct_pre_processed') }}
limit 50