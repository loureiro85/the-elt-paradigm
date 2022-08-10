-- us_cities.csv
copy external.us_cities(
    ID,
    STATE_CODE,
    STATE_NAME,
    CITY,
    COUNTY,
    LATITUDE,
    LONGITUDE
)
FROM
    's3://company-challenge-loureiro85/us_cities.csv' iam_role 'arn:aws:iam::123462031101:role/dbt-s3-redshift-company' region 'us-east-1' delimiter ',' ignoreheader 1 acceptinvchars;

-- DataChallenge.csv
copy internal.data_challenge(
    company_id,
    lane,
    quote_date,
    book_date,
    source_date,
    pickup_date,
    delivery_date,
    book_price,
    source_price,
    pnl,
    mileage,
    equipment_type,
    carrier_rating,
    sourcing_channel,
    vip_carrier,
    carrier_dropped_us_count,
    carrier_name,
    shipper_name,
    carrier_on_time_to_pickup,
    carrier_on_time_to_delivery,
    carrier_on_time_overall,
    pickup_appointment_time,
    delivery_appointment_time,
    has_mobile_app_tracking,
    has_macropoint_tracking,
    has_edi_tracking,
    contracted_load,
    load_booked_autonomously,
    load_sourced_autonomously,
    load_was_cancelled
)
FROM
    's3://company-challenge-loureiro85/DataChallenge.csv' iam_role 'arn:aws:iam::123462031101:role/dbt-s3-redshift-company' region 'us-east-1' delimiter ',' ignoreheader 1 dateformat AS 'auto' timeformat AS 'auto' trimblanks removequotes acceptinvchars;

-- date.csv
copy external.calendar(
    date_id,
    date,
    year,
    month,
    month_name,
    weekday,
    weekday_name,
    month_day,
    week,
    quarter,
    semester,
    year_month
)
FROM
    's3://company-challenge-loureiro85/calendar.csv' iam_role 'arn:aws:iam::123462031101:role/dbt-s3-redshift-company' region 'us-east-1' delimiter ',' ignoreheader 1 acceptinvchars;