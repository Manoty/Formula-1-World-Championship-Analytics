{{ config(materialized='view') }}

with raw_races as (
    select * from {{ source('f1_raw', 'races') }}
)

select
    cast(raceId as integer) as race_id,
    cast(year as integer) as race_year,
    round as race_round,
    name as race_name,
    cast(date as date) as race_date
from raw_races