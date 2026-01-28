{{ config(materialized='table') }}

-- Conformed product dimension (SCD1 in this demo).
select
  product_id::number as product_id,
  product_code,
  product_name,
  product_category
from {{ source('raw','dim_product') }}
