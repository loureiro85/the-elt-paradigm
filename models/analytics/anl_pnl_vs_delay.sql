select

-- id
company_id,

-- y
pnl,
book_price,
mileage,
round(pnl/book_price, 3) as pnl_per_book_price,
round(pnl/mileage, 3) as pnl_per_mile,

-- x
extract(minute from (book_date - quote_date)) as book_delay,
extract(minute from (pickup_appointment_time - pickup_date)) as pickup_delay,
extract(minute from (delivery_date - delivery_appointment_time)) as delivery_delay

from {{ ref('fct_pre_processed') }}

where book_price > 0 and mileage > 0

order by quote_date
