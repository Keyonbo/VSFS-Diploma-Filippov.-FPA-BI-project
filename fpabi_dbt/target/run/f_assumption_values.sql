 -- noqa: Should accept a string instead of a integer
    
    
    
    create table FPABI.DBT_RAW.f_assumption_values (ASSUMPTION_ID bigint,ASSUMPTION_CODE VARCHAR,WEEK_KEY bigint,VALUE FLOAT)
  ;
    -- dbt seed --
    
            insert into FPABI.DBT_RAW.f_assumption_values (ASSUMPTION_ID, ASSUMPTION_CODE, WEEK_KEY, VALUE) values
            (%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s)
        

;
  