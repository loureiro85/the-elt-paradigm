select count(distinct(city_state)) from {{ ref('dim_us_cities') }}
union
select count(city_state) from {{ ref('dim_us_cities') }}
