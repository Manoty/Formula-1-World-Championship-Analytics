{{ config(materialized='table') }}

with joined_results as (
    select * from {{ ref('int_race_results_joined') }}
)

select
    -- Create a unique key for the fact table
    md5(cast(result_id as varchar)) as fact_results_id,
    race_year,
    race_date,
    race_name,
    driver_name,
    team_name,
    start_position,
    finish_position,
    points_scored,
    positions_gained,
    -- Simple logic for a "Podium" flag
    case 
        when finish_position <= 3 then True 
        else False 
    end as is_podium
from joined_results