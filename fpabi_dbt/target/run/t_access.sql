 -- noqa: Should accept a string instead of a integer
    
    
    
    create table FPABI.DBT_RAW.t_access (USER_UPN VARCHAR,ROLE VARCHAR,ALLOWED_REGION_ID bigint,ALLOWED_COST_CENTER_ID bigint)
  ;
    -- dbt seed --
    
            insert into FPABI.DBT_RAW.t_access (USER_UPN, ROLE, ALLOWED_REGION_ID, ALLOWED_COST_CENTER_ID) values
            (%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s),(%s,%s,%s,%s)
        

;
  