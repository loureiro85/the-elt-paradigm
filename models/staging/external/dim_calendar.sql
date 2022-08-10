select * from {{ source('external', 'calendar') }}
order by date_id