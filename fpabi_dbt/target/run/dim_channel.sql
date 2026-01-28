 -- noqa: Should accept a string instead of a integer
    
    
    
    create table FPABI.DBT_RAW.dim_channel (CHANNEL_ID bigint,CHANNEL_CODE VARCHAR,CHANNEL_NAME VARCHAR)
  ;
    -- dbt seed --
    
            insert into FPABI.DBT_RAW.dim_channel (CHANNEL_ID, CHANNEL_CODE, CHANNEL_NAME) values
            (%s,%s,%s),(%s,%s,%s),(%s,%s,%s),(%s,%s,%s)
        

;
  