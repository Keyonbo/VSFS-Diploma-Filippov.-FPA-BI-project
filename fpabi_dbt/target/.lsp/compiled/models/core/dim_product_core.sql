

-- Conformed product dimension (SCD1 in this demo).
select
  product_id::number as product_id,
  product_code,
  product_name,
  product_category
from FPABI.RAW.dim_product