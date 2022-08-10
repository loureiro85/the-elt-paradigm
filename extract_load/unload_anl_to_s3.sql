unload ('SELECT * FROM "company"."analytics"."anl_location";')
to 's3://company-challenge-loureiro85/anl_location_'
iam_role 'arn:aws:iam::123462031101:role/dbt-s3-redshift-company'
parallel off
delimiter ','
header;