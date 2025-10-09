select
    id as customer_id,
    first_name,
    last_name
from {{source('dbt_ohalfman', 'jaffle_shop_customers')}}