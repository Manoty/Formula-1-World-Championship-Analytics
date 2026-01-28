with race_results as (
    select * from {{ ref('int_race_results_joined') }}
),

-- Step 1: Calculate cumulative points per driver per season
point_totals as (
    select
        race_year,
        race_date,
        race_name,
        driver_name,
        team_name,
        points_scored,
        sum(points_scored) over (
            partition by race_year, driver_name 
            order by race_date
        ) as cumulative_points
    from race_results
),

-- Step 2: Rank drivers based on those cumulative points
final_standings as (
    select
        *,
        rank() over (
            partition by race_year, race_date 
            order by cumulative_points desc
        ) as standing_rank
    from point_totals
)

select * from final_standings
order by race_year desc, race_date desc, standing_rank asc