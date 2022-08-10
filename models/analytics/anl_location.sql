select
    pickup_month,
    delivery_month,
    dim_state_p.state_name as pickup_state,
    dim_state_d.state_name as delivery_state,
    book_price,
    source_price,
    pnl,
    pnl_percent
from {{ ref('fct_full') }}

left join {{ ref('dim_state') }} as dim_state_p
on dim_state_p.state_id = pickup_state

left join {{ ref('dim_state') }} as dim_state_d
on dim_state_d.state_id = delivery_state