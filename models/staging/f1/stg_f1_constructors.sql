{{ config(materialized='view') }}

with raw_constructors as (
    select * from {{ source('f1_raw', 'constructors') }}
)

select
    cast(constructorId as integer) as constructor_id,
    constructorRef as constructor_slug,
    name as constructor_name,
    nationality as constructor_nationality,
    url as wikipedia_url
from raw_constructors