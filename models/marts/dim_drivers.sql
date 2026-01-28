{{ config(materialized='table') }}

with drivers as (
    select * from {{ ref('stg_f1_drivers') }}
)

select
    driver_id,
    full_name,
    nationality,
    birth_date,
    date_diff('year', birth_date, current_date) as age_years
from drivers