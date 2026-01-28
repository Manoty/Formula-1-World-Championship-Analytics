{{ config(materialized='view') }}

with raw_drivers as (
    -- Using the source macro to link to your drivers.csv
    select * from {{ source('f1_raw', 'drivers') }}
)

select
    -- Primary Key
    cast(driverId as integer) as driver_id,
    
    -- Identifiers
    driverRef as driver_slug,
    
    -- Descriptive Info
    forename as first_name,
    surname as last_name,
    forename || ' ' || surname as full_name,
    nationality,
    
    -- Dates (Handling potential format issues)
    cast(nullif(dob, '\N') as date) as birth_date,
    
    -- Metadata
    url as wikipedia_url

from raw_drivers