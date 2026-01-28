use role ACCOUNTADMIN;

-- Create a small warehouse for dbt + Power BI
create or replace warehouse FPABI_WH
  warehouse_size = 'XSMALL'
  auto_suspend = 60
  auto_resume = true
  initially_suspended = true;

-- Create the project database
create or replace database FPABI;

-- Create project roles
create or replace role FPABI_DBT_ROLE;
create or replace role FPABI_PBI_ROLE;

-- Grants for dbt role (builds schemas/tables/views)
grant usage on warehouse FPABI_WH to role FPABI_DBT_ROLE;
grant usage, create schema on database FPABI to role FPABI_DBT_ROLE;

-- Grants for Power BI role (read-only)
grant usage on warehouse FPABI_WH to role FPABI_PBI_ROLE;
grant usage on database FPABI to role FPABI_PBI_ROLE;

-- Create users (username + password auth)
create or replace user DBT_USER
  password = 'lKx^4j^B#P&fYs!aQ(%Y'
  default_role = FPABI_DBT_ROLE
  default_warehouse = FPABI_WH
  must_change_password = false;

create or replace user PBI_USER
  password = '+SCH9XNem_uppgsf6Kk1'
  default_role = FPABI_PBI_ROLE
  default_warehouse = FPABI_WH
  must_change_password = false;

grant role FPABI_DBT_ROLE to user DBT_USER;
grant role FPABI_PBI_ROLE to user PBI_USER;

-- Create schemas upfront (layered architecture)
create schema if not exists FPABI.RAW;
create schema if not exists FPABI.STG;
create schema if not exists FPABI.CORE;
create schema if not exists FPABI.MART;

-- Allow Power BI to read everything we will build
grant usage on schema FPABI.RAW  to role FPABI_PBI_ROLE;
grant usage on schema FPABI.STG  to role FPABI_PBI_ROLE;
grant usage on schema FPABI.CORE to role FPABI_PBI_ROLE;
grant usage on schema FPABI.MART to role FPABI_PBI_ROLE;

grant select on all tables in schema FPABI.RAW  to role FPABI_PBI_ROLE;
grant select on all tables in schema FPABI.STG  to role FPABI_PBI_ROLE;
grant select on all tables in schema FPABI.CORE to role FPABI_PBI_ROLE;
grant select on all tables in schema FPABI.MART to role FPABI_PBI_ROLE;

grant select on future tables in schema FPABI.RAW  to role FPABI_PBI_ROLE;
grant select on future tables in schema FPABI.STG  to role FPABI_PBI_ROLE;
grant select on future tables in schema FPABI.CORE to role FPABI_PBI_ROLE;
grant select on future tables in schema FPABI.MART to role FPABI_PBI_ROLE;

grant select on future views in schema FPABI.STG  to role FPABI_PBI_ROLE;
grant select on future views in schema FPABI.CORE to role FPABI_PBI_ROLE;
