{{ config(materialized='view') }}

select * 
from {{ ref('stg_red_sox_players') }}
limit 5 