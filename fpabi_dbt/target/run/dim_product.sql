 -- noqa: Should accept a string instead of a integer
    
    
    
    create table FPABI.DBT_RAW.dim_product (PRODUCT_ID bigint,PRODUCT_CODE VARCHAR,PRODUCT_NAME VARCHAR,PRODUCT_CATEGORY VARCHAR)
  ;
    -- dbt seed --
    
            insert into FPABI.DBT_RAW.dim_product (PRODUCT_ID, PRODUCT_CODE, PRODUCT_NAME, PRODUCT_CATEGORY) values
            (%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s)
        

;
  