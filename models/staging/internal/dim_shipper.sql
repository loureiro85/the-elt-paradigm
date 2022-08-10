select 
    split_part(shipper_name, 'Shipper ', 2)::integer as shipper_id,
    shipper_name
from (
    select distinct shipper_name
    from {{ ref('fct_pre_processed') }}
    where shipper_name != ' '
    )
order by shipper_id