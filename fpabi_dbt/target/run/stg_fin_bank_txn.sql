
  create or replace   view FPABI.DBT_STG.stg_fin_bank_txn
  
   as (
    

-- Staging model for bank transactions (seeded CSV in this demo).
with src as (
  select * from FPABI.DBT_RAW.f_bank_txn
)
select
  bank_txn_id,
  to_date(to_varchar(date_key), 'YYYYMMDD') as txn_date,
  date_key,
  entity_id,
  txn_type,
  amount::number(18,2) as amount,
  currency
from src
  );

