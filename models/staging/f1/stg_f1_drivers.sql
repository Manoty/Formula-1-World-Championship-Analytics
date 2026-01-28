{{ config(materialized='view') }}

with raw_drivers as (
    select * from {{ source('f1_raw', 'drivers') }}
)

select
    cast(driverId as integer) as driver_id,
    driverRef as driver_slug,
    forename || ' ' || surname as full_name,
    nationality,
    -- No CASE needed! DuckDB already turned \N into a proper NULL
    try_cast(dob as date) as birth_date
from raw_drivers