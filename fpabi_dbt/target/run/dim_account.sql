 -- noqa: Should accept a string instead of a integer
    
    
    
    create table FPABI.DBT_RAW.dim_account (ACCOUNT_ID bigint,ACCOUNT_CODE bigint,ACCOUNT_NAME VARCHAR,STATEMENT VARCHAR,ACCOUNT_GROUP VARCHAR)
  ;
    -- dbt seed --
    
            insert into FPABI.DBT_RAW.dim_account (ACCOUNT_ID, ACCOUNT_CODE, ACCOUNT_NAME, STATEMENT, ACCOUNT_GROUP) values
            (%s,%s,%s,%s,%s),(%s,%s,%s,%s,%s),(%s,%s,%s,%s,%s),(%s,%s,%s,%s,%s),(%s,%s,%s,%s,%s),(%s,%s,%s,%s,%s),(%s,%s,%s,%s,%s),(%s,%s,%s,%s,%s),(%s,%s,%s,%s,%s),(%s,%s,%s,%s,%s),(%s,%s,%s,%s,%s),(%s,%s,%s,%s,%s)
        

;
  