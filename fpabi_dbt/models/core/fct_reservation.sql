{{ config(materialized='table') }}

-- Reservation-grain fact.
-- Demo assumption: we do not have a real reservation_id in seeds, so we use sales_line_id.
-- In production replace reservation_id with the booking/reservation identifier from the source system.
with s as (
  select * from {{ ref('stg_res_sales_line') }}
)
select
  sales_line_id as reservation_id,
  sold_date as reservation_date,
  date_key,
  entity_id,
  customer_id,
  product_id,
  entity_id,
  channel_id,
  qty,
  revenue_amount,
  cogs_amount,
  (revenue_amount - cogs_amount) as gross_margin_amount
from s
