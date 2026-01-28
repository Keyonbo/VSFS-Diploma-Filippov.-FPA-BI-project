
    
    

select
    reservation_id as unique_field,
    count(*) as n_records

from FPABI.DBT_CORE.fct_reservation
where reservation_id is not null
group by reservation_id
having count(*) > 1


