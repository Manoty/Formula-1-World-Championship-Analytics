{{ config(materialized='table') }}

with raw_drivers as (
    select * from {{ source('f1_raw', 'drivers') }}
)

select
    cast(driverId as integer) as driver_id,
    driverRef as driver_slug,
    forename || ' ' || surname as full_name,
    nationality,
    -- Now we can safely handle the string
    case 
        when dob = '\N' or dob = '' then null 
        else dob 
    end as birth_date_string
from raw_drivers