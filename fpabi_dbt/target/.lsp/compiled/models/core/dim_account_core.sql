

-- Conformed account dimension (SCD1 in this demo).
select
  account_id::number as account_id,
  account_code,
  account_name,
  statement,
  account_group
from FPABI.RAW.dim_account