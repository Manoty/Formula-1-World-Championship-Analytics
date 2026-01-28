with results as (
    select * from {{ ref('stg_f1_results') }}
),

races as (
    select * from {{ ref('stg_f1_races') }}
),

drivers as (
    select * from {{ ref('stg_f1_drivers') }}
),

constructors as (
    select * from {{ ref('stg_f1_constructors') }}
),

status as (
    select * from {{ ref('stg_f1_status') }}
)

select
    -- Primary Key from Results
    results.result_id,
    
    -- Race Info
    races.race_year,
    races.race_name,
    races.race_date,
    
    -- Driver Info
    drivers.full_name as driver_name,
    drivers.nationality as driver_nationality,
    
    -- Team Info
    constructors.constructor_name as team_name,
    
    -- Performance Stats
    results.start_position,
    results.finish_position,
    results.points_scored,
    results.laps_completed,
    
    -- Status (Did they finish or crash?)
    status.status_description,
    
    -- Calculated Field: Position Gained/Lost
    (results.start_position - results.finish_position) as positions_gained

from results
left join races on results.race_id = races.race_id
left join drivers on results.driver_id = drivers.driver_id
left join constructors on results.constructor_id = constructors.constructor_id
left join status on results.status_id = status.status_id