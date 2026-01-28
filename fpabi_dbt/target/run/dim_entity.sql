 -- noqa: Should accept a string instead of a integer
    
    
    
    create table FPABI.DBT_RAW.dim_entity (ENTITY_ID bigint,ENTITY_CODE VARCHAR,ENTITY_NAME VARCHAR,BASE_CURRENCY VARCHAR)
  ;
    -- dbt seed --
    
            insert into FPABI.DBT_RAW.dim_entity (ENTITY_ID, ENTITY_CODE, ENTITY_NAME, BASE_CURRENCY) values
            (%s,%s,%s,%s),(%s,%s,%s,%s)
        

;
  