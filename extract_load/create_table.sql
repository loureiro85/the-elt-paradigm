CREATE TABLE external.us_cities(
  id integer,
  state_code varchar(2),
  state_name varchar(50),
  city varchar(50),
  county varchar(50),
  latitude decimal(8, 6),
  longitude decimal(9, 6),
  _loaded_at timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
);

CREATE TABLE internal.data_challenge(
  company_id integer,
  lane varchar,
  quote_date timestamp,
  book_date timestamp,
  source_date timestamp,
  pickup_date timestamp,
  delivery_date timestamp,
  book_price REAL,
  source_price REAL,
  pnl REAL,
  mileage REAL,
  equipment_type varchar,
  carrier_rating real,
  sourcing_channel varchar,
  vip_carrier boolean,
  carrier_dropped_us_count real,
  carrier_name varchar,
  shipper_name varchar,
  carrier_on_time_to_pickup boolean,
  carrier_on_time_to_delivery boolean,
  carrier_on_time_overall boolean,
  pickup_appointment_time timestamp,
  delivery_appointment_time timestamp,
  has_mobile_app_tracking boolean,
  has_macropoint_tracking boolean,
  has_edi_tracking boolean,
  contracted_load boolean,
  load_booked_autonomously boolean,
  load_sourced_autonomously boolean,
  load_was_cancelled boolean,
  _loaded_at timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(company_id)
);

DROP TABLE external.calendar CASCADE;

CREATE TABLE external.calendar(
  date_id BIGINT,
  date date,
  year integer,
  MONTH integer,
  month_name varchar,
  weekday integer,
  weekday_name varchar,
  month_day integer,
  week integer,
  quarter integer,
  semester integer,
  YEAR_MONTH varchar,
  PRIMARY KEY(date_id)
);