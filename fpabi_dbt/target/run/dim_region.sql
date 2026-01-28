 -- noqa: Should accept a string instead of a integer
    
    
    
    create table FPABI.DBT_RAW.dim_region (REGION_ID bigint,REGION_CODE VARCHAR,REGION_NAME VARCHAR)
  ;
    -- dbt seed --
    
            insert into FPABI.DBT_RAW.dim_region (REGION_ID, REGION_CODE, REGION_NAME) values
            (%s,%s,%s),(%s,%s,%s),(%s,%s,%s)
        

;
  