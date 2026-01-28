{{ config(materialized='table') }}

with drivers as (
    select * from {{ ref('stg_f1_drivers') }}
)

select
    driver_id,
    full_name,
    nationality,
    try_cast(birth_date_string as date) as birth_date,
    date_diff('year', try_cast(birth_date_string as date), current_date) as age_years
from drivers