{{ config(materialized='view') }}

with raw_results as (
    select * from {{ source('f1_raw', 'results') }}
)

select
    cast(resultId as integer) as result_id,
    cast(raceId as integer) as race_id,
    cast(driverId as integer) as driver_id,
    cast(constructorId as integer) as constructor_id,
    -- try_cast handles cases where the data might be blank or weird
    try_cast(grid as integer) as start_position,
    try_cast(position as integer) as finish_position,
    cast(points as float) as points_scored,
    cast(laps as integer) as laps_completed,
    cast(statusId as integer) as status_id
from raw_results