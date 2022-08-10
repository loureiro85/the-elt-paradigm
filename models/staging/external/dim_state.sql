select
    distinct state_code as state_id,
    state_name 
from {{ ref('dim_us_cities') }}