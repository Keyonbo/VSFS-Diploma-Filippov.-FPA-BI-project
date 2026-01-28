

-- Staging model for reservation system sales lines (seeded CSV in this demo).
with src as (
  select * from FPABI.RAW.f_sales_line
)
select
  sales_line_id,
  to_date(to_varchar(date_key), 'YYYYMMDD') as sold_date,
  date_key,
  entity_id,
  customer_id,
  product_id,
  channel_id,
  qty::number as qty,
  net_unit_price::number(18,2) as net_unit_price,
  net_amount::number(18,2) as revenue_amount,
  cogs_amount::number(18,2) as cogs_amount,
  currency
from src