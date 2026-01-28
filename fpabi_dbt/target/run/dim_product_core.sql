
  
    

        create or replace transient table FPABI.DBT_CORE.dim_product_core
         as
        (

-- Conformed product dimension (SCD1 in this demo).
select
  product_id::number as product_id,
  product_code,
  product_name,
  product_category
from FPABI.DBT_RAW.dim_product
        );
      
  