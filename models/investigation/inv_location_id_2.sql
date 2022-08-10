select * from {{ ref('dim_us_cities') }}
where city_state = 'Roanoke,VA'

-- Roanoke,VA
-- Denver,CO