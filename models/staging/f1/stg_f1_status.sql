{{ config(materialized='view') }}

with raw_status as (
    select * from {{ source('f1_raw', 'status') }}
)

select
    cast(statusId as integer) as status_id,
    status as status_description
from raw_status