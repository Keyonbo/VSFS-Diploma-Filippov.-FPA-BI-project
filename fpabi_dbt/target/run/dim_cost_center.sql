 -- noqa: Should accept a string instead of a integer
    
    
    
    create table FPABI.DBT_RAW.dim_cost_center (COST_CENTER_ID bigint,COST_CENTER_CODE VARCHAR,COST_CENTER_NAME VARCHAR)
  ;
    -- dbt seed --
    
            insert into FPABI.DBT_RAW.dim_cost_center (COST_CENTER_ID, COST_CENTER_CODE, COST_CENTER_NAME) values
            (%s,%s,%s),(%s,%s,%s),(%s,%s,%s),(%s,%s,%s)
        

;
  