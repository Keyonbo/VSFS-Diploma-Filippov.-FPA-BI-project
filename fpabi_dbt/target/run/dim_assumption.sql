 -- noqa: Should accept a string instead of a integer
    
    
    
    create table FPABI.DBT_RAW.dim_assumption (ASSUMPTION_CODE VARCHAR,ASSUMPTION_NAME VARCHAR,GRAIN VARCHAR,OWNER VARCHAR,UNIT VARCHAR)
  ;
    -- dbt seed --
    
            insert into FPABI.DBT_RAW.dim_assumption (ASSUMPTION_CODE, ASSUMPTION_NAME, GRAIN, OWNER, UNIT) values
            (%s,%s,%s,%s,%s)
        

;
  