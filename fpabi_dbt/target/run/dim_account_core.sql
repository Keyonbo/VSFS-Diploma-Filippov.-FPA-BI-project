
  
    

        create or replace transient table FPABI.DBT_CORE.dim_account_core
         as
        (

-- Conformed account dimension (SCD1 in this demo).
select
  account_id::number as account_id,
  account_code,
  account_name,
  statement,
  account_group
from FPABI.DBT_RAW.dim_account
        );
      
  