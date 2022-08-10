# The ETL Paradigm
The ELT paradigm shifts from ET+L from EL+T. Transformation occurs after data has been extracted and loaded to a cloud Data Warehouse. AWS S3 and AWS Redshift are used for Extraction and Loading, and DBT is used for Transformation. CloudFormation is used to provision data cloud resources.

# Process
Process:
1. Data Understanding - Jupyter Notebook
2. Data Infrastructure provisioning and Loading - AWS S3, Redshift, Security Groups, CloudFormation
3. Data Modeling - DBT cloud
4. Data Visualization - Google Data Studio

## 1. Data Understanding
Data understanding was based on exploring the provided CSV file with Jupyter Notebooks (`/notebooks`).
Duplicated rows and columns were identified.
`Company_id` was identified as primary_key.

## 2. Data Infrastructure Provisioning and Loading

- Provision S3 bucket, Redshift cluster, Security Groups, etc. with DBT CloudFormation template (`/cloud_formation_templates/create-dbtworkshop-infr.yml`)
- Load CSV files to S3 bucket (`/data/raw`). * Data folder would normally be ignored from git. It`s synchronized for the ease of sharing in the context of this challenge.
- Create database schemas, namely `internal` and `external` (`/extract_load/create_schemas.sql`)
- Create tables (`/extract_load/create_table.sql`)
- Copy data from CSV in S3 to tables in Redshift (`/extract_load/copy_from_s3.sql`)
- At this point, a Redshift instance was created and data was loaded to it from S3.
- Add inbound rules to a security group to allow Redshift Access to Google Data Studio

## 3. Data Modeling
Data was modeled with DBT source and model files (`.sql` and `.yml` in `/models`).

Additional sources were added, namely:
- us_cities.csv - containing latitude and longitude coordinates (among other fields) for US cities
- calendar.csv - containing date dimension fields

## 4. Data Visualization
Analyzes were created based on dimensions.
The following analyzes were made:
- Location
- Pickup State
- Lane
- Weekday
- Delay
- Time
- Equipment
- Carrier Rating


# Next steps
This is the first version of the ELT process and dashboard.
There is certainly room for improvement.
I appreciate all feedback.

Next steps:
- Collect feedback from Company experts
  - Analytics Engineer - To validate, improve, and learn best practices
  - Data Analyst - To understand value
  - Data Engineer - To understand data infrastructure and available data
- Clean up analytics tables that source the dashboard
- Apply Company best practices, regarding:
  - project structure
  - database schema
  - naming
  - testing
  - commit
  - documentation
  - analytics dataset
  - dashboard connection
- Experiment DBT CLI
- Study DBT seeds and snapshots

# References
- [dbt Fundamentals course](https://courses.getdbt.com/courses/fundamentals)
- [us_cities.csv](https://raw.githubusercontent.com/kelvins/US-Cities-Database/main/csv/us_cities.csv)
- [geotargets-2022-06-02.csv](https://raw.githubusercontent.com/kelvins/US-Cities-Database/main/csv/us_cities.csv)

# Final thoughts
I had a great time working on this challenge.
I learned a lot from it and feel every minute of working on it was worth it.
Learning DBT was in by backlog study list. I'm glad I learned it.
DBT enables shifting from the ETL to ELT paradigm, due to DBT and Redshift cloud connection.
DBT tests helped me to identify and fix non-unique keys in the city_state column of US cities.
DBT lineage functionality helped to refactor models as it indicated dependencies among them.

Also, I'm a huge fan of YAML files as they bridge the gap between humans and computers.
It was pleasant to notice how easily tests and documentation are created in DBT with YAML files.

Gui
