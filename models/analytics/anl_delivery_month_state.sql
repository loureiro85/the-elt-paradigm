select
    delivery_month,
    delivery_state,
    count(*) as load_count,
    count(distinct pickup_state) as total_pickup_state,
    round(sum(book_price), 2) as total_book_price,
    round(sum(source_price), 2) as total_source_price,
    round(sum(pnl), 2) as total_pnl,
    round(avg(pnl_percent), 2) as avg_pnl_percent
from {{ ref('fct_full') }}
group by delivery_month, delivery_state
order by delivery_month, delivery_state