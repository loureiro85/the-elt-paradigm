select

company_id,

-- -- when
quote_date,
book_date,
-- book_date - quote_date as book_delay,

-- source_date,
-- pickup_appointment_time,
pickup_date,
weekday_name as pickup_weekday_name,
-- pickup_appointment_time - pickup_date as pickup_delay,

-- delivery_appointment_time,
-- delivery_date,
-- delivery_date - delivery_appointment_time as delivery_delay,

-- fact
book_price,
source_price,
pnl,
round((pnl/book_price) * 100, 1) as pnl_percent,
mileage,

round(pnl/mileage, 3) as pnl_per_mile


from {{ ref('fct_pre_processed') }}
join {{ ref('dim_calendar') }}
on {{ ref('dim_calendar') }}.date={{ ref('fct_pre_processed') }}.pickup_date

where book_price > 0

order by quote_date
limit 50
