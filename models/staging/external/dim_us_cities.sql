select *,

city || ',' ||state_code as city_state

 from {{ source('external', 'us_cities') }}

where city=county -- drop duplicated cities 
and city_state is not null
