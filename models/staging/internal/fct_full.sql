select 
    year_month_p as pickup_month,
    weekday_name_p as pickup_weekday,
    year_month_d as delivery_month,
    weekday_name_d as delivery_weekday,
    round((pnl/book_price) * 100, 1) as pnl_percent,
    *

from {{ ref('fct_pre_processed') }}

left join {{ ref('dim_lane') }}
on lane={{ ref('dim_lane') }}.lane_id

left join (
    select 
        date as date_p, 
        year_month as year_month_p, 
        weekday_name as weekday_name_p 
        from {{ ref('dim_calendar') }})
on date(pickup_date) = date_p

left join (
    select 
        date as date_d, 
        year_month as year_month_d, 
        weekday_name as weekday_name_d 
        from {{ ref('dim_calendar') }})
on date(delivery_date) = date_d

where book_price > 0


-- "51.5074,-0.1278"
